<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <input type="hidden" id="absolutePath" value="${pageContext.request.contextPath }/"/>
    <%@include file="/common/head.jsp"%>
    <title>商品类型</title>
    <script src="${ctx}/js/sys/userRole.js"></script>
</head>
<body>
<%--搜索框--%>
<label>登录名</label>
<div class="layui-input-inline" style="width: 150px">
    <input type="text" id="username" class="layui-input searchVal" placeholder="请输入登录名" />
</div>&nbsp;&nbsp;
<label>部门</label>
<div class="layui-input-inline" style="width: 200px;" id="app">
    <form class="layui-form">
        <select id="depuuid" name="depuuid" style="height: 40px">
            <option value="">请选择部门</option>
            <option v-for="i of module" :key="i.uuid" :value="i.depuuid">{{i.depuuid}}</option>
        </select>
    </form>
</div>
<a class="layui-btn layui-icon " id="search_btn" data-type="reload">&nbsp;搜索</a>
<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="barDemo">
    <%--<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="udpate">重置密码</a>--%>
    <a class="layui-btn layui-btn-xs" lay-event="edit">设置角色</a>
</script>
<script>
    var mv = new Vue({
        el: '#app',
        data: {
            module:[],
            chang:[]
        },
        methods:{
            lst:function(){
                //发送post请求
                this.$http.post('${ctx}/emp/querydep',{emulateJSON: true}).then(function(res){
                    this.module = res.body.data;
                });
            }
        },
        //在页面渲染完成后调用
        mounted() {
            this.lst();
        },
    })
</script>
</body>
</html>
