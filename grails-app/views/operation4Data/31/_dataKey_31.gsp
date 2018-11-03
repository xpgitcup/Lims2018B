<div id="create-dataItem" class="content scaffold-create" role="main">
    <h1>静态视图31</h1>
    <g:uploadForm controller="operation4Data" action="saveDataItem">
        <fieldset class="form">
            <!--主关键字的信息 -->
            <table>
                <f:with bean="dataItem">
                    <tr>
                        <td>
                            数据标签5.4
                            <g:hiddenField name="dataKey.id" value="31"/>
                        </td>
                    </tr>
                </f:with>
            </table>
            <!--子关键字的信息 -->
            <table>
                <tr>
    <td>
        <input type="text" name="subDataItems[0].dataValue" id="" value="dataValue_0" class="datePicker"/>
    </td>
</tr><tr>
    <td>
        <input type="text" name="subDataItems[1].dataValue" id="" value="dataValue_1" class="datePicker"/>
    </td>
</tr><tr>
    <td>
        <input type="text" name="subDataItems[2].dataValue" id="" value="dataValue_2" class="datePicker"/>
    </td>
</tr><tr>
    <td>
        <input type="text" name="subDataItems[3].dataValue" id="" value="dataValue_3" class="datePicker"/>
    </td>
</tr>
            </table>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:uploadForm>
</div>

