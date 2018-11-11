<div id="create-dataItem" class="content scaffold-create" role="main">
  <g:uploadForm controller="operation4Data" action="saveDataItem">
    <fieldset class="form">
      <table>
        <f:with bean="dataItem">
          <tr>
            <td>
              <label>测试性数据字典6/(21).数据标签6.4/(模型)</label>
            </td>
            <td>
              <g:hiddenField name="dataKey.id" value="46" />
            </td>
          </tr>
        </f:with>
      </table>
      <table>
        <tr>
          <td>
            <label>key6.4.0 dataKeyNormal</label>
            <g:hiddenField name="subDataItems[0].dataKey.id" value="47" />
            <g:hiddenField name="subDataItems[0].upDataItem.id" value="null" />
          </td>
          <td>
            <g:textField name="subDataItems[0].dataValue" id="dataValue_0" />
          </td>
          <td />
        </tr>
        <tr>
          <td>
            <label>key6.4.1 dataKeyDate</label>
            <g:hiddenField name="subDataItems[1].dataKey.id" value="48" />
            <g:hiddenField name="subDataItems[1].upDataItem.id" value="null" />
          </td>
          <td>
            <input type="text" name="subDataItems[1].dataValue" id="dataValue_1" value="Sun Nov 11 11:36:09 CST 2018" class="datePicker" />
          </td>
          <td />
        </tr>
        <tr>
          <td>
            <label>key6.4.2 dataKeyDateTime</label>
            <g:hiddenField name="subDataItems[2].dataKey.id" value="49" />
            <g:hiddenField name="subDataItems[2].upDataItem.id" value="null" />
          </td>
          <td>
            <input type="text" name="subDataItems[2].dataValue" id="dataValue_2" class="dateTimePicker" />
          </td>
        </tr>
        <tr>
          <td>
            <label>key6.4.3 dataKeyEnum</label>
            <g:hiddenField name="subDataItems[3].dataKey.id" value="50" />
            <g:hiddenField name="subDataItems[3].upDataItem.id" value="null" />
          </td>
          <td>
            <g:select name="subDataItems[3].dataValue" from="['']" id="dataValue_3" />
          </td>
          <td />
        </tr>
      </table>
    </fieldset>
    <fieldset class="buttons">
      <g:submitButton name="create" class="save" value="Create" />
    </fieldset>
  </g:uploadForm>
</div>
