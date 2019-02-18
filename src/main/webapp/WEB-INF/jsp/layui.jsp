<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/common/head.jsp"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<body class="layui-layout-body" >
<div class="layui-layout layui-layout-admin" id="app">
    <div class="layui-header">
        <div class="layui-logo">layui 后台布局</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    <%--贤心--%>
                    <c:if test="${not empty user}">
                        ${user.name}
                    </c:if>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="${ctx}/user/loginout">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <%--<div class="layui-side-scroll">--%>
            <%--<!-- 左侧导航区域（可配合layui已有的垂直导航） -->--%>
            <%--<ul class="layui-nav layui-nav-tree"  lay-filter="test" v-for="(m,j) in module" :key="m.id">--%>
                    <%--<li class="layui-nav-item">--%>
                        <%--<a @click="queryModuleById(m.id,j)">{{m.text}}</a>--%>
                        <%--<dl class="layui-nav-child">--%>
                            <%--<dd v-for="m1 of queryModule[j]" :key="m1.id">--%>
                                <%--<a href="javascript:;" :data-url="m1.url" :class="m1.icon" :data-id="m1.id" :data-title="m1.text" class="site-demo-active" data-type="tabAdd">{{m1.text}}</a>--%>
                            <%--</dd>--%>
                        <%--</dl>--%>
                    <%--</li>--%>
            <%--</ul>--%>
        <%--</div>--%>
            <div class="layui-side-scroll">
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <ul class="layui-nav layui-nav-tree"  lay-filter="test" id="menu"></ul>
            </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="layui-tab" lay-filter="demo" lay-allowclose="true">
            <ul class="layui-tab-title">
                <li class="layui-this">首页</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">首页</div>
            </div>
        </div>
    </div>
    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>

<script>
    layui.use(['element','layer'], function(){
        var $ = layui.jquery,
            element = layui.element,
            layer = layui.layer;//Tab的切换功能，切换事件监听等，需要依赖element模块
        //第一级数据
        var items=basesubmits("${ctx}/Module/queryModule",{pid:-1});
        var html;
        $.each(items,function(index,elem){
            html+=" <li class='layui-nav-item '>\n";
            html+="<a class='' href='javascript:;'>"+elem.text+"</a>\n";
            html+=" <dl class='layui-nav-child' id='"+elem.id+"'>\n";
            var items=basesubmits("${ctx}/Module/queryModule",{pid:elem.id});
            $.each(items,function(index,elem){
                html+=" <dd><a href='javascript:;' data-url="+elem.url+"  data-id="+elem.id+"  data-title="+elem.text+" class='site-demo-active'   data-type='tabAdd' >"+elem.text+"</a></dd>\n";
            });
            //第二级数据
            html+="</dl>\n";
            html+="</li>\n";
        });
        $("#menu").append(html);
        element.render('nav',"test");

        //触发事件
        var active = {
            tabAdd: function(url, id, name,icon){
                //新增一个Tab项
                element.tabAdd('demo', {
                    title: name //用于演示
                    ,content: '<iframe class="'+icon+'" data-frameid="' + id + '" scrolling="auto" frameborder="0" src="' + url + '" lay-allowclose="true" style="width:100%;height:99%;"></iframe>'
                    ,id: id //实际使用一般是规定好的id
                })
            },
            tabDelete: function(id){
                element.tabDelete("demo", id);//根据id删除
            },
            tabChange: function(id){
                //根据id切换到指定Tab项
                element.tabChange('demo', id);
            }
        };
        $(document).on('click', 'a', function () {//绑定所有a标签的事件
            if (!$(this)[0].hasAttribute('data-url') || $(this).attr('data-url') === '') return;
            var dataid = $(this);
            //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
            if ($(".layui-tab-title li[lay-id]").length <= 0) {
                //如果比零小，则直接打开新的tab项
                active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"),dataid.attr("class"));
            } else {
                //否则判断该tab项是否以及存在
                var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                $.each($(".layui-tab-title li[lay-id]"), function () {
                    //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                    if ($(this).attr("lay-id") == dataid.attr("data-id")) {
                        isData = true;
                    }
                })
                if (isData == false) {
                    //标志为false 新增一个tab项
                    active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"),dataid.attr("class"));
                }
            }
            //最后不管是否新增tab，最后都转到要打开的选项页面上
            active.tabChange(dataid.attr("data-id"));
        });
    });
</script>

<script>
    <%--var mv = new Vue({--%>
        <%--el: '#app',--%>
        <%--data: {--%>
            <%--module:[],--%>
            <%--queryModule:new Array(30),--%>
        <%--},--%>
        <%--methods:{--%>
            <%--lst:function(pid){--%>
                <%--//发送post请求--%>
                    <%--this.$http.post('${ctx}/Module/queryModule',{pid:pid},{emulateJSON: true}).then(function(res){--%>
                        <%--this.module = res.body;--%>
                    <%--});--%>
            <%--},--%>
            <%--queryModuleById:function (pid,j) {--%>
                <%--//发送post请求--%>
                <%--this.$http.post('${ctx}/Module/queryModule',{pid:pid},{emulateJSON: true}).then(function(res){--%>
                    <%--this.queryModule.splice(j,1,res.body);--%>
                <%--});--%>
            <%--}--%>
        <%--},--%>
        <%--//在页面渲染完成后调用--%>
        <%--mounted() {--%>
            <%--this.lst(-1);--%>
        <%--}--%>
    <%--})--%>
</script>

</body>
</html>
