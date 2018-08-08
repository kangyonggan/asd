<#assign title="${video.title}"/>

<@override name="breadcrumbs">
    <@c.breadcrumb name="首页" link="/"/>
    <@c.breadcrumb name="大神视频" link="video"/>
    <@c.breadcrumb name="${title}"/>
</@override>

<@override name="main">
<video width="1200" height="600" controls autoplay>
    <source src="${ctx}/${video.src}" type="video/ogg">
    <source src="${ctx}/${video.src}" type="video/mp4">
    <source src="${ctx}/${video.src}" type="video/webm">
    <object data="${ctx}/${video.src}" width="1200" height="600">
        <embed width="1200" height="600" src="${ctx}/${video.src}">
    </object>
</video>
</@override>

<@extends name="../layout.ftl"/>