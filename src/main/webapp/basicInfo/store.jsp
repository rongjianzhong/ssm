
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <input type="hidden" id="absolutePath" value="${pageContext.request.contextPath }/"/>
    <%@include file="/common/head.jsp"%>
    <title>仓库管理</title>
    <script src="${ctx}/js/basicInfo/js/store.js"></script>
</head>
<body>
    <%--搜索框--%>
    <label>名称</label>
    <div class="layui-input-inline" style="width: 150px">
        <input type="text" id="name" class="layui-input searchVal" placeholder="请输入名称" />
    </div>
    <label>地址</label>
    <div class="layui-input-inline" style="width: 150px">
        <input type="text" id="address" class="layui-input searchVal" placeholder="请输入地址" />
    </div>
    <label>库管员</label>
    <div class="layui-input-inline" style="width: 300px;" id="app">
        <form class="layui-form">
            <select id="empuuid" name="empuuid" style="height: 40px">
                <option value="">请选择库管员</option>
                <option v-for="i of module" :key="i.uuid" :value="i.name">{{i.name}}</option>
            </select>
        </form>
    </div>

    <a class="layui-btn layui-icon " id="searchstore_btn" data-type="reload">&nbsp;搜索</a>

<table class="layui-hide" id="store" lay-filter="store"></table>


<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <a class="layui-btn layui-btn-sm" lay-event="addstore">增加</a>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="editstore">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delstore">删除</a>
</script>
<script>
    var mv = new Vue({
        el: '#app',
        data: {
            module:[]
        },
        methods:{
            lst:function(lx){
                //发送post请求
                this.$http.post('${ctx}/emp/queryEmp',{depuuid:lx},{emulateJSON: true}).then(function(res){
                    this.module = res.body.data;
                });
            }
        },
        //在页面渲染完成后调用
        mounted() {
            this.lst("仓库部");
        }
    })
</script>
</body>
</html>
