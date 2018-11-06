<div id="create-dataItem" class="content scaffold-create" role="main">
  <g:uploadForm controller="operation4Data" action="saveDataItem">
    <fieldset class="form">
      <table>
        <f:with bean="dataItem">
          <tr>
            <td>
              <label>测试性数据字典9/(45).数据标签9.7/(模型)</label>
            </td>
            <td>
              <g:hiddenField name="dataKey.id" value="149" />
            </td>
          </tr>
        </f:with>
      </table>
      <table>
        <tr>
          <td>
            <label>key9.7.0 dataKeyNormal</label>
            <g:hiddenField name="subDataItems[0].dataKey.id" value="150" />
            <g:hiddenField name="subDataItems[0].upDataItem.id" value="null" />
          </td>
          <td>
            <g:textField name="subDataItems[0].dataValue" id="dataValue_0" />
          </td>
          <td />
        </tr>
        <tr>
          <td>
            <label>key9.7.1 dataKeyDate</label>
            <g:hiddenField name="subDataItems[1].dataKey.id" value="151" />
            <g:hiddenField name="subDataItems[1].upDataItem.id" value="null" />
          </td>
          <td>
            <input type="text" name="subDataItems[1].dataValue" id="dataValue_1" value="Tue Nov 06 10:02:16 CST 2018" class="datePicker" />
          </td>
          <td />
        </tr>
        <tr>
          <td>
            <label>key9.7.2 dataKeyDateTime</label>
            <g:hiddenField name="subDataItems[2].dataKey.id" value="152" />
            <g:hiddenField name="subDataItems[2].upDataItem.id" value="null" />
          </td>
          <td>
            <input type="text" name="subDataItems[2].dataValue" id="dataValue_2" class="dateTimePicker" />
          </td>
        </tr>
        <tr>
          <td>
            <label>key9.7.3 dataKeyEnum</label>
            <g:hiddenField name="subDataItems[3].dataKey.id" value="153" />
            <g:hiddenField name="subDataItems[3].upDataItem.id" value="null" />
          </td>
          <td>
            <g:select name="subDataItems[3].dataValue" from="[]" id="dataValue_3" />
          </td>
          <td />
        </tr>
        <tr>
          <td>
            <label>key9.7.4 dataKeyFile</label>
            <g:hiddenField name="subDataItems[4].dataKey.id" value="154" />
            <g:hiddenField name="subDataItems[4].upDataItem.id" value="null" />
          </td>
          <td>
            <g:textField name="subDataItems[4].dataValue" id="file_4" />
          </td>
          <td>
            <g:hiddenField name="uploadFilePath" value="" />
            <g:hiddenField name="uploadFileDataKeyId" value="154" />
            <g:hiddenField name="uploadFileIndex" value="4" />
            <input type="file" name="uploadFile" id="input_4" onchange="updateUploadFileName(4)" />
          </td>
        </tr>
        <tr>
          <td>
            <label>key9.7.5 dataKeyRef</label>
            <g:hiddenField name="subDataItems[5].dataKey.id" value="155" />
            <g:hiddenField name="subDataItems[5].upDataItem.id" value="null" />
          </td>
          <td>
            <g:select name="subDataItems[5].dataValue" from="[]" optionKey="id" noSelection="${['null': 'Select One...']}" />
          </td>
        </tr>
        <tr>
          <td>
            <label>key9.7.6 dataKeyNormal</label>
            <g:hiddenField name="subDataItems[6].dataKey.id" value="156" />
            <g:hiddenField name="subDataItems[6].upDataItem.id" value="null" />
          </td>
          <td>
            <g:textField name="subDataItems[6].dataValue" id="dataValue_6" />
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
