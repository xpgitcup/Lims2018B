<html>
<head/>

<body>
<div id="create-dataItem" class="content scaffold-create" role="main">
    <h1>静态生成的模板</h1>

    <form action="operation4Data/saveDataItem" method="post">
        <fieldset class="form">
            <table>
                <f:with bean="dataItem">
                    <tr>
                        <td>
                            <label>测试性数据字典9/(45).数据标签9.8/(模型)</label>
                        </td>
                        <td>
                            <input type="hidden" name="dataKey.id" value="157"/>
                        </td>
                    </tr>
                </f:with>
            </table>
            <table>
                <tr>
                    <td>
                        <label>key9.8.0 dataKeyNormal</label>
                        <input type="hidden" name="subDataItems[0].dataKey.id" value="158"/>
                        <input type="hidden" name="subDataItems[0].upDataItem.id" value="null"/>
                    </td>
                    <td>
                        <input name="subDataItems[0].dataValue" id="dataValue_0"/>
                    </td>
                    <td/>
                </tr>
                <tr>
                    <td>
                        <label>key9.8.1 dataKeyDate</label>
                        <input type="hidden" name="subDataItems[1].dataKey.id" value="159"/>
                        <input type="hidden" name="subDataItems[1].upDataItem.id" value="null"/>
                    </td>
                    <td>
                        <input type="text" name="subDataItems[1].dataValue" id="dataValue_1"
                               value="Mon Nov 19 14:08:54 CST 2018" class="datePicker"/>
                    </td>
                    <td/>
                </tr>
                <tr>
                    <td>
                        <label>key9.8.2 dataKeyDateTime</label>
                        <input type="hidden" name="subDataItems[2].dataKey.id" value="160"/>
                        <input type="hidden" name="subDataItems[2].upDataItem.id" value="null"/>
                    </td>
                    <td>
                        <input type="text" name="subDataItems[2].dataValue" id="dataValue_2" class="dateTimePicker"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>key9.8.3 dataKeyEnum</label>
                        <input type="hidden" name="subDataItems[3].dataKey.id" value="161"/>
                        <input type="hidden" name="subDataItems[3].upDataItem.id" value="null"/>
                    </td>
                    <td>
                        <select name="subDataItems[3].dataValue" id="dataValue_3">
                            <option value="张三">张三</option>
                            <option value=" 李四">李四</option>
                        </select>
                    </td>
                    <td/>
                </tr>
                <tr>
                    <td>
                        <label>key9.8.4 dataKeyFile</label>
                        <input type="hidden" name="subDataItems[4].dataKey.id" value="162"/>
                        <input type="hidden" name="subDataItems[4].upDataItem.id" value="null"/>
                    </td>
                    <td>
                        <input type="text" name="subDataItems[4].dataValue" id="file_4"/>
                    </td>
                    <td>
                        <input type="hidden" name="uploadFilePath" value=""/>
                        <input type="hidden" name="uploadFileDataKeyId" value="162"/>
                        <input type="hidden" name="uploadFileIndex" value="4"/>
                        <input type="file" name="uploadFile" id="input_4" onchange="updateUploadFileName(4)"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>key9.8.5 dataKeyRef</label>
                        <input type="hidden" name="subDataItems[5].dataKey.id" value="163"/>
                        <input type="hidden" name="subDataItems[5].upDataItem.id" value="null"/>
                    </td>
                    <td>
                        <select name="subDataItems[5].dataValue" id="dataValue_5">
                            <option value="测试性数据字典9/(45).key9.6.3 dataKeyEnum/(数据项)=测试性数据9.6.3.0">测试性数据字典9/(45).key9.6.3 dataKeyEnum/(数据项)=测试性数据9.6.3.0</option>
                            <option value="测试性数据字典9/(45).key9.6.3 dataKeyEnum/(数据项)=测试性数据9.6.3.1">测试性数据字典9/(45).key9.6.3 dataKeyEnum/(数据项)=测试性数据9.6.3.1</option>
                            <option value="测试性数据字典9/(45).key9.6.3 dataKeyEnum/(数据项)=测试性数据9.6.3.2">测试性数据字典9/(45).key9.6.3 dataKeyEnum/(数据项)=测试性数据9.6.3.2</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>key9.8.6 dataKeyNormal</label>
                        <input type="hidden" name="subDataItems[6].dataKey.id" value="164"/>
                        <input type="hidden" name="subDataItems[6].upDataItem.id" value="null"/>
                    </td>
                    <td>
                        <input name="subDataItems[6].dataValue" id="dataValue_6"/>
                    </td>
                    <td/>
                </tr>
                <tr>
                    <td>
                        <label>key9.8.7 dataKeyDate</label>
                        <input type="hidden" name="subDataItems[7].dataKey.id" value="165"/>
                        <input type="hidden" name="subDataItems[7].upDataItem.id" value="null"/>
                    </td>
                    <td>
                        <input type="text" name="subDataItems[7].dataValue" id="dataValue_7"
                               value="Mon Nov 19 14:08:54 CST 2018" class="datePicker"/>
                    </td>
                    <td/>
                </tr>
            </table>
        </fieldset>
        <fieldset class="buttons">
            <input type="submit" name="create" class="save" value="Create"/>
        </fieldset>
    </form>
</div>
<javascript>
    console.info("开始处理日期、时间。。。");
    $("input.datePicker").datepicker({
    showButtonPanel: true,
    dateFormat: "yy-mm-dd",
    defaultDate: 0
    });
</javascript>
</body>
</html>
