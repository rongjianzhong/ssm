
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <input type="hidden" id="absolutePath" value="${pageContext.request.contextPath }/"/>
    <%@include file="/common/head.jsp"%>
    <title>采购申请</title>
    <script src="${ctx}/js/purchasing/order.js"></script>
</head>
<body>
<table class="layui-hide" id="order" lay-filter="order"></table>

<script type="text/html" id="toolbarDemo">

    <div class="layui-btn-container">
        <a class="layui-btn layui-btn-sm" lay-event="addorder">采购申请</a>
    </div>

</script>

</body>
</html>
