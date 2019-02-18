<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户角色绑定下拉框</title>
    <input type="hidden" id="absolutePath" value="${pageContext.request.contextPath }/"/>
    <%@include file="/common/head.jsp"%>
</head>
<body>
    <form class="layui-form" method="post" id="userRole">
        <input type="hidden" id="userid" name="userid">
        <div class="layui-form-item" id="app">
            <label class="layui-form-label">角色</label>
            <div class="layui-input-block" style="width: 300px;margin-top: 10px">
                <select id="roleid" name="roleid">
                    <option value="">请选择用户角色</option>
                    <option v-for="i of module" :key="i.roleid" :value="i.roleid">{{i.rolename}}</option>
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
                this.$http.post('${ctx}/sysRole/querySysRole',{lx:lx},{emulateJSON: true}).then(function(res){
                    this.module = res.body.data;
                });
            }
        },
        //在页面渲染完成后调用
        mounted() {
            this.lst("用户角色");
        },
    })
</script>
<script src="${ctx}/js/sys/userRole.js"></script>
</html>
