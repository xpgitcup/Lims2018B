package cn.edu.cup.os4Data

import cn.edu.cup.dictionary.DataDictionary
import cn.edu.cup.dictionary.DataKey
import cn.edu.cup.system.JsFrame
import grails.converters.JSON
import grails.validation.ValidationException

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
    *  数据项统计
    * */

    def countDataItem() {
        def count = 0
        def dataDictionary = DataDictionary.get(params.id)
        if (dataDictionary) {
            count = dataDictionary?.datakeys?.size()
        } else {
            count = DataKey.count()
        }
        println("统计结果：${count} ${dataDictionary}")
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
    *  显示数据模型
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
