<!DOCTYPE html>
<div id="create-dataItem" class="content scaffold-create" role="main">
    <h1>静态模板</h1>
    <g:uploadForm controller="operation4Data" action="saveDataItem">
        <fieldset class="form">
            <table>
                <f:with bean="dataItem">
                    <tr>
                        <td>
                            ${dataItem.dataKey}
                            <g:hiddenField name="dataKey.id" value="${dataItem.dataKey.id}"/>
                        </td>
                        <td>
                        </td>
                    </tr>
                </f:with>
            </table>
            <table>
                <g:each in="${dataItem.subDataItems}" var="subItem" status="i">
                    <tr>
                        <td>
                            ${dataItem.subDataItems[i].dataKey.dataTag}
                            <g:hiddenField name="subDataItems[${i}].dataKey.id"
                                           value="${dataItem.subDataItems[i].dataKey.id}"/>
                            <g:hiddenField name="subDataItems[${i}].upDataItem.id"
                                           value="${dataItem.id}"></g:hiddenField>
                        </td>
                    <!--针对普通类型的-->
                        <g:if test="${subItem.dataKey.dataKeyType == cn.edu.cup.dictionary.DataKeyType.dataKeyNormal}">
                            <td>
                                <g:textField name="subDataItems[${i}].dataValue" id="dataValue_${i}"/>
                            </td>
                            <td>
                            </td>
                        </g:if>
                    <!--针对时间日期类型的-->
                        <g:if test="${subItem.dataKey.dataKeyType == cn.edu.cup.dictionary.DataKeyType.dataKeyDate}">
                            <td>
                                <!--g:textField name="subDataItems[${i}].dataValue" id=""/-->
                                <!--g:formatDate format="yyyy-MM-dd" date="${date}"/-->
                                <!--g:datePicker name="subDataItems[${i}].dataValue" id="dataValue_${i}"
                                                  value="${new Date()}"/-->
                                <!--input type="date" name="subDataItems[${i}].dataValue" id="dataValue_${i}"
                                       value="${new java.util.Date()}"/-->
                                <input type="text" name="subDataItems[${i}].dataValue" id="dataValue_${i}"
                                       value="${new java.util.Date()}" class="datePicker"/>
                            </td>
                            <td>
                            </td>
                        </g:if>
                    <!--针对时间日期类型的-->
                        <g:if test="${subItem.dataKey.dataKeyType == cn.edu.cup.dictionary.DataKeyType.dataKeyDateTime}">
                            <td>
                                <input type="text" name="subDataItems[${i}].dataValue" id="dataValue_${i}"
                                       class="dateTimePicker"/>
                            </td>
                            <td>
                            </td>
                        </g:if>
                    <!--针对枚举类型的-->
                        <g:if test="${subItem.dataKey.dataKeyType == cn.edu.cup.dictionary.DataKeyType.dataKeyEnum}">
                            <td>
                                <g:select name="subDataItems[${i}].dataValue" from="${subItem.dataKey?.enumItems()}"
                                          noSelection="['': '-Choose-']"/>
                            </td>
                            <td>
                            </td>
                        </g:if>
                    <!--针对文件的-->
                        <g:if test="${subItem.dataKey.dataKeyType == cn.edu.cup.dictionary.DataKeyType.dataKeyFile}">
                            <td>
                                <g:textField name="subDataItems[${i}].dataValue" id="file_${i}"/>
                            </td>
                            <td>
                                <g:hiddenField name="uploadFilePath" value="${subItem.dataKey.appendParameter}"/>
                                <g:hiddenField name="uploadFileDataKeyId" value="${subItem.dataKey.id}"/>
                                <g:hiddenField name="uploadFileIndex" value="${i}"/>
                                <input type="file" name="uploadFile" id="input_${i}"
                                       onchange="updateUploadFileName(${i})"/>
                            </td>
                        </g:if>
                    <!--针对引用类型的-->
                        <g:if test="${subItem.dataKey.dataKeyType == cn.edu.cup.dictionary.DataKeyType.dataKeyRef}">
                            <td>
                                <g:select name="subDataItems[${i}].dataValue"
                                          from="${cn.edu.cup.dictionary.dataItem.findAllBydataKey(cn.edu.cup.dictionary.dataKey.get(Integer.parseInt(subItem.dataKey.appendParameter)))}"
                                          optionKey="id"
                                          noSelection="${['null': 'Select One...']}"/>
                            </td>
                            <td>
                            </td>
                        </g:if>
                    </tr>
                </g:each>
            </table>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:uploadForm>
</div>
<g:javascript>
    $("input.datePicker").datepicker({
        showButtonPanel: true,
        dateFormat: "yy-mm-dd",
        defaultDate: 0
    });

    $("input.dateTimePicker").datetimepicker({
        format: 'Y-m-d H:i',
        defaultDate: new Date()
    });
</g:javascript>
