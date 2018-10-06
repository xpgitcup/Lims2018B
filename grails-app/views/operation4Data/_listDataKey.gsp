<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'dataKey.label', default: 'DataKey')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-dataKeyA" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div id="list-dataKeyA" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
<!--f:table collection="${dataKeyList}" /-->
    <table>
        <thead>
        <th>ID</th>
        <th>名称</th>
        <th>操作</th>
        <th>下载模板</th>
        <th>输入</th>
        <th>导入数据</th>
        </thead>
        <tbody>
        <g:each in="${dataKeyList}" var="item" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>${item.id}</td>
                <td>
                    <a href="javascript: selectDataKey(${item.id})">
                        ${item.dataTag}【${cn.edu.cup.dictionary.DataItem.countByDataKey(item)}】
                    </a>
                </td>
                <td>
                    <a href="javascript: showDataKey(${item.id})">显示/编辑</a>
                    <a href="javascript: maintainDataKey(${item.id})">维护</a>
                </td>
                <td>
                    <a href="operation4DataKeyA/downloadTemplate/${item.id}">下载</a>
                </td>
                <td>
                    <a href="javascript: createDataItemA(${item.id})">输入${item.dataTag}</a>
                </td>
                <td>
                    <g:uploadForm controller="operation4DataKeyA" action="importFromExcelFile">
                        <div class="nav">
                            <g:hiddenField name="id" value="${item.id}"/>
                            <ul>
                                <li>
                                    <input type="file" name="uploadedFile">
                                </li>
                                <li>
                                    <input type="submit" value="ok">
                                </li>
                            </ul>
                        </div>
                    </g:uploadForm>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>