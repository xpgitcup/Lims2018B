package cn.edu.cup.userdef

import cn.edu.cup.dictionary.DataItem
import cn.edu.cup.dictionary.DataKey
import grails.gorm.transactions.Transactional
import org.grails.web.util.WebUtils

import java.util.jar.JarFile

@Transactional
class MaintainUserClassLibraryService {

    def userClassService
    def dataKeyService

    def generateParameters(DataItem dataItem) {
        def m = [:]
        dataItem.subDataItems.each { e->
            m.put(e.dataKey.dataTag, e.dataValue)
        }
        return m
    }

    def testClass(UserClass userClass) {
        ClassLoader parent = getClass().getClassLoader();
        GroovyClassLoader loader = new GroovyClassLoader(parent);
        def libFile = new File(userClassLibraryFileName(userClass.userClassLibrary))
        println "classInstance ${libFile}"
        loader.addURL(libFile.toURL())
        //def clazz = loader.parseClass(name)
        def clazz = loader.loadClass(userClass.name)
        println "classInstance ${clazz}"
        def o = clazz.newInstance()
        //o.invokeMethod("main", null)
        def data = DataItem.get(4)
        def m = generateParameters(data)
        println("${m}")
        o.invokeMethod("fetch", m)
        o.invokeMethod("run", null)
        def r = o.invokeMethod("feed", null)
        println("计算结果：${r}")
    }

    def importUserClasses(UserClassLibrary userClassLibrary) {
        Object libFileName = userClassLibraryFileName(userClassLibrary)
        println(libFileName)
        def libFile = new File(libFileName)
        if (libFile.exists()) {
            println("自动导入 ${libFileName}")
            def extName = libFileName.substring(libFileName.lastIndexOf(".")+1)
            switch (extName) {
                case "jar":
                    JarFile jf = new JarFile(libFile)
                    def ens = []
                    def es = jf.entries()
                    es.each() {e->
                        println "${e}"
                        if ("${e}".contains(".class")) {
                            ens.add("${e}")
                        }
                    }
                    println("包含：${ens}")
                    // 导入类
                    ens.each { e->
                        def cn = e.toString().replace("/", ".")
                        cn = cn.replace(".class", "")
                        def dataKey = dataKeyService.get(10)
                        def nc = new UserClass(name: cn, userClassLibrary: userClassLibrary, baseOn: dataKey)
                        if (UserClass.countByNameAndUserClassLibrary(cn, userClassLibrary)<1) {
                            userClassService.save(nc)
                            println("成功导入${cn}...")
                        }
                    }
                    break
            }
        } else {
            println("找不到啊!")
        }
    }

    private Object userClassLibraryFileName(UserClassLibrary userClassLibrary) {
        def webUtils = WebUtils.retrieveGrailsWebRequest()
        def servletContext = webUtils.getServletContext()
        def libFileName = servletContext.getRealPath("/") +
                "userClassLibrary" +
                "/${userClassLibrary.userDefinedFunction.id}/${userClassLibrary.id}/" +
                userClassLibrary.fileName
        libFileName
    }
}
