<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/22 0022
  Time: 21:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <input type="hidden" id="absolutePath" value="${pageContext.request.contextPath }/"/>
    <%@include file="/common/head.jsp"%>
    <title>商品类型</title>
    <script src="${ctx}/js/basicInfo/js/sp.js"></script>
</head>
<body>
<div id="app">
    <%--搜索框--%>
    <label>名称</label>
    <div class="layui-input-inline" style="width: 150px">
        <input type="text" id="name" class="layui-input searchVal" placeholder="请输入商品名称" />
    </div>
    <label>产地</label>
    <div class="layui-input-inline" style="width: 150px">
        <input type="text" id="origin" class="layui-input searchVal" placeholder="请输入产地名称" />
    </div>

    <label>厂家</label>
    <div class="layui-input-inline" style="width: 300px;">
        <form class="layui-form">
            <select id="producer" name="producer">
                <option value="">请选择厂家</option>
                <option v-for="i1 of chang" :key="i1.uuid" :value="i1.name">{{i1.name}}</option>
            </select>
        </form>
    </div>
    <label>商品类型</label>
        <div class="layui-input-inline" style="width: 300px;" >
            <form class="layui-form">
                <select id="goodstypeuuid" name="goodstypeuuid">
                    <option value="">请选择商品类型</option>
                    <option v-for="i of module" :key="i.uuid" :value="i.name">{{i.name}}</option>
                </select>
            </form>
        </div>
    <a class="layui-btn layui-icon " id="searchgoods_btn" data-type="reload">&nbsp;搜索</a>
</div>
<table class="layui-hide" id="goods" lay-filter="goods"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <a class="layui-btn layui-btn-sm" lay-event="addgoods">增加</a>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="editgoods">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delgoods">删除</a>
</script>

    <script>
        var mv = new Vue({
            el: '#app',
            data: {
                module:[],
                chang:[]
            },
            methods:{
                lst:function(lx){
                    //发送post请求
                    this.$http.post('${ctx}/goodStype/queryGoodStype',{lx:lx},{emulateJSON: true}).then(function(res){
                        this.module = res.body.data;
                    });
                },
                changs:function(type,lx){
                    //发送post请求
                    this.$http.post('${ctx}/supplier/querySupplier',{lx:lx,type:type},{emulateJSON: true}).then(function(res){
                        this.chang = res.body.data;
                    });
                }
            },
            //在页面渲染完成后调用
            mounted() {
                this.lst("类型");
                this.changs("供应商","供应商");
            },
        })
    </script>
</body>
</html>
