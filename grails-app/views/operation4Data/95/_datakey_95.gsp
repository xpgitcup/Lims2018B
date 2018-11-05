<div id='create-dataItem' class='content scaffold-create' role='main'>
    <g:uploadForm controller='operation4Data' action='saveDataItem'>
        <fieldset class='form'><table><f:with
                bean='dataItem'><tr><td><label>&#x6d4b;&#x8bd5;&#x6027;&#x6570;&#x636e;&#x5b57;&#x5178;8/(36).&#x6570;&#x636e;&#x6807;&#x7b7e;8.4/(&#x6a21;&#x578b;)</label>
            </td><td><g:hiddenField name='dataKey.id' value='95'/></td></tr></f:with>
        </table><table><tr><td><label>key8.4.0 dataKeyNormal</label><g:hiddenField name='subDataItems[0].dataKey.id'
                                                                                   value='96'/><g : hiddenField
                                                                                                  name='subDataItems[0].upDataItem.id'
                                                                                                  value='null'/>
        </td><td><g:textField name='subDataItems[0].dataValue' id='dataValue_0'/></td><td></td>
        </tr><tr><td><label>key8.4.1 dataKeyDate</label><g:hiddenField name='subDataItems[1].dataKey.id' value='97'/><g
                : hiddenField name='subDataItems[1].upDataItem.id' value='null'/></td><td><input type='text'
                                                                                                 name='subDataItems[1].dataValue'
                                                                                                 id='dataValue_1'
                                                                                                 value='Mon Nov 05 20:41:27 CST 2018'
                                                                                                 class='datePicker'/>
        </td><td></td></tr><tr><td><label>key8.4.2 dataKeyDateTime</label><g:hiddenField
                name='subDataItems[2].dataKey.id' value='98'/><g : hiddenField name='subDataItems[2].upDataItem.id'
                                                                 value='null'/></td><td><input type='text'
                                                                                               name='subDataItems[2].dataValue'
                                                                                               id='dataValue_2'
                                                                                               class='dateTimePicker'/>
        </td></tr><tr><td><label>key8.4.3 dataKeyEnum</label><g:hiddenField name='subDataItems[3].dataKey.id'
                                                                            value='99'/><g : hiddenField
                                                                                           name='subDataItems[3].upDataItem.id'
                                                                                           value='null'/>
        </td><td><g:select name='subDataItems[3].dataValue' from='[]' noSelection='-Choose-'/>
        </td>
            <td>

            </td>
        </tr>
        </table>
        </fieldset>
    </g:uploadForm>
</div>
