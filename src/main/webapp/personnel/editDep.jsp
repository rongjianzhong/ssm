<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/26
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <input type="hidden" id="absolutePath" value="${pageContext.request.contextPath }/"/>
    <%@include file="/common/head.jsp"%>
    <title>Title</title>
</head>
<body>
<form class="layui-form" id="editDep" method="post">
    <input type="hidden" name="uuid" id="uuid">
    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-block" style="width: 300px;" align="center">
            <input type="text" id="name" name="name" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">电话</label>
        <div class="layui-input-block" style="width: 300px;" align="center">
            <input type="text" id="tele" name="tele" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>
</form>
</body>
</html>
