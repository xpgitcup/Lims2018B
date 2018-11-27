<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 实现可定制的布局 -->
    <g:if test="${layout}">
        <meta name="layout" content="${layout}"/>
    </g:if>
    <g:else>
        <g:if test="${session.layout}">
            <meta name="layout" content="${session.layout}"/>
        </g:if>
        <g:else>
            <meta name="layout" content="main"/>
        </g:else>
    </g:else>
<!-- end 实现可定制的布局 -->
    <g:set var="entityName" value="DataKey"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}维护</title>
    <asset:javascript src="cn/edu/cup/dictionary/${entityName}.js"/>
</head>

<body>
<div class="nav">
    <ul>
        <li><a href="#">当前功能：</a></li>
        <li><a href="#"><div id=""></div></a></li>
    </ul>
</div>

<div id="operation4DataKeyDiv" class="easyui-tabs">
</div>

</body>
</html>
