package cn.edu.cup.init

import cn.edu.cup.dictionary.DataItem
import cn.edu.cup.dictionary.DataKey
import cn.edu.cup.dictionary.DataKeyType
import cn.edu.cup.dictionary.DataDictionary
import cn.edu.cup.system.SystemAttribute
import cn.edu.cup.system.SystemCarousel
import cn.edu.cup.system.SystemChat
import cn.edu.cup.system.SystemMenu
import cn.edu.cup.system.SystemSponser
import cn.edu.cup.system.SystemTitle
import cn.edu.cup.system.SystemUser
import grails.core.GrailsApplication
import grails.gorm.transactions.Transactional
import lims2018b.Application

@Transactional
class InitService {

    def dataSource
    def dataDictionaryService
    def systemMenuService
    def dataKeyService
    def dataItemService
    def commonService

    //加载数据库初始化脚本
    def loadScripts(String dir) {
        File sf = new File(dir)
        if (sf.exists()) {
            println "load scripts ${dir}"
            if (sf.isDirectory()) {
                sf.eachFile { f ->
                    if (f.isFile()) {
                        executeScript(f)
                    }
                }
            } else {
                println("执行${sf}...")
                executeScript(sf)
            }
        }
    }

    //执行附加脚本
    def executeScript(File sf) {
        //def File sf = new File(fileName)
        println "init - ${sf}"
        if (sf) {
            def db
            def sql = sf.text
            db = new groovy.sql.Sql(dataSource)
            //println "init - ${sql}"
            def lines = sql.split(";")
            lines.each() { it ->
                //println "line: ${it}"
                it = it.trim()
                if (!it.isEmpty()) {
                    db.executeUpdate(it)
                }
            }
        }
    }

    /*
    * 初始化系统数据
    * */

    def initSystemData(domains) {
        println("初始化系统数据......")
        initSystemUsers()
        initSystemMenuItems(domains)
    }

    /*
    * 从json文件中导入菜单
    * */

    def importFromJsonFile(fileName) {
        def jsonFile = new File(fileName)
        if (jsonFile.exists()) {
            def json = jsonFile.text
            def menuItems = com.alibaba.fastjson.JSON.parse(json)
            println(menuItems)
            menuItems.each { e ->
                def m0 = new SystemMenu(
                        menuContext: e.menuContext,
                        menuAction: e.menuAction,
                        menuDescription: e.menuDescription,
                        upMenuItem: null,
                        roleAttribute: e.roleAttribute,
                        menuOrder: e.menuOrder
                )
                systemMenuService.save(m0)
                if (e.menuItems) {
                    e.menuItems.each { ee ->
                        def mm0 = new SystemMenu(
                                menuContext: ee.menuContext,
                                menuAction: ee.menuAction,
                                menuDescription: ee.menuDescription,
                                upMenuItem: m0,
                                roleAttribute: ee.roleAttribute,
                                menuOrder: ee.menuOrder
                        )
                        systemMenuService.save(mm0)
                    }
                }
            }
        }
    }

    /*
    * 初始化系统菜单
    * 定义一个文件格式--jsong格式
    * 先输出一个输出的，然后定义导入的
    * */

    def initSystemMenuItems(domains) {
        // 首先从配置文件中导入
        def fileName = commonService.menuConfigFileName()
        //--------------------------------------------------------------------------------------------------------------
        if (SystemMenu.count() < 1) {
            importFromJsonFile(fileName)
        }
        setupDomainMenuItems(domains)
    }

    private SystemMenu setupDomainMenuItems(domains) {
        def m0 = new SystemMenu(
                menuContext: "底层管理",
                menuAction: "#",
                menuDescription: "对系统的菜单结构进行底层维护",
                upMenuItem: null,
                roleAttribute: "底层管理",
                menuOrder: 100
        )
        //m0.save(true)
        systemMenuService.save(m0)
        //----------------------------------------------------------------------------------------------------------
        //创建正对各个域类控制器的菜单
        domains.sort()
        domains.each() { e ->
            def m01 = new SystemMenu(
                    menuContext: "${e.name}",
                    menuAction: "${e.name}/index",
                    menuDescription: "对${e.name}属性进行维护",
                    upMenuItem: m0,
                    roleAttribute: "底层管理",
                    menuOrder: 0
            )
            //m01.save(true)
            systemMenuService.save(m01)
        }
        m0
    }

    /**
     * 初始化用户数据
     **/
    def initSystemUsers() {
        if (SystemUser.count() < 1) {
            newUser("李晓平", "3764", '底层管理 系统维护 公共服务')
            newUser("宫敬", "2156", '底层管理 系统维护 公共服务')
            newUser("吴海浩", "3181", '底层管理 系统维护 公共服务')

            newUser("洪炳沅", "527527", '底层管理 系统维护 公共服务')
            newUser("闵元", "519519", '底层管理 系统维护 公共服务')
            newUser("苏越", "519519", '底层管理 系统维护 公共服务')
            newUser("李愚", "519519", '底层管理 系统维护 公共服务')
            newUser("周艳红", "519519", '底层管理 系统维护 公共服务')
            newUser("万洋洋", "519519", '底层管理 系统维护 公共服务')
            newUser("韦宝成", "519519", '底层管理 系统维护 公共服务')
            newUser("王茀玺", "519519", '底层管理 系统维护 公共服务')
            newUser("金浩", "519519", '底层管理 系统维护 公共服务')
        }
    }

    private void newUser(userName, password, attribute) {
        def u5 = new SystemUser(userName: userName, password: password, roleAttribute: attribute)
        u5.save(true)
    }

