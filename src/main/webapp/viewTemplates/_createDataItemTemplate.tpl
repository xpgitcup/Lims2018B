<div id="create-dataItem" class="content scaffold-create" role="main">
    <g:uploadForm controller="operation4Data" action="saveDataItem">
        <fieldset class="form">
            <table>
                <f:with bean="dataItem">
                    <tr>
                        <td>
                            \${dataItem.dataKey}
yieldUnescaped                            <g:hiddenField name="dataKey.id" value="${dataItem.dataKey.id}"/>
                        </td>
                        <td>
                            <!--f:field property="dataValue"/-->
                        </td>
                    </tr>
                </f:with>
            </table>
            <table>
            </table>
        </fieldset>
        <fieldset class="buttons">
yieldUnescaped   <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:uploadForm>
</div>
