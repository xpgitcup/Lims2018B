<div id="create-dataItem" class="content scaffold-create" role="main">
  <g:uploadForm controller="operation4Data" action="saveDataItem">
    <fieldset class="form">
      <table>
        <f:with bean="dataItem">
          <tr>
            <td>
              <label>测试性数据字典6/(21).数据标签6.0/(数据项)</label>
            </td>
            <td>
              <g:hiddenField name="dataKey.id" value="36" />
            </td>
          </tr>
        </f:with>
      </table>
      <table />
    </fieldset>
    <fieldset class="buttons">
      <g:submitButton name="create" class="save" value="Create" />
    </fieldset>
  </g:uploadForm>
</div>
