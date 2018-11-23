<html>
  <head>
    <meta name="layout" content="main" />
  </head>
  <body>
    <div id="list-dataItem" class="content scaffold-list" role="main">
      <h1>用户类库列表：</h1>
      <table>
        <g:each in="${dataItemList}" status="i" var="item">
          <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td>${item.id}</td>
            <td>${item.dataKey.dataTag}</td>
            <td>${item?.subDataItems?.size()}</td>
          </tr>
        </g:each>
      </table>
    </div>
  </body>
</html>
