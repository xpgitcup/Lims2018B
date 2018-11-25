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

    <g:hasErrors bean="${this.userClassLibrary}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.userClassLibrary}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <!--f:table collection="${userClassLibraryList}"/-->
    <table>
        <thead>
        <th>id</th>
        <th>Name</th>
        <th>Description</th>
        <th>File Name</th>
        <th>Size</th>
        <th>作者</th>
        </thead>
        <g:each in="${userClassLibraryList}" status="i" var="item">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>${item.id}</td>
                <td><a href="operation4UserDefinedFunction/importUserClasses/${item.id}">${item.name}</a></td>
                <td>${item.description}</td>
                <td>${item.fileName}</td>
                <td>${item?.userClass.size()}</td>
                <td>${item.developer}</td>
            </tr>
        </g:each>
    </table>
</div>
</body>
</html>