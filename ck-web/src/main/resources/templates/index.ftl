<#assign title="首页"/>

<@override name="main">
    <@c.tabs>
        <@c.tab_navs>
            <@c.tab_nav name="车队简介" tab="team-info" active=true/>
            <@c.tab_nav name="车队背景" tab="team-bg"/>
            <@c.tab_nav name="车队成员" tab="team-user"/>
        </@c.tab_navs>
    </@c.tabs>

    <@c.tab_panel>
        <@c.tab_content id="team-info">
        车队简介
        </@c.tab_content>
        <@c.tab_content id="team-bg">
        车队背景
        </@c.tab_content>
        <@c.tab_content id="team-user">
        车队成员
        </@c.tab_content>
    </@c.tab_panel>
</@override>

<@extends name="layout.ftl"/>