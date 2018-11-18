package cn.edu.cup.os4Data

import cn.edu.cup.dictionary.DataDictionary
import cn.edu.cup.dictionary.DataItem
import cn.edu.cup.dictionary.DataKey
import cn.edu.cup.dictionary.DataKeyType
import cn.edu.cup.system.JsFrame
import grails.converters.JSON
import grails.validation.ValidationException
import groovy.xml.MarkupBuilder
import groovy.xml.StreamingMarkupBuilder

import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.NO_CONTENT
import static org.springframework.http.HttpStatus.OK

class Operation4DataController {

    def dataDictionaryService
    def dataKeyService
    def dataItemService
    def treeViewService

    //==================================================================================================================
    // 有关DataItem的处理

    /*
    * 保存数据项
    * */

    def saveDataItem(DataItem dataItem) {
        if (dataItem == null) {
            notFound()
            return
        }

        try {
            dataItemService.save(dataItem)
        } catch (ValidationException e) {
            respond dataItem.errors, view: 'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'dataItem.label', default: 'DataItem'), dataItem.id])
                redirect(action: "index")
                //redirect dataItem
            }
            '*' { respond dataItem, [status: CREATED] }
        }
    }

    /*
    *  创建数据项
    * */

    def createDataItem(DataKey dataKey) {
        println("createDataItem ${params}")
        DataItem dataItem = getNewDataItem(dataKey)

        // 缺省的情况
        def useStaticTemplate = false
        def view = 'createDataItem'
        String responseText
        // 如果有生成的视图，就是用生成的静态视图
        def dataKeyViewFileName = dataKeyViewFileName(dataKey)
        def dataKeyViewFile = new File(dataKeyViewFileName)
        if (dataKeyViewFile.exists()) {
            def template = new groovy.text.StreamingTemplateEngine().createTemplate(dataKeyViewFile.text)
            responseText = template.make([dataItem: dataItem])
            useStaticTemplate = true
        }
        // 如果用户指定，使用用户指定的
        if (params.view) {
            view = params.view
        }

        if (request.xhr) {
            if (useStaticTemplate) {
                render(responseText)
            } else {
                render(template: view, model: [dataItem: dataItem])
            }
        } else {
            respond dataItem
        }
    }

    private def dataKeyViewFileName(DataKey dataKey) {
        def nowPath = this.class.getResource("/").getPath()
        //def actionName = this.getActionName()
        def controllerName = this.controllerName
        return "${nowPath}${controllerName}/${dataKey.id}/_dataKey_${dataKey.id}.gsp"
        //return "${nowPath}${controllerName}/_dataKey_${dataKey.id}.gsp"
    }

    private DataItem getNewDataItem(DataKey dataKey) {
        def dataItem = new DataItem(dataKey: dataKey)
        def newSubItems = []
        dataKey.subDataKeys.each { e ->
            def item = new DataItem(
                    dataKey: e,
                    upDataItem: dataItem
            )
            newSubItems.add(item)
        }
        dataItem.subDataItems = newSubItems
        dataItem
    }

    /*
    *  数据项的列表
    * */

    def listDataItem(DataKey dataKey) {
        println("listDataItem: ${params}")
        def count = DataItem.countByDataKey(dataKey)
        def dataItemList
        def offset = Integer.parseInt(params.offset)
        if (count > offset) {
            dataItemList = DataItem.findAllByDataKey(dataKey, params)
        } else {
            dataItemList = DataItem.findAllByDataKey(dataKey)
        }
        println("查询结果：${dataKey} -- ${count}:  ${dataItemList}")
        if (request.xhr) {
            render(template: 'listDataItem', model: [dataItemList: dataItemList])
        } else {
            respond dataItemList
        }
    }

    /*
    *  数据项统计
    * */

    def countDataItem(DataKey dataKey) {
        def count = DataItem.countByDataKey(dataKey)
        println("统计结果：${count} ${dataKey}")
        def result = [count: count]
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    //==================================================================================================================
    // 有关DataKeyA的处理

    /*
    * 下载输入模板
    * 要手动创建main/webapp目录，这样dir = request.getRealPath("/")才能找到该目录
    * 创建文件的时候，
    * */

    def downloadViewTemplate(DataKey dataKey) {
        def fileName = dataKeyViewFileName(dataKey)
        def file = new File(fileName)
        def dir = file.getParentFile()
        if (!dir.exists()) {
            if (dir.mkdir()) {
                println("创建目录${dir}")
            } else {
                println("怎么出错了呢？${dir}")
            }
        }
        printf("生成输入模板%s\n", [fileName])
        def outString = createDataItemViewTemplate(dataKey)
        def printer = new File(fileName).newPrintWriter('utf-8')    //写入文件
        printer.println(outString.toString())
        printer.close()

        redirect(action: "index")
    }

    def createDataItemViewTemplate(DataKey dataKey) {
        def dataItem = getNewDataItem(dataKey)
        //def builder = new StreamingMarkupBuilder()
        def viewString = new StringWriter()
        def builder = new MarkupBuilder(viewString)
        def aux = [:]
        dataItem.subDataItems.eachWithIndex { DataItem entry, int i ->
            switch (entry.dataKey.dataKeyType) {
                case DataKeyType.dataKeyEnum:
                    def list = entry.dataKey?.enumItems()
                    List tmp = getQuotationList(list)
                    aux.i = tmp
                    break;
                case DataKeyType.dataKeyRef:
                    def refDataKeyId = 0
                    if (entry.dataKey.appendParameter != "") {
                        refDataKeyId = Integer.parseInt(entry.dataKey.appendParameter)
                    }
                    def list = []
                    if (refDataKeyId > 0) {
                        list = DataItem.findAllByDataKey(dataKeyService.get(refDataKeyId))
                    }
                    List tmp = getQuotationList(list)
                    aux.i = tmp
                    break
                case DataKeyType.dataKeyNormal:
                    break
                case DataKeyType.dataKeyDate:
                    break
                case DataKeyType.dataKeyDateTime:
                    break
                case DataKeyType.dataKeyFile:
                    break
            }
        }
        //def viewString = builder.bind {
        //'?xml'(version:"1.0", encoding:"UTF-8")
        builder.setDoubleQuotes(true)
        builder.div(id: "create-dataItem", class: "content scaffold-create", role: "main") {
            h1("静态生成的模板")
            builder.form(action: "operation4Data/saveDataItem", method: "post") {
                fieldset(class: "form") {
                    // 主关键字描述
                    table {
                        "f:with"(bean: "dataItem") {
                            tr {
                                td {
                                    label("${dataKey}")
                                }
                                td {
                                    "g:hiddenField"(name: "dataKey.id", value: "${dataItem.dataKey.id}")
                                }
                            }
                        }
                    }
                    // 子关键字
                    table {
                        dataItem.subDataItems.eachWithIndex { DataItem entry, int i ->
                            tr {
                                td {
                                    label("${dataItem.subDataItems[i].dataKey.dataTag}")
                                    "g:hiddenField"(name: "subDataItems[${i}].dataKey.id", value: "${dataItem.subDataItems[i].dataKey.id}")
                                    "g:hiddenField"(name: "subDataItems[${i}].upDataItem.id", value: "${dataItem.id}")
                                }
                                switch (entry.dataKey.dataKeyType) {
                                    case DataKeyType.dataKeyNormal:
                                        td {
                                            "g:textField"(name: "subDataItems[${i}].dataValue", id: "dataValue_${i}")
                                        }
                                        td {}
                                        break;
                                    case DataKeyType.dataKeyDate:
                                        td {
                                            input(type: "text", name: "subDataItems[${i}].dataValue", id: "dataValue_${i}", value: "${new java.util.Date()}", class: "datePicker")
                                        }
                                        td {}
                                        break
                                    case DataKeyType.dataKeyDateTime:
                                        td {
                                            input(type: "text", name: "subDataItems[${i}].dataValue", id: "dataValue_${i}", class: "dateTimePicker")
                                        }
                                        break;
                                    case DataKeyType.dataKeyEnum:
                                        td {
                                            //select(name: "subDataItems[${i}].dataValue", from:"${aux.i}", id: "dataValue_${i}")
                                            "g:select"(name: "subDataItems[${i}].dataValue", from: "${aux.i}", id: "dataValue_${i}")
                                        }
                                        td {}
                                        break;
                                    case DataKeyType.dataKeyFile:
                                        td {
                                            "g:textField"(name: "subDataItems[${i}].dataValue", id: "file_${i}")
                                        }
                                        td {
                                            "g:hiddenField"(name: "uploadFilePath", value: "${entry.dataKey.appendParameter}")
                                            "g:hiddenField"(name: "uploadFileDataKeyId", value: "${entry.dataKey.id}")
                                            "g:hiddenField"(name: "uploadFileIndex", value: "${i}")
                                            input(type: "file", name: "uploadFile", id: "input_${i}", onchange: "updateUploadFileName(${i})")
                                        }
                                        break;
                                    case DataKeyType.dataKeyRef:
                                        td {
                                            "g:select"(name: "subDataItems[${i}].dataValue",
                                                    from: "${aux.i}",
                                                    optionKey: "id",
                                                    noSelection: "\${['null': 'Select One...']}")
                                        }
                                        break;
                                }
                            }
                        }
                    }
                }
                fieldset(class: "buttons") {
                    //"g:submitButton"(name: "create", class: "save", value: "Create")
                    input(type: "submit", name: "create", class: "save", value: "Create")
                }
            }
        }
        //}
        return viewString
    }

    private List getQuotationList(list) {
        def tmp = []
        list.each { e ->
            tmp.add("\'${e}\'")
        }
        tmp
    }

    /*
    * 下载数据导入模板
    **/

    def downloadTemplate(DataKey dataKey) {
        def path = servletContext.getRealPath("/ ") + " templates / datakey "
        //def fileName = dataKeyA.createTemplate(path)
        def fileName = excelService.createTemplate(dataKeyA, path)
        params.downLoadFileName = fileName
        commonService.downLoadFile(params)
    }

    /*
    * 返回某数据模型的树形结构
    * */

    def getTreeDataKey(DataKey dataKey) {
        params.context = "dataTag"
        params.subItems = "subDataKeys"
        params.attributes = "id"    //
        def result = treeViewService.generateNodesString(dataKey, params, JsFrame.EasyUI)
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    /*
    * 删除数据模型
    * */

    def deleteDataKey(Long id) {
        if (id == null) {
            notFound()
            return
        }

        dataKeyService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'dataKey.label', default: 'DataKey'), id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    /*
    * 更新数据模型
    * */

    def updateDataKey(DataKey dataKey) {
        if (dataKey == null) {
            notFound()
            return
        }

        try {
            dataKeyService.save(dataKey)
        } catch (ValidationException e) {
            respond dataKey.errors, view: 'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'dataKey.label', default: 'DataKey'), dataKey.id])
                redirect(action: "index")
            }
            '*' { respond dataKey, [status: OK] }
        }
    }

    /*
    *  创建数据模型
    * */

    def createDataKey(DataKey upDataKey) {
        println("createDataKey ${params}")
        def dictionary = DataDictionary.get(params.dictionary)
        def dataKey = new DataKey(upDataKey: upDataKey, dictionary: dictionary)
        if (request.xhr) {
            render(template: 'editDataKey', model: [dataKey: dataKey])
        } else {
            respond dataKey
        }
    }

    /*
    *  编辑数据模型
    * */

    def editDataKey() {
        def dataKey = DataKey.get(params.id)
        if (request.xhr) {
            render(template: 'editDataKey', model: [dataKey: dataKey])
        } else {
            respond dataKey
        }
    }

    /*
    *  显示数据模型
    * */

    def showDataKey() {
        println("showDataKey ${params}")
        def dataKey = DataKey.get(params.id)
        if (request.xhr) {
            render(template: 'showDataKey', model: [dataKey: dataKey])
        } else {
            respond dataKey
        }
    }

    /*
    *  数据模型统计
    * */

    def countDataKey() {
        def count = 0
        def dataDictionary = DataDictionary.get(params.id)
        if (dataDictionary) {
            //count = dataDictionary?.datakeys?.size()
            count = DataKey.countByDictionaryAndUpDataKeyIsNull(dataDictionary)
        } else {
            count = DataKey.count()
        }
        println("countDataKey 统计结果：${count} --- ${dataDictionary}")
        def result = [count: count]
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    /*
    * 数学模型列表
    * */

    def listDataKey() {
        println("listDataKey: ${params}")
        def dataDictionary = DataDictionary.get(params.id)
        def count = DataKey.countByDictionaryAndUpDataKeyIsNull(dataDictionary)
        def dataKeyList
        def offset = Integer.parseInt(params.offset)
        if (count > offset) {
            dataKeyList = DataKey.findAllByDictionaryAndUpDataKeyIsNull(dataDictionary, params)
        } else {
            dataKeyList = DataKey.findAllByDictionaryAndUpDataKeyIsNull(dataDictionary)
        }
        // 检查用户视图的存在性
        def dataKeyViewList = [:]
        dataKeyList.each { e ->
            GString fileName = dataKeyViewFileName(e)
            def file = new File(fileName)
            dataKeyViewList.put(e.id, file.exists())
        }
        //println("查询结果：${dataDictionary}  ${dataKeyList}")
        if (request.xhr) {
            render(template: 'listDataKey', model: [dataKeyList: dataKeyList, dataKeyViewList: dataKeyViewList])
        } else {
            respond dataKeyList
        }
    }

    //==================================================================================================================
    // 有关DataDictionary的处理

    /*
    * 返回某数据字典的数据模型的树形结构
    * */

    def getTreeDataDictionary(DataDictionary dataDictionary) {
        //def dataKeyList = dataDictionary.datakeys
        def dataKeyList = DataKey.findAllByDictionaryAndUpDataKeyIsNull(dataDictionary)
        params.context = "dataTag"
        params.subItems = "subDataKeys"
        params.attributes = "id"    //
        def result = treeViewService.generateNodesString(dataKeyList, params, JsFrame.EasyUI)
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    /*
    * 创建数据字典
    * */

    def createDataDictionary() {
        def dataDictionary = new DataDictionary(params)
        if (request.xhr) {
            render(template: 'editDataDictionary', model: [dataDictionary: dataDictionary])
        } else {
            respond dataDictionary
        }
    }

    /*
    *  删除数据字典
    * */

    def deleteDataDictionary(Long id) {
        if (id == null) {
            notFound()
            return
        }

        dataDictionaryService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'dataDictionary.label', default: 'DataDictionary'), id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    /*
    * 更新对象--数据字典
    * */

    def updateDataDictionary(DataDictionary dataDictionary) {
        if (dataDictionary == null) {
            notFound()
            return
        }

        try {
            dataDictionaryService.save(dataDictionary)
        } catch (ValidationException e) {
            respond dataDictionary.errors, view: 'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'dataDictionary.label', default: 'DataDictionary'), dataDictionary.id])
                //redirect dataDictionary
                redirect(action: "index")
            }
            '*' { respond dataDictionary, [status: OK] }
        }
    }

    /*
    * 编辑对象
    * */

    def editDataDictionary(DataDictionary dataDictionary) {
        if (request.xhr) {
            render(template: 'editDataDictionary', model: [dataDictionary: dataDictionary])
        } else {
            respond dataDictionary
        }
    }

    /*
    * 显示数据字典
    * */

    def showDataTictionary() {
        def dataDictionary = DataDictionary.get(params.id)
        if (request.xhr) {
            render(template: 'showDataDictionary', model: [dataDictionary: dataDictionary])
        } else {
            respond dataDictionary
        }
    }

    /*
    * 数据字典列表
    * */

    def listDataDictionary() {
        def dataDictionaryList = DataDictionary.list(params)
        if (request.xhr) {
            render(template: 'listDataDictionary', model: [dataDictionaryList: dataDictionaryList])
        } else {
            respond dataDictionaryList
        }
    }

    /*
    * 统计数据字典
    * */

    def countDictionary() {
        def count = 0
        count = DataDictionary.count()
        println("统计结果--数据字典：${count}")
        def result = [count: count]
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'dataDictionary.label', default: 'DataDictionary'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def index() {}
}
