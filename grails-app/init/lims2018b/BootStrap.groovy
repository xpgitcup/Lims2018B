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
        def configFileName = "${webRootDir}config.ini"
        def configFile = new File(configFileName)
        def config = new Properties()
        if (configFile.exists()) {
            println("读取配置文件.")
            def inf = new FileInputStream(configFile)
            def reader = new InputStreamReader(inf, "UTF-8")
            config.load(reader)
            def scriptsTemp = config.getProperty("scripts")
            println(scriptsTemp)
            if (scriptsTemp) {
                println("脚本文件：" + scriptsTemp)
                def scripts = scriptsTemp.split(",")
                scripts.each { e ->
                    initService.loadScripts("${webRootDir}${e}")
                }
            }
        } else {
            def of = new FileOutputStream(configFile, false)
            def ow = new OutputStreamWriter(of, "utf-8")
            config.setProperty("scripts", "文件1,文件2")
            //config.storeToXML(of, "系统配置文件", "utf-8")
            config.store(ow, "系统配置文件")
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
