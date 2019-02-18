<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <input type="hidden" id="absolutePath" value="${pageContext.request.contextPath }/"/>
    <%@include file="/common/head.jsp"%>
    <script src="${ctx}/js/sale/addorders.js"></script>
</head>
<body>

<form class="layui-form" id="addEmp" method="post">
    <label class="layui-form-label">客户</label>
    <div class="layui-input-block" style="width: 300px;" align="center" id="app">
        <select id="type" name="type" lay-filter="aihao">
            <option value="">请选择客户</option>
            <option v-for="i of module" :key="i.uuid" :value="i.contact">{{i.contact}}</option>
        </select>
    </div>
</form>
<table class="layui-hide" id="addorders" lay-filter="test"></table>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <a class="layui-btn layui-btn-sm" lay-event="adda">购买</a>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<table class="layui-hide" id="table" lay-filter="table"></table>
<input type="button"  id="tijiao" class="layui-btn" style="margin-left:780px" value="提交">
</body>
<script>
    var mv = new Vue({
        el: '#app',
        data: {
            module:[],
        },
        methods:{
            lst:function(){
                //发送post请求
                this.$http.post('${ctx}/supplier/selectByname',{emulateJSON: true}).then(function(res){
                    console.log(res.body)
                    this.module = res.body;
                });
            }
        },
        //在页面渲染完成后调用
        mounted() {
            this.lst();
        },
    })
</script>
</html>
