<#assign ctx="${(rca.contextPath)!''}">

<#--面包屑-->
<#macro breadcrumb name="" link="">
<a href="<#if link!=''>${ctx}/${link}<#else>javascript:</#if>">
${name}
</a>
</#macro>