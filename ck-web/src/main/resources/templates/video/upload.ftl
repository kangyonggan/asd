<#assign title="我要上传"/>

<@override name="breadcrumbs">
    <@c.breadcrumb name="首页" link="/"/>
    <@c.breadcrumb name="大神视频" link="video"/>
    <@c.breadcrumb name="${title}"/>
</@override>

<@override name="main">
<form class="form" action="${ctx}/video/upload" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label class="required">视频文件</label>
        <input type="file" name="file" required/>
    </div>
    <div class="form-group">
        <label class="required">视频封面</label>
        <input type="file" name="coverFile" required/>
    </div>
    <div class="form-group">
        <label class="required">视频标题</label>
        <input name="title" placeholder="请用一句话描述视频" required/>
    </div>
    <div class="form-group">
        <label>赛道</label>
        <select name="map">
            <option value=""></option>
            <option value="藏宝海湾">藏宝海湾</option>
            <option value="恐龙乐园">恐龙乐园</option>
            <option value="月亮城堡">月亮城堡</option>
            <option value="酋长部落">酋长部落</option>
            <option value="黄昏小镇">黄昏小镇</option>
            <option value="城堡的冬天">城堡的冬天</option>
            <option value="小赛车场">小赛车场</option>
            <option value="钟楼魅影">钟楼魅影</option>
            <option value="风车农场">风车农场</option>
            <option value="绿色山谷">绿色山谷</option>
            <option value="Xtorm乐园">Xtorm乐园</option>
            <option value="长城">长城</option>
            <option value="火山">火山</option>
            <option value="宇宙大帝">宇宙大帝</option>
            <option value="ZIC">ZIC</option>
        </select>
    </div>
    <div class="form-group">
        <label>上传者</label>
        <input name="author" placeholder="请输入上传者昵称"/>
    </div>

    <p style="color: red; font-size: 12px">
        由于时间有限，视频的审核功能还没有做，暂定全部算审核通过，请文明上传。<br/>
        另外，表单的前端校验也还没做，最大上传10MB<br/>
        赛道我只写了一部分，哪位可以给我提供全部赛道，谢谢！
    </p>

    <div>
        <button class="btn">提交</button>
    </div>
</form>
</@override>

<@extends name="../layout.ftl"/>