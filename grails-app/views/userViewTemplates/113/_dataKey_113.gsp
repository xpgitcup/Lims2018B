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
                  <label>测试性数据字典8/(36).数据标签8.7/(模型)</label>
                </td>
                <td>
                  <input type="hidden" name="dataKey.id" value="113" />
                </td>
              </tr>
            </f:with>
          </table>
          <table>
            <tr>
              <td>
                <label>key8.7.0 dataKeyNormal</label>
                <input type="hidden" name="subDataItems[0].dataKey.id" value="114" />
                <input type="hidden" name="subDataItems[0].upDataItem.id" value="null" />
              </td>
              <td>
                <input name="subDataItems[0].dataValue" id="dataValue_0" />
              </td>
              <td />
            </tr>
            <tr>
              <td>
                <label>key8.7.1 dataKeyDate</label>
                <input type="hidden" name="subDataItems[1].dataKey.id" value="115" />
                <input type="hidden" name="subDataItems[1].upDataItem.id" value="null" />
              </td>
              <td>
                <input type="text" name="subDataItems[1].dataValue" id="dataValue_1" value="Tue Nov 20 08:55:51 CST 2018" class="datePicker" />
              </td>
              <td />
            </tr>
            <tr>
              <td>
                <label>key8.7.2 dataKeyDateTime</label>
                <input type="hidden" name="subDataItems[2].dataKey.id" value="116" />
                <input type="hidden" name="subDataItems[2].upDataItem.id" value="null" />
              </td>
              <td>
                <input type="text" name="subDataItems[2].dataValue" id="dataValue_2" class="dateTimePicker" />
              </td>
            </tr>
            <tr>
              <td>
                <label>key8.7.3 dataKeyEnum</label>
                <input type="hidden" name="subDataItems[3].dataKey.id" value="117" />
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
                <label>key8.7.4 dataKeyFile</label>
                <input type="hidden" name="subDataItems[4].dataKey.id" value="118" />
                <input type="hidden" name="subDataItems[4].upDataItem.id" value="null" />
              </td>
              <td>
                <input type="text" name="subDataItems[4].dataValue" id="file_4" />
              </td>
              <td>
                <input type="hidden" name="uploadedFilePath" value="" />
                <input type="hidden" name="uploadedFileDataKeyId" value="118" />
                <input type="hidden" name="uploadedFileIndex" value="4" />
                <input type="file" name="uploadedFile" id="input_4" onchange="updateUploadFileName(4)" />
              </td>
            </tr>
            <tr>
              <td>
                <label>key8.7.5 dataKeyRef</label>
                <input type="hidden" name="subDataItems[5].dataKey.id" value="119" />
                <input type="hidden" name="subDataItems[5].upDataItem.id" value="null" />
              </td>
              <td>
                <select name="subDataItems[5].dataValue" id="dataValue_5" />
              </td>
              <td>
                <h1>附加信息：</h1>
              </td>
            </tr>
            <tr>
              <td>
                <label>key8.7.6 dataKeyNormal</label>
                <input type="hidden" name="subDataItems[6].dataKey.id" value="120" />
                <input type="hidden" name="subDataItems[6].upDataItem.id" value="null" />
              </td>
              <td>
                <input name="subDataItems[6].dataValue" id="dataValue_6" />
              </td>
              <td />
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
