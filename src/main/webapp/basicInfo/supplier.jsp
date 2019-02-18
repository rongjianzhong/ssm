
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <input type="hidden" id="absolutePath" value="${pageContext.request.contextPath }/"/>
    <%@include file="/common/head.jsp"%>
    <title>供应商</title>
    <script src="${ctx}/js/basicInfo/js/supplier.js"></script>
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
<label>联系人</label>
<div class="layui-input-inline" style="width: 150px">
    <input type="text" id="contact" class="layui-input searchVal" placeholder="请输入联系人" />
</div>
<label>电话</label>
<div class="layui-input-inline" style="width: 150px">
    <input type="tel" name="tele" lay-verify="required|tele" autocomplete="off" class="layui-input">
</div>
<label>EMAIL</label>
<div class="layui-input-inline" style="width: 150px">
    <input type="text" name="email" lay-verify="email" autocomplete="off" class="layui-input">
</div>

<a class="layui-btn layui-icon " id="searchsupplier_btn" data-type="reload">&nbsp;搜索</a>

<table class="layui-hide" id="supplier" lay-filter="supplier"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <a class="layui-btn layui-btn-sm" lay-event="addsupplier">增加</a>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="editsupplier">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delsupplier">删除</a>
</script>

</body>
</html>
