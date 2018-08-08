<#assign title="${result!'上传完成'}"/>

<@override name="breadcrumbs">
    <@c.breadcrumb name="首页" link="/"/>
    <@c.breadcrumb name="大神视频" link="video"/>
    <@c.breadcrumb name="${title}"/>
</@override>

<@override name="main">
<h3 style="text-align: center">
${result!'上传完成'}
</h3>

<div style="text-align: center">
    <a class="btn" href="${ctx}/video">返回</a>
</div>
</@override>

<@extends name="../layout.ftl"/>