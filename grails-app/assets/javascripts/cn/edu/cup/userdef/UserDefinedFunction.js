var operation4UserDefinedFunctionDiv;
var tabList4UserDef = ["用户自定义功能", "用户类库", "用户类", "类方法"];
//var displayDataKeyTreeDiv;
//var paginationDataKeyDiv;

$(function () {
    operation4UserDefinedFunctionDiv = $("#operation4UserDefinedFunctionDiv");

    console.info("用户自定义功能维护...");
    tabPagesManagerWithPagination("operation4UserDefinedFunctionDiv", tabList4UserDef, loadUserDefinedFunction, countUserDefinedFunction);

})

function selectUserDefinedFunction(id) {
    $.cookie("currentUserDefinedFunction", id)
    console.info("记录当前功能：" + id);
    operation4UserDefinedFunctionDiv.tabs("select", "用户类库");
    $("#currentUserDefinedFunction").html(id);
}

function createUserDefinedFunction() {
    console.info("创建新的功能");
    ajaxRun("operation4UserDefinedFunction/createUserDefinedFunction", 0, "list" + "用户自定义功能" + "Div");
}

function countUserDefinedFunction(title) {
    console.info("统计数据..." + title);
    var total = 0;
    switch (title) {
        case "用户自定义功能":
            total = ajaxCalculate("operation4UserDefinedFunction/countUserDefinedFunction");
            break
        case "用户类库":
            total = ajaxCalculate("operation4UserDefinedFunction/countUserClassLibrary");
            break
        case  "用户类":
            break
        case  "类方法":
            break
    }
    return total;
}

function loadUserDefinedFunction(title, page, pageSize) {
    console.info("读入数据..." + title);
    var params = getParams(page, pageSize) + "&title=" + title;    //getParams必须是放在最最前面！！
    console.info(params)
    switch (title) {
        case "用户自定义功能":
            ajaxRun("operation4UserDefinedFunction/listUserDefinedFunction" + params, 0, "list" + title + "Div");
            break
        case "用户类库":
            ajaxRun("operation4UserDefinedFunction/listUserClassLibrary" + params, 0, "list" + title + "Div");
            break
        case  "用户类":
            break
        case  "类方法":
            break
    }
    $.cookie("currentPage" + title, page);
}