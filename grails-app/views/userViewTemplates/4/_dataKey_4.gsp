<html>
  <head>
    <meta name="layout" content="main" />
  </head>
  <body>
    <div id="create-dataItem" class="content scaffold-create" role="main">
      <h1>静态生成的模板</h1>
      <form action="operation4Data/saveDataItem" method="post" enctype="multipart/form-data">
        <fieldset class="form">
          <table>
            <f:with bean="dataItem">
              <tr>
                <td>
                  <label>实验室信息管理/(14).项目信息/(模型)</label>
                </td>
                <td>
                  <input type="hidden" name="dataKey.id" value="4" />
                </td>
              </tr>
            </f:with>
          </table>
          <table>
            <tr>
              <td>
                <label>项目名称</label>
                <input type="hidden" name="subDataItems[0].dataKey.id" value="11" />
                <input type="hidden" name="subDataItems[0].upDataItem.id" value="null" />
              </td>
              <td>
                <input name="subDataItems[0].dataValue" id="dataValue_0" />
              </td>
              <td />
            </tr>
            <tr>
              <td>
                <label>项目类别</label>
                <input type="hidden" name="subDataItems[1].dataKey.id" value="12" />
                <input type="hidden" name="subDataItems[1].upDataItem.id" value="null" />
              </td>
              <td>
                <input name="subDataItems[1].dataValue" id="dataValue_1" />
              </td>
              <td />
            </tr>
          </table>
        </fieldset>
        <fieldset class="buttons">
          <input type="submit" name="create" class="save" value="Create" />
        </fieldset>
      </form>
    </div>
  </body>
</html>
