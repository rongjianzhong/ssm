
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <input type="hidden" id="absolutePath" value="${pageContext.request.contextPath }/"/>
    <%@include file="/common/head.jsp"%>
    <title>部门管理</title>
    <script src="${ctx}/js/purchasing/queryorder2.js"></script>
</head>
<body>

<table class="layui-hide" id="queryorder2" lay-filter="queryorder2"></table>

</body>


</html>
