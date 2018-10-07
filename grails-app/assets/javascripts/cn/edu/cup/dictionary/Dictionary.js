var operation4DataDiv;
var tabList = ["数据字典", "数据模型", "数据项"];
var displayDataKeyTreeDiv;
var paginationDataKeyDiv;

$(function () {
    operation4DataDiv = $("#operation4DataDiv");
    displayDataKeyTreeDiv = $("#displayDataKeyTreeDiv");
    paginationDataKeyDiv = $("#paginationDataKeyDiv");

    console.info("数据字典维护...");
    tabPagesManagerWithPagination("operation4DataDiv", tabList, loadDictionaryData, countDictionaryData);

    var dictionary = readCookie("currentDictionary", 1);
    $("#currentDictionary").html(dictionary);

    var dataKey = readCookie("currentDataKey", 1);
    $("#currentDataKey").html(dataKey);

    switchTabs(false)
})

//======================================================================================================================
// tab页面维护

function switchTabs(isTree) {
    var lastTimeTab = readCookie("current" + "operation4DataDiv", tabList[0]);
    console.info("上一次的页面：" + lastTimeTab);
    if (isTree) {
        operation4DataDiv.tabs("enableTab", "数据模型维护")
        tabList.forEach(function (value) { operation4DataDiv.tabs("disableTab", value) });
        operation4DataDiv.tabs("select", "数据模型维护");
        $.cookie("current" + "operation4DataDiv", lastTimeTab, {path: "/"});
    } else {
        operation4DataDiv.tabs("disableTab", "数据模型维护")
        tabList.forEach(function (value) { operation4DataDiv.tabs("enableTab", value) });
        operation4DataDiv.tabs("select", lastTimeTab);
    }
}

//======================================================================================================================
// 数据模型基本处理函数

/*
* 维护当前数据模型
* */
function maintainDataKey(id) {
    $.cookie("currentDataKey", id)
    switchTabs(true);
    //设置分页机制
    paginationDataKeyDiv.pagination({
        pagesize: pageSize,
        total: 1,
        pageNumber: 1,
        displayMsg: "",
        layout:["first","prev", "next","last"]
    });
    //显示树形结构
    var getDataUrl = "operation4Data/getTreeDataKey/" + id;
    displayDataKeyTreeDiv.tree({
        url:getDataUrl
    });
}

/*
* 编辑当前数据模型
* */
function editDataKey(id) {
    console.info("编辑数据模型:" + id);
    ajaxRun("operation4Data/editDataKey?id=" + id, 0, "list" + "数据模型" + "Div");
}

/*
* 显示当前数据模型
* */
function showDataKey(id) {
    console.info("显示数据模型:" + id);
    ajaxRun("operation4Data/showDataKey?id=" + id, 0, "list" + "数据模型" + "Div");
}

/*
* 选择当前数据模型
* */
function selectDataKey(id) {
    $.cookie("currentDataKey", id)
    console.info("记录当前模型：" + id);
    operation4DataDiv.tabs("select", "数据项");
    //document.location.reload();//当前页面
}

//======================================================================================================================
// 数据字典基本处理函数

/*
* 维护当前数据字典的数据模型
* */
function maintainDataDictionary(id) {
    var total = ajaxCalculate("operation4Data/countDataKey?id=" + id);
    switchTabs(true);
    //设置分页机制
    paginationDataKeyDiv.pagination({
        pagesize: pageSize,
        total: 1,
        pageNumber: 1,
        displayMsg: "",
        layout:["first","prev", "next","last"]
    });
    //显示树形结构
    var getDataUrl = "operation4Data/getTreeDataDictionary/" + id;
    displayDataKeyTreeDiv.tree({
        url:getDataUrl
    });
}

/*
 *创建数据字典
 */
function createDataDictionary() {
    console.info("创建数据字典...")
    ajaxRun("operation4Data/createDataDictionary", 0, "list" + "数据字典" + "Div");
}

/*
* 显示编辑数据字典
* */
function editDataDictionary(id) {
    console.info("编辑数据字典:" + id);
    ajaxRun("operation4Data/editDataDictionary/" + id, 0, "list" + "数据字典" + "Div");
}

/*
* 显示当前数据字典
* */
function showDataDictionary(id) {
    console.info("显示数据字典:" + id);
    ajaxRun("operation4Data/showDataTictionary?id=" + id, 0, "list" + "数据字典" + "Div");
}

/*
* 选择当前数据字典
* */
function selectCurrentDictionary(id) {
    $.cookie("currentDictionary", id)
    console.info("记录当前字典：" + id);
    operation4DataDiv.tabs("select", "数据模型");
    //document.location.reload();//当前页面
}

//======================================================================================================================
// 通用函数

/*
* 统计数据
* */
function countDictionaryData(title) {
    console.info("统计数据:" + title + "...");
    var total = 0
    switch (title) {
        case "数据字典":
            total = ajaxCalculate("operation4Data/countDictionary");
            break;
        case "数据模型":
            var dictionary = readCookie("currentDictionary", 1)
            total = ajaxCalculate("operation4Data/countDataKey?id=" + dictionary);
            break;
        case "数据项":
            var dataKey = readCookie("currentDataKey", 1)
            total = ajaxCalculate("operation4Data/countDataItem?id=" + dataKey);
            break;
    }
    console.info("统计结果：" + total);
    return total;
}

/*
* 调取数据
* */
function loadDictionaryData(title, page, pageSize) {
    console.info("调取数据：" + title + " 页码 " + page + "，页大小" + pageSize);
    var params = getParams(page, pageSize) + "&title=" + title;    //getParams必须是放在最最前面！！
    console.info(params)
    switch (title) {
        case "数据字典":
            ajaxRun("operation4Data/listDataDictionary" + params, 0, "list" + title + "Div");
            break;
        case "数据模型":
            var dictionary = readCookie("currentDictionary", 1)
            ajaxRun("operation4Data/listDataKey" + params, dictionary, "list" + title + "Div");
            break;
        case "数据项":
            break;
    }
    $.cookie("currentPage" + title, page);
}

