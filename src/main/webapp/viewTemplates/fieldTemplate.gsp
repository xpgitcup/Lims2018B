<tr>
    <td>
        ${dataItem.subDataItems[i].dataKey.dataTag}
        <g:hiddenField name="subDataItems[${i}].dataKey.id" value="${dataItem.subDataItems[i].dataKey.id}"/>
        <g:hiddenField name="subDataItems[${i}].upDataItem.id"  value="\${dataItem.id}"></g:hiddenField>
    </td>
    <td>
        <input type="text" name="$label" id="" value="$value" class="datePicker"/>
    </td>
</tr>