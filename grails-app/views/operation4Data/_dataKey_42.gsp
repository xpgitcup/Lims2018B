<div id="create-dataItem" class="content scaffold-create" role="main">
  <g:uploadForm controller="operation4Data" action="saveDataItem">
    <fieldset class="form">
      <table>
        <f:with bean="dataItem">
          <tr>
            <td>
              <label>测试性数据字典6/(21).数据标签6.3/(模型)</label>
            </td>
            <td>
              <g:hiddenField name="dataKey.id" value="42" />
            </td>
          </tr>
        </f:with>
      </table>
      <table>
        <tr>
          <td>
            <label>key6.3.0 dataKeyNormal</label>
            <g:hiddenField name="subDataItems[0].dataKey.id" value="43" />
            <g:hiddenField name="subDataItems[0].upDataItem.id" value="null" />
          </td>
          <td>
            <g:textField name="subDataItems[0].dataValue" id="dataValue_0" />
          </td>
          <td />
        </tr>
        <tr>
          <td>
            <label>key6.3.1 dataKeyDate</label>
            <g:hiddenField name="subDataItems[1].dataKey.id" value="44" />
            <g:hiddenField name="subDataItems[1].upDataItem.id" value="null" />
          </td>
          <td>
            <input type="text" name="subDataItems[1].dataValue" id="dataValue_1" value="Sun Nov 11 11:37:29 CST 2018" class="datePicker" />
          </td>
          <td />
        </tr>
        <tr>
          <td>
            <label>key6.3.2 dataKeyDateTime</label>
            <g:hiddenField name="subDataItems[2].dataKey.id" value="45" />
            <g:hiddenField name="subDataItems[2].upDataItem.id" value="null" />
          </td>
          <td>
            <input type="text" name="subDataItems[2].dataValue" id="dataValue_2" class="dateTimePicker" />
          </td>
        </tr>
      </table>
    </fieldset>
    <fieldset class="buttons">
      <g:submitButton name="create" class="save" value="Create" />
    </fieldset>
  </g:uploadForm>
</div>
