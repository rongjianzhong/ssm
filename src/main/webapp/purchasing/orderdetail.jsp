
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <input type="hidden" id="absolutePath" value="${pageContext.request.contextPath }/"/>
    <%@include file="/common/head.jsp"%>
    <title>采购订单查询</title>
    <script src="${ctx}/js/purchasing/order.js"></script>
</head>
<body>

<div style="margin-top: 15px">
<div class="layui-input-inline" style="margin-left: 10px">
<label>流水号(编号)</label>
<div class="layui-input-inline" style="width: 200px">
    <input type="text" name="uuid" id="uuid" lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
</div>
</div>

<div class="layui-input-inline" style="margin-left: 10px">
<label >供应商</label>
<div class="layui-input-inline" style="width: 200px;">
    <input type="text" name="supplieruuid" id="supplieruuid " lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
</div>
</div>

<div class="layui-input-inline" style="margin-left: 20px">
<label>状态</label>
<div class="layui-input-inline" style="width: 200px;">
    <input type="text" name="sate" id="state" lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
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
<label >检查人</label>
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
<label>库管员</label>
<div class="layui-input-inline" style="width: 200px;margin-left: 12px">
    <input type="text" name="aa" id="aa" lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
</div>
    </div>
    <div class="layui-input-inline" style="margin-left: 10px">
<label>下单日期</label>
<div class="layui-input-inline" style="width: 200px;" >
    <input type="text" name="createtime" id="createtime" lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
</div>
    </div>
    <div class="layui-input-inline" style="margin-left: 10px">
<label >检查日期</label>
<div class="layui-input-inline" style="width: 200px;">
    <input type="text" name="checktime" id="checktime" lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
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
</div>

<table class="layui-hide" id="orderdetail" lay-filter="orderdetail"></table>


</body>

<script>
    layui.use(['element','table','layer','form'], function() {
        var element = layui.element;//元素操作
        var $ = layui.jquery;
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;

        //var uuid=$('#ordersuuid').val();

        var Ohref=window.location.href;
        var arrhref=Ohref.split("?uuid=");

        var path = $('#absolutePath').val();//路径
        var ordersuuid=arrhref[1];
        table.render({
            elem: '#orderdetail'
          /*  , data: []*/
            ,url:'${ctx}/orderdetail/queryorderdetail'
            ,where:{ordersuuid:ordersuuid}
            , method: 'post'
            , toolbar: '#toolbarDemo'
            , title: '订单详情表',
            id: "orderdetailtable"
            , totalRow: 'true'
            , cols: [[
                {field: 'uuid', title: "订单编号", width: "15%", algin: 'center'}
                ,{field: 'goodsuuid', title: "商品编号", width: "15%", algin: 'center'}
                , {field: 'goodsname', title: "商品名称", width: "12%", algin: 'center'}
                , {field: 'price', title: "价格", width: "10%", algin: 'center'}
                , {field: 'num', title: "数量", width: "10%", algin: 'center', edit: 'text', }
                , {field: 'money', title: "金额", width: "10%", algin: 'center' }
                , {field: 'state', title: "状态", width: "10%", algin: 'center'
                   , templet:function (row) {
                        // return createTime(row.birthday)
                        if(row.state==1){
                            return "未入库";
                        }
                        else if(row.state==2){
                            return "已入库";
                        }
                    }
                }
                , {field: 'ordersuuid', title: "订单id", width: "10%", algin: 'center' }
                , {fixed: 'right', width: "10%", align: 'center', toolbar: '#barDemo'}
            ]]
            , page: true
        });

    });


</script>

</html>
