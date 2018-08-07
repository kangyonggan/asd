<#assign ctx="${(rca.contextPath)!''}">

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>${title!'我是谁'} · 东方娇子</title>
    <link rel="shortcut icon" href="${ctx}/static/app/images/favicon.ico" type="image/x-icon">
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <link rel="stylesheet" href="${ctx}/app/css/app.css"/>
<@block name="style"/>
</head>

<body>

<div class="app">
<#include "header.ftl"/>
<#include "banner.ftl"/>
<#if noBreadcrumbs??>
    <div class="breadcrumbs container">
        您当前的位置是：
        <@block name="breadcrumbs"/>
    </div>
</#if>

    <div class="container main">
    <@block name="main"/>
    </div>

    <div class="push"></div>
</div>

<#include "footer.ftl"/>

<script>var ctx = '${ctx}';</script>
<script src="${ctx}/app/js/app.js"></script>
<@block name="script"/>
</body>
</html>
