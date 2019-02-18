<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <input type="hidden" id="absolutePath" value="${pageContext.request.contextPath }/"/>
    <%@include file="/common/head.jsp"%>
    <title>Title</title>
</head>
<body>
<form class="layui-form" id="addEmpa">
    <input type="hidden" id="uuid" name="uuid">
    <div class="layui-form-item">
        <label class="layui-form-label">登录名</label>
        <div class="layui-input-block" style="width: 300px;" align="center">
            <input type="text" id="username" name="username" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block" style="width: 300px;margin-top: 10px">
            <input type="pwd" name="pwd" id="pwd" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">真实姓名</label>
        <div class="layui-input-block" style="width: 300px;margin-top: 10px" align="center">
            <input type="text" id="name" name="name" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block" style="width: 300px;" >
            <input type="radio" name="gender" value="男" title="男" checked="">
            <input type="radio" name="gender" value="女" title="女">
        </div>
    </div>
    <label class="layui-form-label">Email</label>
    <div class="layui-input-block" style="width: 300px;margin-top: 10px" align="center">
        <input type="text" id="email" name="email" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
    <label class="layui-form-label">电话</label>
    <div class="layui-input-block" style="width: 300px;margin-top: 10px" align="center">
        <input type="text" id="tele" name="tele" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
    <label class="layui-form-label">地址</label>
    <div class="layui-input-block" style="width: 300px;margin-top: 10px" align="center">
        <input type="text" id="address" name="address" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
    <%--<label class="layui-form-label">出生年月日</label>--%>
    <%--<div class="layui-input-block" style="width: 300px;margin-top: 10px" align="center">--%>
        <%--<input type="text" name="birthday" id="birthday" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">--%>
    <%--</div>--%>
    <div class="layui-form-item" id="app">
        <label class="layui-form-label">部门</label>
        <div class="layui-input-block" style="width: 300px;margin-top: 10px">
            <select id="depuuid" name="depuuid">
                <option value="">请选择部门</option>
                <option v-for="i of module" :key="i.uuid" :value="i.name">{{i.name}}</option>
            </select>
        </div>
    </div>
</form>
</body>
<script>
    var mv = new Vue({
        el: '#app',
        data: {
            module:[],
        },
        methods:{
            lst:function(lx){
                //发送post请求
                this.$http.post('${ctx}/dep/queryDep',{lx:lx},{emulateJSON: true}).then(function(res){
                    this.module = res.body.data;
                });
            }
        },
        //在页面渲染完成后调用
        mounted() {
            this.lst("部门");
        },
    })
</script>
<script src="${ctx}/js/personnel/yggl.js"></script>
</html>
