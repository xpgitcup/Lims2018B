<div id='create-dataItem' class='content scaffold-create' role='main'>
  <g:uploadForm controller='operation4Data' action='saveDataItem'>
    <fieldset class='form'>
      <table>
        <f:with bean='dataItem'>
          <tr>
            <td>
              <label>测试性数据字典5/(15).数据标签5.2/(模型)</label>
            </td>
            <td>
              <g:hiddenField name='dataKey.id' value='24' />
            </td>
          </tr>
        </f:with>
      </table>
      <table>
        <tr>
          <td>
            <label>key5.2.0 dataKeyNormal</label>
            <g:hiddenField name='subDataItems[0].dataKey.id' value='25' />
            <g : hiddenField name='subDataItems[0].upDataItem.id' value='null' />
          </td>
          <td>
            <g:textField name='subDataItems[0].dataValue' id='dataValue_0' />
          </td>
          <td />
        </tr>
        <tr>
          <td>
            <label>key5.2.1 dataKeyDate</label>
            <g:hiddenField name='subDataItems[1].dataKey.id' value='26' />
            <g : hiddenField name='subDataItems[1].upDataItem.id' value='null' />
          </td>
          <td>
            <input type='text' name='subDataItems[1].dataValue' id='dataValue_1' value='Mon Nov 05 22:31:47 CST 2018' class='datePicker' />
          </td>
          <td />
        </tr>
      </table>
    </fieldset>
    <fieldset class='buttons'>
      <g:submitButton name='create' class='save' value='Create' />
    </fieldset>
  </g:uploadForm>
</div>
