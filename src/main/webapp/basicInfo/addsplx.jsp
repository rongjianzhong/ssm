<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <input type="hidden" id="absolutePath" value="${pageContext.request.contextPath }/"/>
    <%@include file="/common/head.jsp"%>
    <title>Title</title>
</head>
<body>
<form class="layui-form" id="addGoodStype" method="post">
    <input type="hidden" id="uuid" name="uuid">
    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-block" style="width: 300px;" align="center">
            <input type="text" id="name" name="name" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
 </form>
</body>
<script src="${ctx}/js/basicInfo/js/splx.js"></script>
</html>
