
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <input type="hidden" id="absolutePath" value="${pageContext.request.contextPath }/"/>
    <%@include file="/common/head.jsp"%>
    <title>订单详情</title>
    <script src="${ctx}/js/sale/orders.js"></script>
</head>
<body>

<div style="margin-top: 15px">
<div class="layui-input-inline" style="margin-left: 10px">
<label>流水号(编号)</label>
<div class="layui-input-inline" style="width: 200px">
    <input type="text" name="uuid" id="uuid" lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
</div>
</div>

<div class="layui-input-inline" style="margin-left: 20px">
<label>状态</label>
<div class="layui-input-inline" style="width: 200px;">
    <input type="text" name="ststateate" id="state" lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
</div>
</div>
    <div class="layui-input-inline" style="margin-left: 10px">
        <label>下单日期</label>
        <div class="layui-input-inline" style="width: 200px;" >
            <input type="text" name="createtime" id="createtime" lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
        </div>
    </div>
</div>

<div style="margin-top: 15px">
    <div class="layui-input-inline" style="margin-left: 20px">
<label >下单人</label>
<div class="layui-input-inline" style="width: 200px;margin-left: 22px" >
    <input type="text" name="creater" id="creater" lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
</div>
</div>

    <div class="layui-input-inline" style="margin-left: 10px">
<label >审核人</label>
<div class="layui-input-inline" style="width: 200px;">
    <input type="text" name="checker" id="checker" lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
</div>
    </div>
    <div class="layui-input-inline" style="margin-left: 10px">
<label >确认人</label>
<div class="layui-input-inline" style="width: 200px;">
    <input type="text" name="starter" id="starter" lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
</div>
    </div>
</div>

<div style="margin-top: 15px">
    <div class="layui-input-inline" style="margin-left: 20px">
        <label>确认日期</label>
        <div class="layui-input-inline" style="width: 200px;">
            <input type="text" name="starttime" id="starttime" lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-input-inline" style="margin-left: 10px">
        <label >入库日期</label>
        <div class="layui-input-inline" style="width: 200px;">
            <input type="text" name="endtime" id="endtime" lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-input-inline" style="margin-left: 10px">
<label >审核日期</label>
<div class="layui-input-inline" style="width: 200px;">
    <input type="text" name="checktime" id="checktime" lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
</div>
    </div>
</div>
<table class="layui-hide" id="orderdetail" lay-filter="orderdetail"></table>

<table class="layui-hide" id="table" lay-filter="table"></table>
<input type="button"  id="chuku" class="layui-btn" style="margin-left:30px" value="出库">
<input type="button"  id="tuihuo" class="layui-btn" style="margin-left:30px" value="退货申请">
<input type="button"  id="tongyi" class="layui-btn" style="margin-left:30px" value="同意">
</body>

<script>
    layui.use(['element','table','layer','form'], function() {
        var element = layui.element;//元素操作
        var $ = layui.jquery;
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;

        var uuid=$('#ordersuuid').val();

        var Ohref=window.location.href;
        var arrhref=Ohref.split("?uuid=");

        var path = $('#absolutePath').val();//路径
        var url ='${ctx}/orderdetail/queryOrdersdetail'
        table.render({
            elem: '#orderdetail'
          /*  , data: []*/
            ,url:url
            ,where:{sa:arrhref[1]}
            , method: 'post'
            , toolbar: '#toolbarDemo'
            , title: '订单详情表',
            id: "orderdetailtable"
            , totalRow: 'true'
            , request: {
                pageName: 'page' //页码的参数名称，默认：page
                , limitName: 'rows',//每页数据量的参数名，默认：limit，
            }
            , cols: [[
                {field: 'uuid', title: "编号", width: "20%", algin: 'center'}
                ,{field: 'goodsuuid', title: "商品编号", width: "15%", algin: 'center'}
                , {field: 'goodsname', title: "商品名称", width: "15%", algin: 'center'}
                , {field: 'price', title: "价格", width: "10%", algin: 'center'}
                , {field: 'num', title: "数量", width: "10%", algin: 'center' }
                , {field: 'money', title: "金额", width: "10%", algin: 'center' }
            ]]
            , page: true
        });

    });

</script>

</html>
