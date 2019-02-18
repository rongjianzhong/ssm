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
    <script src="${ctx}/js/basicInfo/js/splx.js"></script>
</head>
<body scoll=no>
    <%--搜索框--%>
    <div class="layui-input-inline" style="width: 150px">
        <input type="text" id="name" class="layui-input searchVal" placeholder="请输入商品名称" />
    </div>
    <a class="layui-btn layui-icon " id="search_btn" data-type="reload">&nbsp;搜索</a>
    <table class="layui-hide" id="test" lay-filter="test"></table>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <a class="layui-btn layui-btn-sm" lay-event="add">增加</a>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
</body>
</html>
