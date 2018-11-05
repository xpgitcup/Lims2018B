<div id='create-dataItem' class='content scaffold-create' role='main'>
  <g:uploadForm controller='operation4Data' action='saveDataItem'>
    <fieldset class='form'>
      <table>
        <f:with bean='dataItem'>
          <tr>
            <td>
              <label>测试性数据字典5/(15).数据标签5.3/(模型)</label>
            </td>
            <td>
              <g:hiddenField name='dataKey.id' value='27' />
            </td>
          </tr>
        </f:with>
      </table>
      <table>
        <tr>
          <td>
            <label>key5.3.0 dataKeyNormal</label>
            <g:hiddenField name='subDataItems[0].dataKey.id' value='28' />
            <g : hiddenField name='subDataItems[0].upDataItem.id' value='null' />
          </td>
          <td>
            <g:textField name='subDataItems[0].dataValue' id='dataValue_0' />
          </td>
          <td />
        </tr>
        <tr>
          <td>
            <label>key5.3.1 dataKeyDate</label>
            <g:hiddenField name='subDataItems[1].dataKey.id' value='29' />
            <g : hiddenField name='subDataItems[1].upDataItem.id' value='null' />
          </td>
          <td>
            <input type='text' name='subDataItems[1].dataValue' id='dataValue_1' value='Mon Nov 05 22:39:38 CST 2018' class='datePicker' />
          </td>
          <td />
        </tr>
        <tr>
          <td>
            <label>key5.3.2 dataKeyDateTime</label>
            <g:hiddenField name='subDataItems[2].dataKey.id' value='30' />
            <g : hiddenField name='subDataItems[2].upDataItem.id' value='null' />
          </td>
          <td>
            <input type='text' name='subDataItems[2].dataValue' id='dataValue_2' class='dateTimePicker' />
          </td>
        </tr>
      </table>
    </fieldset>
    <fieldset class='buttons'>
      <g:submitButton name='create' class='save' value='Create' />
    </fieldset>
  </g:uploadForm>
</div>
