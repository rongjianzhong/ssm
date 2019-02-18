<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <input type="hidden" id="absolutePath" value="${pageContext.request.contextPath }/"/>
    <%@include file="/common/head.jsp"%>
    <title>角色权限管理</title>
    <script src="${ctx}/js/sys/role.js"></script>
    <script type="text/javascript" src="${ctx}/js/zTree/jquery.ztree.all.min.js"></script>
</head>
<body>
<table class="layui-hide" id="test" lay-filter="test"></table>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <a class="layui-btn layui-btn-sm" lay-event="add">增加</a>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="accredit">授权</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
</body>
</html>