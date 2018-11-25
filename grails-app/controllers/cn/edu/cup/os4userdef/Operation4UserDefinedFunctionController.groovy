package cn.edu.cup.os4userdef

import cn.edu.cup.userdef.UserClass
import cn.edu.cup.userdef.UserClassLibrary
import cn.edu.cup.userdef.UserDefinedFunction
import grails.converters.JSON
import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.NOT_FOUND

class Operation4UserDefinedFunctionController {

    def userDefinedFunctionService
    def userClassLibraryService
    def commonService
    def maintainUserClassLibraryService

    /*
    * 用户类==========================================================================================================
    * */

    def testClass(UserClass userClass) {
        maintainUserClassLibraryService.testClass(userClass)
        redirect(action: "index")
    }

    /*
    * 用户类库列表
    * */

    def listUserClass() {
        def userClassList = UserClass.list(params)
        if (request.xhr) {
            render(template: 'listUserClass', model: [userClassList: userClassList])
        } else {
            respond userClassList
        }
    }

    def countUserClass() {
        def count = 0
        count = cn.edu.cup.userdef.UserClass.count()
        println("统计结果--用户自定义功能：${count}")
        def result = [count: count]
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    /*
    * 用户类库==========================================================================================================
    * */

    /*
    * 导入类库
    * */
    def importUserClasses(UserClassLibrary userClassLibrary) {
        maintainUserClassLibraryService.importUserClasses(userClassLibrary)
        redirect(action: "index")
    }

    /*
    * 保存====用户类库
    * */

    def saveUserClassLibrary(UserClassLibrary userClassLibrary) {
        if (userClassLibrary == null) {
            notFound()
            return
        }

        try {
            userClassLibraryService.save(userClassLibrary)
            //类库文件的上传
            if (params.uploadedFile) {
                println("上传类库文件...")
                //处理文件上传
                def destDir = servletContext.getRealPath("/") + "userClassLibrary" + "/${userClassLibrary.userDefinedFunction.id}/${userClassLibrary.id}"
                def uploadedFileDataKeyId = params.uploadedFileDataKeyId
                def uploadedFilePath = params.uploadedFilePath
                params.destDir = destDir
                println(destDir)
                def sf = commonService.upload(params)
                println("上传${sf}成功...")
            }
        } catch (ValidationException e) {
            println("${e}")
            flash.message = e.toString()
            respond userClassLibrary.errors, view: 'index'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userClassLibrary.label', default: 'UserClassLibrary'), userClassLibrary.id])
                //redirect userClassLibrary
                redirect(action: "index")
            }
            '*' { respond userClassLibrary, [status: CREATED] }
        }
    }

    /*
    * 新建====用户类库
    * */

    def createUserClassLibrary(UserDefinedFunction userDefinedFunction) {
        def userClassLibrary = new UserClassLibrary(userDefinedFunction: userDefinedFunction)
        if (request.xhr) {
            render(template: 'createUserClassLibrary', model: [userClassLibrary: userClassLibrary])
        } else {
            respond userClassLibrary
        }
    }

    /*
    * 用户类库列表
    * */

    def listUserClassLibrary() {
        def userClassLibraryList = UserClassLibrary.list(params)
        if (request.xhr) {
            render(template: 'listUserClassLibrary', model: [userClassLibraryList: userClassLibraryList])
        } else {
            respond userClassLibraryList
        }
    }

    /*
    * 统计用户类库
    * */

    def countUserClassLibrary() {
        def count = 0
        count = cn.edu.cup.userdef.UserClassLibrary.count()
        println("统计结果--用户自定义功能：${count}")
        def result = [count: count]
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    /*
    * 用户自定义功能====================================================================================================
    * */

    /*
    * 保存-----用户自定义功能
    * */

    def saveUserDefinedFunction(UserDefinedFunction userDefinedFunction) {
        if (userDefinedFunction == null) {
            notFound()
            return
        }

        try {
            userDefinedFunctionService.save(userDefinedFunction)
        } catch (ValidationException e) {
            respond userDefinedFunction.errors, view: 'createUserDefinedFunction'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userDefinedFunction.label', default: 'UserDefinedFunction'), userDefinedFunction.id])
                //redirect userDefinedFunction
                redirect(action: "index")
            }
            '*' { respond userDefinedFunction, [status: CREATED] }
        }
    }

    /*
    * 新建-----用户自定义功能
    * */

    def createUserDefinedFunction() {
        def userDefinedFunction = new UserDefinedFunction(params)
        if (request.xhr) {
            render(template: 'createUserDefinedFunction', model: [userDefinedFunction: userDefinedFunction])
        } else {
            respond userDefinedFunction
        }
    }

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

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userClassLibrary.label', default: 'UserClassLibrary'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

}
