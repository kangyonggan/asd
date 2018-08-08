<#assign title="大神视频"/>

<@override name="breadcrumbs">
    <@c.breadcrumb name="首页" link="/"/>
    <@c.breadcrumb name="${title}"/>
</@override>

<@override name="main">
<div class="videos">
    <#if page?? && page.size gt 0>
        <#list page.list as video>
            <dl>
                <dd>
                    <a href="${ctx}/video/${video.id}">
                        <img src="${ctx}/${video.cover}"/>
                    </a>
                </dd>
                <dt>
                    <div>${video.title}（${video.hits}）</div>
                    <div>${video.map!'未知赛道'} | ${video.author!'未知上传者'}</div>
                </dt>
            </dl>
        </#list>

        <#if page.pages gt 1>
            <ul class="pagination">
                <#if page.hasPreviousPage>
                    <li class="show"><a href="${ctx}/video?pageNum=${page.prePage}">&lt;</a></li>
                </#if>
                <#list page.navigatepageNums as nav>
                    <li class="<#if nav==page.pageNum>active</#if>">
                        <a href="${ctx}/video?pageNum=${nav}">${nav}</a>
                    </li>
                </#list>

                <#if page.hasNextPage>
                    <li class="show"><a href="${ctx}/video?pageNum=${page.nextPage}">&gt;</a></li>
                </#if>
            </ul>
        </#if>
    <#else>
        <div class="clear" style="text-align: center">
            <h3 style="text-align: center">暂时没有大神视频，你可以点击下面的按钮亲自上传~</h3>
        </div>
    </#if>
    <div class="clear" style="text-align: center;margin-top: 20px;">
        <a href="${ctx}/video/upload" class="btn">我要上传</a>
    </div>
</div>

</@override>

<@extends name="../layout.ftl"/>