<#assign ctx="${(rca.contextPath)!''}">

<#--面包屑-->
<#macro breadcrumb name="" link="">
<a href="<#if link!=''>${ctx}/${link}<#else>javascript:</#if>">
${name}
</a>
</#macro>

<#--选项卡-->
<#macro tabs>
<div class="tabs">
    <#nested />
</div>

<script>
    $(function () {
        $(".tab-nav li a").click(function () {
            changeTab(this);
        });

        function changeTab(tab) {
            console.log(tab)
            $(".tab-nav li").removeClass("active");
            if (tab) {
                $(tab).parents("li").addClass("active");
            }

            $(".tab-content").addClass("hidden");
            if (tab) {
                $("#" + $(tab).data("tab")).removeClass("hidden");
            }
        }

        changeTab($(".tab-nav li.active a"));
    })
</script>
</#macro>

<#--选项卡-导航条-->
<#macro tab_navs>
<ul class="tab-nav">
    <#nested />
</ul>
</#macro>

<#--选项卡-导航-->
<#macro tab_nav name tab active=false>
<li class="${active?string('active', '')}"><a href="javascript:" data-tab="${tab}">${name}</a></li>
</#macro>

<#--选项卡-面板-->
<#macro tab_panel>
<div class="tab-panel">
    <#nested />
</div>
</#macro>

<#--选项卡-内容-->
<#macro tab_content id>
<div class="tab-content" id="${id}">
    <#nested />
</div>
</#macro>