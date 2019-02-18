<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <input type="hidden" id="absolutePath" value="${pageContext.request.contextPath }/"/>
    <%@include file="/common/head.jsp"%>
    <title>Title</title>
</head>
<body>
<form class="layui-form" id="addGoods" method="post">
    <input type="hidden" id="uuid" name="uuid">
<div id="app">
    <div class="layui-form-item" style="width: 300px;height:300px;margin-top: 25px ">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-block" style="width: 300px;margin-top: 10px" align="center">
            <input type="text" name="name" id="name" lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">产地</label>
        <div class="layui-input-block" style="width: 300px;margin-top: 10px" align="center">
            <input type="text" name="origin" id="origin"  lay-verify="required" placeholder="请输入产地" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">厂家</label>
            <div class="layui-input-block" style="width: 300px;margin-top: 10px">
                <select id="producer" name="producer">
                    <option value="">请选择厂家</option>
                    <option v-for="i1 of chang" :key="i1.uuid" :value="i1.name">{{i1.name}}</option>
                </select>
            </div>
        </div>
        <label class="layui-form-label">计量单位</label>
        <div class="layui-input-block" style="width: 300px;margin-top: 10px" align="center">
            <input type="text" name="unit" id="unit" lay-verify="required" placeholder="请输入计量单位" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">进货价格</label>
        <div class="layui-input-block" style="width: 300px;margin-top: 10px" align="center">
            <input type="text" name="inprice" id="inprice" lay-verify="required" placeholder="请输入进货价格" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">销售价格</label>
        <div class="layui-input-block" style="width: 300px;margin-top: 10px" align="center">
            <input type="text" name="outprice" id="outprice"  lay-verify="required" placeholder="请输入销售价格" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品类型</label>
            <div class="layui-input-block" style="width: 300px;margin-top: 10px">
                <select name="goodstypeuuid" id="goodstypeuuid" lay-filter="aihao" style="width: 150px">
                    <option value="">请选择商品类型</option>
                    <option v-for="i of module" :key="i.uuid" :value="i.name">{{i.name}}</option>
                </select>
            </div>
        </div>
    </div>
</div>
</form>
<script>
    var mv = new Vue({
        el: '#app',
        data: {
            module:[],
            chang:[]
        },
        methods:{
            lst:function(lx){
                //发送post请求
                this.$http.post('${ctx}/goodStype/queryGoodStype',{lx:lx},{emulateJSON: true}).then(function(res){
                    this.module = res.body.data;
                });
            },
            changs:function(type,lx){
                //发送post请求
                this.$http.post('${ctx}/supplier/querySupplier',{lx:lx,type:type},{emulateJSON: true}).then(function(res){
                    this.chang = res.body.data;
                });
            }
        },
        //在页面渲染完成后调用
        mounted() {
            this.lst("类型");
            this.changs("供应商","供应商");
        },
    })
</script>
</body>
<script src="${ctx}/js/basicInfo/js/sp.js"></script>
</html>
