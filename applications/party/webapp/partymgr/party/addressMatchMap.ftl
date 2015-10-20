<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->

<#assign menuHtml>
  <@menu type="section" inlineItems=true>
    <@menuitem type="link" href=makeOfbizUrl("findAddressMatch") text="${uiLabelMap.PageTitleFindMatches}" />
  </@menu>
</#assign>
<@section id="address-match-map" title="${uiLabelMap.PageTitleCreateAddressMatchMap}" menuHtml=menuHtml>
  <@section id="addressmatchmap_create">
  <form name="addaddrmap" method="post" action="<@ofbizUrl>createAddressMatchMap</@ofbizUrl>">
    <@field type="input" name="mapKey" label="${uiLabelMap.PartyAddressMatchKey}" />
    <@field type="input" name="mapValue" label="${uiLabelMap.PartyAddressMatchValue}" />
    <@field type="input" name="sequenceNum" label="${uiLabelMap.CommonSequence}" value="0" size=5/>
    <@field type="submitarea">
      <a href="javascript:document.addaddrmap.submit()" class="${styles.button_default!}">${uiLabelMap.CommonCreate}</a>
    </@field>
  </form>
  </@section>
  
  <@section id="addressmatchmap_import">
  <form name="importaddrmap" method="post" enctype="multipart/form-data" action="<@ofbizUrl>importAddressMatchMapCsv</@ofbizUrl>">
    <@field type="file" name="uploadedFile" label="CSV ${uiLabelMap.CommonDocument}" size=14 />
    
    <#assign successUrl><@ofbizUrl>addressMatchMap</@ofbizUrl></#assign>
    <#assign progressOptions = {
        "formSel" : "form[name=importaddrmap]",
        "progBarId" : "importaddrmap_progress_bar",
        "progTextBoxId" : "importaddrmap_prog_textbox",
        
        "msgContainerParentSel" : "#addressmatchmap_import_content",
        "msgContainerInsertMode" : "prepend",
        
        "expectedResultContainerSel" : "#main-content",
        "errorResultContainerSel" : "#main-${styles.alert_wrap!}",
        "errorResultAddWrapper" : false,

        "successRedirectUrl" : "${successUrl}"
    }>
    <@field type="submitarea" progressOptions=progressOptions>
      <input type="submit" value="${uiLabelMap.CommonUpload} CSV"/>    
    </@field>
  </form>
  </@section>
</@section>
<@section title="${uiLabelMap.PageTitleAddressMatches}">
      <#if addressMatchMaps?has_content>
        <@table type="data-list" autoAltRows=true class="+hover-bar" cellspacing="0"> <#-- orig: class="basic-table hover-bar" -->
          <@thead>
          <@tr class="header-row">
            <@th>${uiLabelMap.PartyAddressMatchKey}</@th>
            <@th>=></@th>
            <@th>${uiLabelMap.PartyAddressMatchValue}</@th>
            <@th>${uiLabelMap.CommonSequence}</@th>
            <@th class="button-col"><a href="<@ofbizUrl>clearAddressMatchMap</@ofbizUrl>">${uiLabelMap.CommonClear} ${uiLabelMap.CommonAll}</a></@th>
          </@tr>
          </@thead>
          <@tbody>
          <#list addressMatchMaps as map>
            <@tr>
              <@td>${map.mapKey}</@td>
              <@td>=></@td>
              <@td>${map.mapValue}</@td>
              <@td>${map.sequenceNum!}</@td>
              <@td class="button-col"><a href="<@ofbizUrl>removeAddressMatchMap?mapKey=${map.mapKey}&amp;mapValue=${map.mapValue}</@ofbizUrl>" class="${styles.button_default!}">${uiLabelMap.CommonDelete}</a></@td>
            </@tr>
          </#list>
          </@tbody>
        </@table>
      </#if>
</@section>
