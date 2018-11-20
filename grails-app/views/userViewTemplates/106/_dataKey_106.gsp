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
                  <label>测试性数据字典8/(36).数据标签8.6/(模型)</label>
                </td>
                <td>
                  <input type="hidden" name="dataKey.id" value="106" />
                </td>
              </tr>
            </f:with>
          </table>
          <table>
            <tr>
              <td>
                <label>key8.6.0 dataKeyNormal</label>
                <input type="hidden" name="subDataItems[0].dataKey.id" value="107" />
                <input type="hidden" name="subDataItems[0].upDataItem.id" value="null" />
              </td>
              <td>
                <input name="subDataItems[0].dataValue" id="dataValue_0" />
              </td>
              <td />
            </tr>
            <tr>
              <td>
                <label>key8.6.1 dataKeyDate</label>
                <input type="hidden" name="subDataItems[1].dataKey.id" value="108" />
                <input type="hidden" name="subDataItems[1].upDataItem.id" value="null" />
              </td>
              <td>
                <input type="text" name="subDataItems[1].dataValue" id="dataValue_1" value="Tue Nov 20 08:58:46 CST 2018" class="datePicker" />
              </td>
              <td />
            </tr>
            <tr>
              <td>
                <label>key8.6.2 dataKeyDateTime</label>
                <input type="hidden" name="subDataItems[2].dataKey.id" value="109" />
                <input type="hidden" name="subDataItems[2].upDataItem.id" value="null" />
              </td>
              <td>
                <input type="text" name="subDataItems[2].dataValue" id="dataValue_2" class="dateTimePicker" />
              </td>
            </tr>
            <tr>
              <td>
                <label>key8.6.3 dataKeyEnum</label>
                <input type="hidden" name="subDataItems[3].dataKey.id" value="110" />
                <input type="hidden" name="subDataItems[3].upDataItem.id" value="null" />
              </td>
              <td>
                <select name="subDataItems[3].dataValue" id="dataValue_3">
                  <option value=""></option>
                </select>
              </td>
              <td>
                <h1>附加信息：</h1>
              </td>
            </tr>
            <tr>
              <td>
                <label>key8.6.4 dataKeyFile</label>
                <input type="hidden" name="subDataItems[4].dataKey.id" value="111" />
                <input type="hidden" name="subDataItems[4].upDataItem.id" value="null" />
              </td>
              <td>
                <input type="text" name="subDataItems[4].dataValue" id="file_4" />
              </td>
              <td>
                <input type="hidden" name="uploadedFilePath" value="" />
                <input type="hidden" name="uploadedFileDataKeyId" value="111" />
                <input type="hidden" name="uploadedFileIndex" value="4" />
                <input type="file" name="uploadedFile" id="input_4" onchange="updateUploadFileName(4)" />
              </td>
            </tr>
            <tr>
              <td>
                <label>key8.6.5 dataKeyRef</label>
                <input type="hidden" name="subDataItems[5].dataKey.id" value="112" />
                <input type="hidden" name="subDataItems[5].upDataItem.id" value="null" />
              </td>
              <td>
                <select name="subDataItems[5].dataValue" id="dataValue_5" />
              </td>
              <td>
                <h1>附加信息：</h1>
              </td>
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
