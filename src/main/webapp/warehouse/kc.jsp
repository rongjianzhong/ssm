<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <input type="hidden" id="absolutePath" value="${pageContext.request.contextPath }/"/>
    <%@include file="/common/head.jsp"%>
    <title>库存查询</title>
    <script src="${ctx}/js/warehouse/kc.js"></script>
</head>
<body>
<%--搜索框--%>
<label>仓库</label>
<div class="layui-input-inline" style="width: 150px">
    <input type="text" id="storeuuid" class="layui-input searchVal" placeholder="名称" />
</div>
<label>商品</label>
<div class="layui-input-inline" style="width: 150px">
    <input type="text" id="goodsuuid" class="layui-input searchVal" placeholder="名称" />
</div>
<a class="layui-btn layui-icon " id="search_btn" data-type="reload">&nbsp;搜索</a>
<table class="layui-hide" id="test" lay-filter="test"></table>
</body>
</html>