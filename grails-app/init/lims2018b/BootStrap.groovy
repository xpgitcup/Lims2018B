package lims2018b

class BootStrap {

    def initService
    def grailsApplication

    def init = { servletContext ->
        environments {
            development {
                def controllers = grailsApplication.controllerClasses
                initService.initSystemData(controllers)
                initService.fillSamples()
                configureForDevelopment(servletContext);
            }
            production {
                configureForDevelopment(servletContext);
            }
        }
    }

    def destroy = {
    }

    /**
     * 初始化代码__开发环境下的初始化代码
     */
    def configureForDevelopment(servletContext) {
        println "这是开发环境..."
        def webRootDir = servletContext.getRealPath("/")
        def configFileName = "${webRootDir}config.xml"
        def configFile = new File(configFileName)
        def config = new Properties()
        if (configFile.exists()) {
            println("读取配置文件.")
            def inf = new FileInputStream(configFile)
            def reader = new InputStreamReader(inf, "UTF-8")
            config.load(reader)
            def scripts = config.getProperty("scripts").split(",")
            scripts.each { e ->
                initService.loadScripts(e)
            }
        } else {
            def of = new FileOutputStream(configFile, false)
            config.setProperty("scripts", "文件1,wfjm")
            config.storeToXML(of, "系统配置文件", "utf-8")
            println("创建配置文件.")
        }
    }

    /**
     * 发布后的初始化代码
     */
    def configureForProduction() {
        println "这是发布环境..."
        def webRootDir = servletContext.getRealPath("/")
        def scriptPath = "${webRootDir}scripts/system"
        println "BootStrap ${webRootDir}"
        initService.loadScripts(scriptPath)
    }

}
