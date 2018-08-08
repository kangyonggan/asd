<div class="header">
    <div class="container">
        <a href="${ctx}/">
            <img src="${ctx}/app/images/logo.jpeg"/>
        </a>

        <ul>
            <li><a href="${ctx}/">东方娇子</a></li>
            <li><a href="${ctx}/news">新闻公告</a></li>
            <li><a href="${ctx}/cheats">攻略秘籍</a></li>
            <li><a href="${ctx}/car">赛车大全</a></li>
            <li><a href="${ctx}/newbie">新手教学</a></li>
            <li><a href="${ctx}/bbs">玩家论坛</a></li>
            <li><a href="${ctx}/video">大神视频</a></li>
            <li><a href="${ctx}/join">加入车队</a></li>
        </ul>
    </div>
</div>

<script>
    $(function () {
        $(".header ul li").removeClass("active");
        var href = window.location.pathname.substring(ctx.length + 1);
        var index = href.indexOf("/");
        if (index >= 0) {
            href = href.substring(0, index);
        }
        $(".header ul li a[href='" + ctx + "/" + href + "']").parents("li").addClass("active");
    })
</script>