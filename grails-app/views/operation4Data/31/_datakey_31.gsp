<div id='create-dataItem' class='content scaffold-create' role='main'>
  <g:uploadForm controller='operation4Data' action='saveDataItem'>
    <fieldset class='form'>
      <table>
        <f:with bean='dataItem'>
          <tr>
            <td>
              <label>测试性数据字典5/(15).数据标签5.4/(模型)</label>
            </td>
            <td>
              <g:hiddenField name='dataKey.id' value='31' />
            </td>
          </tr>
        </f:with>
      </table>
      <table>
        <tr>
          <td>
            <label>key5.4.0 dataKeyNormal</label>
            <g:hiddenField name='subDataItems[0].dataKey.id' value='32' />
            <g:hiddenField name='subDataItems[0].upDataItem.id' value='null' />
          </td>
          <td>
            <g:textField name='subDataItems[0].dataValue' id='dataValue_0' />
          </td>
          <td />
        </tr>
        <tr>
          <td>
            <label>key5.4.1 dataKeyDate</label>
            <g:hiddenField name='subDataItems[1].dataKey.id' value='33' />
            <g:hiddenField name='subDataItems[1].upDataItem.id' value='null' />
          </td>
          <td>
            <input type='text' name='subDataItems[1].dataValue' id='dataValue_1' value='Mon Nov 05 23:03:27 CST 2018' class='datePicker' />
          </td>
          <td />
        </tr>
        <tr>
          <td>
            <label>key5.4.2 dataKeyDateTime</label>
            <g:hiddenField name='subDataItems[2].dataKey.id' value='34' />
            <g:hiddenField name='subDataItems[2].upDataItem.id' value='null' />
          </td>
          <td>
            <input type='text' name='subDataItems[2].dataValue' id='dataValue_2' class='dateTimePicker' />
          </td>
        </tr>
        <tr>
          <td>
            <label>key5.4.3 dataKeyEnum</label>
            <g:hiddenField name='subDataItems[3].dataKey.id' value='35' />
            <g:hiddenField name='subDataItems[3].upDataItem.id' value='null' />
          </td>
          <td />
          <td />
        </tr>
      </table>
    </fieldset>
    <fieldset class='buttons'>
      <g:submitButton name='create' class='save' value='Create' />
    </fieldset>
  </g:uploadForm>
</div>
