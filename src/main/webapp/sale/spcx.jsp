<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <input type="hidden" id="absolutePath" value="${pageContext.request.contextPath }/"/>
    <%@include file="/common/head.jsp"%>
    <title>Title</title>
</head>
<body>
    <table class="layui-hide" id="spcx" lay-filter="spcx"></table>
    <div style="padding: 15px"  id="addBook">
        <input type="hidden" id="item">
            <button class="layui-btn" id="submit" style="margin-left:550px">增加</button>
    </div>
</body>
<script src="${ctx}/js/sale/addorders.js"></script>
</html>
