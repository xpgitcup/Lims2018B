<div id='create-dataItem' class='content scaffold-create' role='main'>
  <g:uploadForm controller='operation4Data' action='saveDataItem'>
    <fieldset class='form'>
      <table>
        <f:with bean='dataItem'>
          <tr>
            <td>
              <label>测试性数据字典7/(28).数据标签7.6/(模型)</label>
            </td>
            <td>
              <g:hiddenField name='dataKey.id' value='78' />
            </td>
          </tr>
        </f:with>
      </table>
      <table>
        <tr>
          <td>
            <label>key7.6.0 dataKeyNormal</label>
            <g:hiddenField name='subDataItems[0].dataKey.id' value='79' />
            <g:hiddenField name='subDataItems[0].upDataItem.id' value='null' />
          </td>
          <td>
            <g:textField name='subDataItems[0].dataValue' id='dataValue_0' />
          </td>
          <td />
        </tr>
        <tr>
          <td>
            <label>key7.6.1 dataKeyDate</label>
            <g:hiddenField name='subDataItems[1].dataKey.id' value='80' />
            <g:hiddenField name='subDataItems[1].upDataItem.id' value='null' />
          </td>
          <td>
            <input type='text' name='subDataItems[1].dataValue' id='dataValue_1' value='Mon Nov 05 23:06:58 CST 2018' class='datePicker' />
          </td>
          <td />
        </tr>
        <tr>
          <td>
            <label>key7.6.2 dataKeyDateTime</label>
            <g:hiddenField name='subDataItems[2].dataKey.id' value='81' />
            <g:hiddenField name='subDataItems[2].upDataItem.id' value='null' />
          </td>
          <td>
            <input type='text' name='subDataItems[2].dataValue' id='dataValue_2' class='dateTimePicker' />
          </td>
        </tr>
        <tr>
          <td>
            <label>key7.6.3 dataKeyEnum</label>
            <g:hiddenField name='subDataItems[3].dataKey.id' value='82' />
            <g:hiddenField name='subDataItems[3].upDataItem.id' value='null' />
          </td>
          <td />
          <td />
        </tr>
        <tr>
          <td>
            <label>key7.6.4 dataKeyFile</label>
            <g:hiddenField name='subDataItems[4].dataKey.id' value='83' />
            <g:hiddenField name='subDataItems[4].upDataItem.id' value='null' />
          </td>
          <td>
            <g:textField name='subDataItems[4].dataValue' id='file_4' />
          </td>
          <td>
            <g:hiddenField name='uploadFilePath' value='' />
            <g:hiddenField name='uploadFileDataKeyId' value='83' />
            <g:hiddenField name='uploadFileIndex' value='4' />
            <input type='file' name='uploadFile' id='input_4' onchange='updateUploadFileName(4)' />
          </td>
        </tr>
        <tr>
          <td>
            <label>key7.6.5 dataKeyRef</label>
            <g:hiddenField name='subDataItems[5].dataKey.id' value='84' />
            <g:hiddenField name='subDataItems[5].upDataItem.id' value='null' />
          </td>
          <td>
            <g:select name='subDataItems[5].dataValue' from='[]' optionKey='id' noSelection="" />
          </td>
        </tr>
      </table>
    </fieldset>
    <fieldset class='buttons'>
      <g:submitButton name='create' class='save' value='Create' />
    </fieldset>
  </g:uploadForm>
</div>
