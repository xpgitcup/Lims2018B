<div id="maintainDataKeyDiv" title="数据模型维护">
    <div class="container">
        <div class="col-md-4">

            <div class="nav">
                <ul>
                    <li>
                        <a class="list" href="javascript: switchTabs(false)">
                            返回
                        </a>
                    </li>
                </ul>
            </div>

            <div class="easyui-panel">
                <div class="easyui-tree" id="displayDataKeyTreeDiv"></div>
                <div class="easyui-pagination" id="paginationDataKeyDiv"></div>
            </div>
        </div>
        <div class="col-md-8">
            <div class="nav" role="navigation">
                <ul>
                    <li><a class="create" href="javascript: createSystemMenu(0)">新建根节点</a></li>
                    <li><a id="createSystemMenu" class="create" href="#">新建子节点</a></li>
                </ul>
            </div>

            <div class="easyui-panel" id="editDataKeyDiv"></div>
        </div>
    </div>
</div>
