<#-- TODO: License -->

<@section title="${uiLabelMap.ProductCopyProductCategoryMembersToAnotherCategory}">
    <form method="post" action="<@ofbizUrl>copyCategoryProductMembers</@ofbizUrl>" name="copyCategoryProductMembersForm">
        <input type="hidden" name="productCategoryId" value="${productCategoryId!}" />
        <input type="hidden" name="activeOnly" value="${activeOnly.toString()}" />
        <@row>
            <@cell columns=4>
        <@field type="generic" label="${uiLabelMap.ProductTargetProductCategory}">
            <@htmlTemplate.lookupField formName="copyCategoryProductMembersForm" name="productCategoryIdTo" id="productCategoryIdTo" fieldFormName="LookupProductCategory"/>
        </@field>
            </@cell>
            <@cell columns=4>
        <@field type="generic" label="${uiLabelMap.ProductOptionalFilterWithDate}">
            <@htmlTemplate.renderDateTimeField name="validDate" event="" action="" className=""  title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="" size="25" maxlength="30" id="validDate1" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
        </@field>
            </@cell>
            <@cell columns=4>
        <@field type="generic" label="${uiLabelMap.ProductIncludeSubCategories}">
            <select name="recurse">
                <option value="N">${uiLabelMap.CommonN}</option>
                <option value="Y">${uiLabelMap.CommonY}</option>
            </select>
        </@field>
            </@cell>
        </@row>
        <@field type="submitarea">
            <input type="submit" value="${uiLabelMap.CommonCopy}" />
        </@field>
    </form>
</@section>