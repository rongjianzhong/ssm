<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <input type="hidden" id="absolutePath" value="${pageContext.request.contextPath }/"/>
    <%@include file="/common/head.jsp"%>
    <title>Title</title>
</head>
<body>
<form class="layui-form" id="addsupplier" method="post">
    <input type="hidden" id="uuid" name="uuid">
    <div class="layui-form-item" style="width: 300px;height:300px;margin-top: 25px ">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-block" style="width: 300px;margin-top: 10px" align="center">
            <input type="text" name="name" id="name" lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">地址</label>
        <div class="layui-input-block" style="width: 300px;margin-top: 10px" align="center">
            <input type="text" name="address" id="address"  lay-verify="required" placeholder="请输入地址" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">联系人</label>
        <div class="layui-input-block" style="width: 300px;margin-top: 10px" align="center">
            <input type="text" name="contact" id="contact" lay-verify="required" placeholder="请输入联系人" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">电话</label>
        <div class="layui-input-block" style="width: 300px;margin-top: 10px" align="center">
            <input type="text" name="tele" id="tele" lay-verify="required" placeholder="请输入电话" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">EMAIL</label>
        <div class="layui-input-block" style="width: 300px;margin-top: 10px" align="center">
            <input type="text" name="email" id="email" lay-verify="required" placeholder="请输入email" autocomplete="off" class="layui-input">
        </div>

    </div>
 </form>
</body>
<script src="${ctx}/js/basicInfo/js/supplier.js"></script>
</html>
