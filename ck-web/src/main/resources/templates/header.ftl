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
        $(".header ul li a[href='${ctx}" + window.location.pathname + "']").parents("li").addClass("active");
    })
</script>