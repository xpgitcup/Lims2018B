<div id="create-dataItem" class="content scaffold-create" role="main">
    <h1>静态视图21</h1>
    <g:uploadForm controller="operation4Data" action="saveDataItem">
        <fieldset class="form">
            <table>
                <tr>
                    <td>
                        数据标签5.0
                        <g:hiddenField name="dataKey.id" value="21"/>
                    </td>
                </tr>
            </table>
            <table>
            </table>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:uploadForm>
</div>

