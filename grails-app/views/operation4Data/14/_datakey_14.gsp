<?xml version='1.0' encoding='UTF-8'/><div id='create-dataItem' class='content scaffold-create'
                                           role='main'><g:uploadForm controller='operation4Data'
                                                                     action='saveDataItem'><fieldset
                class='form'><table><f:with
                    bean='dataItem'><tr><td><label>&#x6d4b;&#x8bd5;&#x6027;&#x6570;&#x636e;&#x5b57;&#x5178;4/(10).&#x6570;&#x636e;&#x6807;&#x7b7e;4.2/(&#x6a21;&#x578b;)</label>
                </td><td><g:hiddenField name='dataKey.id' value='14'/></td></tr></f:with>
            </table>
            <table>
                <tr>
                    <td>
                        <label>key4.2.0 dataKeyNormal</label>
                        <g:hiddenField name='subDataItems[0].dataKey.id' value='15'/>
                        <g : hiddenField name='subDataItems[0].upDataItem.id' value='null'/>
                    </td>
                    <td>
                        <g:textField name='subDataItems[0].dataValue' id='dataValue_0'/>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td><label>key4.2.1 dataKeyDate</label>
                        <g:hiddenField name='subDataItems[1].dataKey.id'  value='16'/>
                        <g : hiddenField name='subDataItems[1].upDataItem.id' value='null'/>
                    </td>
                    <td>
                        <input type='text' name='subDataItems[1].dataValue' id='dataValue_1'
                               value='Mon Nov 05 22:03:09 CST 2018'
                               class='datePicker'/></td>
                    <td>
                    </td>
                </tr>
            </table>
        </fieldset>
    </g:uploadForm>
</div>
