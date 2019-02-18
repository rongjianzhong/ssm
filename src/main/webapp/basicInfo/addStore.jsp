<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <input type="hidden" id="absolutePath" value="${pageContext.request.contextPath }/"/>
    <%@include file="/common/head.jsp"%>
    <title>Title</title>
</head>
<body>
<form class="layui-form" id="addstore" method="post">
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
        <div class="layui-form-item" id="app">
            <label class="layui-form-label">库管员</label>
            <div class="layui-input-block" style="width: 300px;margin-top: 10px">
                <select name="empuuid" id="empuuid" lay-filter="aihao" style="width: 150px">
                    <option value="">请选择库管员</option>
                    <option v-for="i of module" :key="i.uuid" :value="i.name">{{i.name}}</option>
                </select>
            </div>
        </div>

    </div>
 </form>
</body>
<script>
    var mv = new Vue({
        el: '#app',
        data: {
            module:[]
        },
        methods:{
            lst:function(lx){
                //发送post请求
                this.$http.post('${ctx}/emp/queryEmp',{depuuid:lx},{emulateJSON: true}).then(function(res){
                    this.module = res.body.data;
                });
            }
        },
        //在页面渲染完成后调用
        mounted() {
            this.lst("仓库部");
        }
    })
</script>
<script src="${ctx}/js/basicInfo/js/store.js"></script>
</html>