    /**
     * 填充测试数据
     */
    def fillSamples() {
        println("填充测试数据......")
        //用户
        //fillSampleUsers()
        //菜单 -- 应该在前面
        fillSampleMenus()
        //属性
        fileSampleAttributes()
        //对话
        fillSampleChat()
        //数据字典
        //fillSampleDataKey()
        //程序标题
        fillSampleTitle()
        //用户类库
        //fillSampleUserLibrary()
        //水力学模拟
        //fillSampleHydraulicSimulation()
    }


    def fillSampleTitle() {
        println("初始化系统标题......")
        if (SystemTitle.count() < 1) {
            def systemTitle = new SystemTitle(
                    applicationTitle: "EasyPipeNetwork 管网模拟种子程序",
                    applicationLogo: "cuplogoA.png",
                    applicationLayout: "mainEasyUI"
            )
            systemTitle.save(true)
            //----------------------------------------------------------------------------------------------------------
            if (SystemSponser.countBySystemTitle(systemTitle) < 1) {
                newSponser(systemTitle, "中国石油大学", "cuplogoA.png")
                newSponser(systemTitle, "中海油", "logo_cnooc.png")
                newSponser(systemTitle, "中联煤", "logo_cbm.png")
            }
            //----------------------------------------------------------------------------------------------------------
            if (SystemCarousel.countBySystemTitle(systemTitle) < 1) {
                newCarousel(systemTitle, "课题组", "课题组.jpg")
                newCarousel(systemTitle, "多相流", "多相流.png")
                newCarousel(systemTitle, "抽油机", "u68.jpg")
            }
        }
    }

    private void newSponser(systemTitle, name, logo) {
        def ns = new SystemSponser(systemTitle: systemTitle, name: name, logo: logo)
        ns.save(true)
    }

    private void newCarousel(systemTitle, name, png) {
        def nc = new SystemCarousel(systemTitle: systemTitle, name: name, imageName: png)
        nc.save(true)
    }

    private void fillSampleDataKey() {

        //println("测试数据字典的数据...")
        for (int i = 0; i < 20; i++) {
            def dataDictionary = new DataDictionary(
                    name: "测试性数据字典${i}"
            )
            dataDictionaryService.save(dataDictionary)
            //println("${dataDictionary}")
            def types = DataKeyType.values()
            for (int j = 0; j < i; j++) {
                def nd = new DataKey(
                        dataTag: "数据标签${i}.${j} ",
                        upDataKey: null,
                        dictionary: dataDictionary
                )
                //println("${nd}")
                dataKeyService.save(nd)

                for (int k = 0; k < j; k++) {
                    def ndd = new DataKey(
                            dataTag: "key${i}.${j}.${k} ${types[k % types.length]}",
                            upDataKey: nd,
                            dataKeyType: types[k % types.length],
                            dictionary: dataDictionary
                    )
                    dataKeyService.save(ndd)

                    def dd = new DataItem(
                            dataKey: nd,
                            dataValue: "测试性数据${i}.${j}.${k}"
                    )
                    dataItemService.save(dd)

                    // 生成示例性的数据
                    for (int m = 0; m < k; m++) {
                        def ddd = new DataItem(
                                dataKey: ndd,
                                dataValue: "测试性数据${i}.${j}.${k}.${m}"
                        )
                        dataItemService.save(ddd)
                    }
                }
            }
        }
    }

    private void fillSampleChat() {
        for (int i = 0; i < 20; i++) {
            def c = new SystemChat(
                    speaker: "李晓平",
                    speakTo: "张${i}李${i + 1}",
                    message: " I speak to 张${i}李${i + 1} that ${i * i}",
                    startTime: new Date()
            )
            c.save(true)
            def d = new SystemChat(
                    speakTo: "李晓平",
                    speaker: "张${i}李${i + 1}",
                    message: "张${i}李${i + 1} tell me ${i * i}",
                    startTime: new Date()
            )
            d.save(true)
        }
    }

    private void fillSampleMenus() {
        if (SystemMenu.count() < 1) {
            println("填充测试性的菜单数据......")

            println("${GrailsApplication.simpleName}")
            println("${GrailsApplication.APPLICATION_ID}")
            println("${Application.properties.name}")
            //println("${Application.metaPropertyValues}")

            for (int i = 0; i < 10; i++) {
                def mm = new SystemMenu(
                        menuContext: "菜单${i}",
                        menuAction: "动作${i}",
                        menuDescription: "描述：${i}",
                        upMenuItem: null,
                        menuOrder: i
                )
                mm.save(true)

                for (int j = 0; j < i; j++) {
                    def mmn = new SystemMenu(
                            menuContext: "菜单${i}.${j}",
                            menuAction: "动作${i}.${j}",
                            menuDescription: "描述：${i}.${j}",
                            upMenuItem: mm,
                            menuOrder: j
                    )
                    mmn.save(true)
                }
            }
        }
    }

    private void fileSampleAttributes() {
        if (SystemAttribute.count() < 1) {
            println("测试性的属性...")
            def attributeA = new SystemAttribute(name: "系统操作权限")
            attributeA.save(true)
            SystemMenu.findAllByUpMenuItemIsNull().each { e->
                def aa = new SystemAttribute(name: e.menuContext, upAttribute: attributeA)
                aa.save(true)
            }
        }
    }

    private void fillSampleUsers() {
        println("测试性的用户...")
        for (int i = 0; i < 20; i++) {
            def u = new SystemUser(userName: "张${i}李${i + 1}", password: "1")
            u.save(true)
        }
    }

}
