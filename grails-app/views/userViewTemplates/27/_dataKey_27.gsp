<div id="create-dataItem" class="content scaffold-create" role="main">
  <h1>静态生成的模板</h1>
  <form action="operation4Data/saveDataItem" method="post">
    <fieldset class="form">
      <table>
        <f:with bean="dataItem">
          <tr>
            <td>
              <label>测试性数据字典5/(15).数据标签5.3/(模型)</label>
            </td>
            <td>
              <input type="hidden" name="dataKey.id" value="27" />
            </td>
          </tr>
        </f:with>
      </table>
      <table>
        <tr>
          <td>
            <label>key5.3.0 dataKeyNormal</label>
            <input type="hidden" name="subDataItems[0].dataKey.id" value="28" />
            <input type="hidden" name="subDataItems[0].upDataItem.id" value="null" />
          </td>
          <td>
            <input name="subDataItems[0].dataValue" id="dataValue_0" />
          </td>
          <td />
        </tr>
        <tr>
          <td>
            <label>key5.3.1 dataKeyDate</label>
            <input type="hidden" name="subDataItems[1].dataKey.id" value="29" />
            <input type="hidden" name="subDataItems[1].upDataItem.id" value="null" />
          </td>
          <td>
            <input type="text" name="subDataItems[1].dataValue" id="dataValue_1" value="Mon Nov 19 09:57:58 CST 2018" class="datePicker" />
          </td>
          <td />
        </tr>
        <tr>
          <td>
            <label>key5.3.2 dataKeyDateTime</label>
            <input type="hidden" name="subDataItems[2].dataKey.id" value="30" />
            <input type="hidden" name="subDataItems[2].upDataItem.id" value="null" />
          </td>
          <td>
            <input type="text" name="subDataItems[2].dataValue" id="dataValue_2" class="dateTimePicker" />
          </td>
        </tr>
      </table>
    </fieldset>
    <fieldset class="buttons">
      <input type="submit" name="create" class="save" value="Create" />
    </fieldset>
  </form>
</div>
