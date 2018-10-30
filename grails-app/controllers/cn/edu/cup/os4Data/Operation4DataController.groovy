package cn.edu.cup.os4Data

import cn.edu.cup.dictionary.DataDictionary
import cn.edu.cup.dictionary.DataItem
import cn.edu.cup.dictionary.DataKey
import cn.edu.cup.system.JsFrame
import grails.converters.JSON
import grails.validation.ValidationException
import groovy.xml.MarkupBuilder

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

        def view = 'createDataItem'
        if (params.view) {
            view = params.view
        }

        if (request.xhr) {
            render(template: view, model: [dataItem: dataItem])
        } else {
            respond dataItem
        }
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
    * */

    def downloadViewTemplate(DataKey dataKey) {
        def path = servletContext.getRealPath("/")
        def templateFileName = "${path}/viewTemplates/_createDataItemTemplate.gsp"
        def templateFile = new File(templateFileName)
        def lines
        if (templateFile) {
            lines = templateFile.text
            println("模板内容：")
            println(lines)
        }
        def fileName = "${path}/viewTemplates/dataKey_${dataKey.id}"
        printf("生成输入模板%s, %s\n", [path, fileName])
        def vlines = []
        vlines.add("<g:uploadForm controller=\"operation4Data\" action=\"saveDataItem\">")
        vlines.add("</g:uploadForm>")

        def strXml = new StringWriter()
        MarkupBuilder mb  = new groovy.xml.MarkupBuilder(strXml);
        mb.g(controller:"operation4Data", action:"saveDataItem"){
            fieldset{
                table{

                }
            }
        }

        def xmlFile = "${path}/viewTemplates/output.xml"
        PrintWriter pw = new PrintWriter(xmlFile)
        pw.write(strXml.toString())
        pw.close()

        def dataItem = new DataItem(DataKey: dataKey)
        def newSubItems = []
        dataKey.subDataKeys.each { e ->
            def item = new DataItem(
                    dataKey: e,
                    upDataItem: dataItem
            )
            newSubItems.add(item)
        }
        dataItem.subDataItems = newSubItems
        println("数据项：${dataItem.dataKey}")
        newSubItems.eachWithIndex { e, i->
            println("${e}--${i}")
            println("subDataItems[${i}].dataValue")
        }
        redirect(action:"index")
    }

    /*
    * 下载数据导入模板
    * */

    def downloadTemplate(DataKey dataKey) {
        def path = servletContext.getRealPath("/") + "templates/datakey"
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
        println("查询结果：${dataDictionary}  ${dataKeyList}")
        if (request.xhr) {
            render(template: 'listDataKey', model: [dataKeyList: dataKeyList])
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
