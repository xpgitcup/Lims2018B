<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'userClassLibrary.label', default: 'UserClassLibrary')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<div id="list-userClassLibrary" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <!--f:table collection="${userClassLibraryList}"/-->
    <table>
        <thead>
        <th>id</th>
        <th>Name</th>
        <th>Description</th>
        <th>Size</th>
        <th>操作</th>
        </thead>
        <g:each in="${userClassLibraryList}" status="i" var="item">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>${item.id}</td>
                <td>${item.name}</td>
                <td>${item.description}</td>
                <td>${item?.userClass.size()}</td>
                <td>${item.developer}</td>
            </tr>
        </g:each>
    </table>
</div>
</body>
</html>