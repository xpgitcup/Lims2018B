package cn.edu.cup.os4userdef

import cn.edu.cup.userdef.UserDefinedFunction
import grails.converters.JSON

class Operation4UserDefinedFunctionController {

    /*
    * 用户自定义功能列表
    * */

    def listUserDefinedFunction() {
        def userDefinedFunctionList = UserDefinedFunction.list(params)
        if (request.xhr) {
            render(template: 'listUserDefinedFunction', model: [userDefinedFunctionList: userDefinedFunctionList])
        } else {
            respond userDefinedFunctionList
        }
    }

    /*
    * 统计用户自定义功能
    * */

    def countUserDefinedFunction() {
        def count = 0
        count = cn.edu.cup.userdef.UserDefinedFunction.count()
        println("统计结果--用户自定义功能：${count}")
        def result = [count: count]
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    def index() {}
}
