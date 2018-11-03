<div id="create-dataItem" class="content scaffold-create" role="main">
    <h1>静态视图24</h1>
    <g:uploadForm controller="operation4Data" action="saveDataItem">
        <fieldset class="form">
            <!--主关键字的信息 -->
            <table>
                <f:with bean="dataItem">
                    <tr>
                        <td>
                            数据标签5.2
                            <g:hiddenField name="dataKey.id" value="24"/>
                        </td>
                    </tr>
                </f:with>
            </table>
            <!--子关键字的信息 -->
            <table>
                <tr>
                    <td>
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

