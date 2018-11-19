<div id="create-dataItem" class="content scaffold-create" role="main">
  <h1>静态生成的模板</h1>
  <form action="operation4Data/saveDataItem" method="post">
    <fieldset class="form">
      <table>
        <f:with bean="dataItem">
          <tr>
            <td>
              <label>测试性数据字典9/(45).数据标签9.5/(模型)</label>
            </td>
            <td>
              <input type="hidden" name="dataKey.id" value="136" />
            </td>
          </tr>
        </f:with>
      </table>
      <table>
        <tr>
          <td>
            <label>key9.5.0 dataKeyNormal</label>
            <input type="hidden" name="subDataItems[0].dataKey.id" value="137" />
            <input type="hidden" name="subDataItems[0].upDataItem.id" value="null" />
          </td>
          <td>
            <input name="subDataItems[0].dataValue" id="dataValue_0" />
          </td>
          <td />
        </tr>
        <tr>
          <td>
            <label>key9.5.1 dataKeyDate</label>
            <input type="hidden" name="subDataItems[1].dataKey.id" value="138" />
            <input type="hidden" name="subDataItems[1].upDataItem.id" value="null" />
          </td>
          <td>
            <input type="text" name="subDataItems[1].dataValue" id="dataValue_1" value="Mon Nov 19 10:25:28 CST 2018" class="datePicker" />
          </td>
          <td />
        </tr>
        <tr>
          <td>
            <label>key9.5.2 dataKeyDateTime</label>
            <input type="hidden" name="subDataItems[2].dataKey.id" value="139" />
            <input type="hidden" name="subDataItems[2].upDataItem.id" value="null" />
          </td>
          <td>
            <input type="text" name="subDataItems[2].dataValue" id="dataValue_2" class="dateTimePicker" />
          </td>
        </tr>
        <tr>
          <td>
            <label>key9.5.3 dataKeyEnum</label>
            <input type="hidden" name="subDataItems[3].dataKey.id" value="140" />
            <input type="hidden" name="subDataItems[3].upDataItem.id" value="null" />
          </td>
          <td>
            <select name="subDataItems[3].dataValue" from="['']" id="dataValue_3">
              <option value="''" />
            </select>
          </td>
          <td />
        </tr>
        <tr>
          <td>
            <label>key9.5.4 dataKeyFile</label>
            <input type="hidden" name="subDataItems[4].dataKey.id" value="141" />
            <input type="hidden" name="subDataItems[4].upDataItem.id" value="null" />
          </td>
          <td>
            <input type="text" name="subDataItems[4].dataValue" id="file_4" />
          </td>
          <td>
            <input type="hidden" name="uploadFilePath" value="" />
            <input type="hidden" name="uploadFileDataKeyId" value="141" />
            <input type="hidden" name="uploadFileIndex" value="4" />
            <input type="file" name="uploadFile" id="input_4" onchange="updateUploadFileName(4)" />
          </td>
        </tr>
      </table>
    </fieldset>
    <fieldset class="buttons">
      <input type="submit" name="create" class="save" value="Create" />
    </fieldset>
  </form>
</div>
