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
                  <label>实验室信息管理/(14).教师信息/(模型)</label>
                </td>
                <td>
                  <input type="hidden" name="dataKey.id" value="1" />
                </td>
              </tr>
            </f:with>
          </table>
          <table>
            <tr>
              <td>
                <label>姓名</label>
                <input type="hidden" name="subDataItems[0].dataKey.id" value="6" />
                <input type="hidden" name="subDataItems[0].upDataItem.id" value="null" />
              </td>
              <td>
                <input name="subDataItems[0].dataValue" id="dataValue_0" />
              </td>
              <td />
            </tr>
            <tr>
              <td>
                <label>工号</label>
                <input type="hidden" name="subDataItems[1].dataKey.id" value="7" />
                <input type="hidden" name="subDataItems[1].upDataItem.id" value="null" />
              </td>
              <td>
                <input name="subDataItems[1].dataValue" id="dataValue_1" />
              </td>
              <td />
            </tr>
            <tr>
              <td>
                <label>职称</label>
                <input type="hidden" name="subDataItems[2].dataKey.id" value="8" />
                <input type="hidden" name="subDataItems[2].upDataItem.id" value="null" />
              </td>
              <td>
                <input name="subDataItems[2].dataValue" id="dataValue_2" />
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
