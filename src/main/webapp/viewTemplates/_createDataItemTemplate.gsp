<div id="create-dataItem" class="content scaffold-create" role="main">
    <h1>静态视图$dataKeyId</h1>
    <g:uploadForm controller="operation4Data" action="saveDataItem">
        <fieldset class="form">
            <!--主关键字的信息 -->
            <table>
                <f:with bean="dataItem">
                    <tr>
                        <td>
                            $keylabel
                            <g:hiddenField name="dataKey.id" value="${dataKeyId}"/>
                        </td>
                    </tr>
                </f:with>
            </table>
            <!--子关键字的信息 -->
            <table>
                $subkeyFields
            </table>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save"
                            value="\${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:uploadForm>
</div>
