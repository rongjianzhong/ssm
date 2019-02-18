
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <input type="hidden" id="absolutePath" value="${pageContext.request.contextPath }/"/>
    <%@include file="/common/head.jsp"%>
    <title>Title</title>
</head>
<body>
<form class="layui-form" id="addDep" >
    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-block" style="width: 300px;" align="center">
            <input type="text" name="name" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">电话</label>
        <div class="layui-input-block" style="width: 300px;" align="center">
            <input type="text" name="tele" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <%--<button class="layui-btn" lay-submit="" lay-filter="demo1" id="btn_addGoodStype">立即提交</button>--%>
            <a class="layui-btn" id="btn_Dep">添加</a>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
</body>
<script src="${ctx}/js/personnel/bmgl.js"></script>
</html>
