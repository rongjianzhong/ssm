
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <input type="hidden" id="absolutePath" value="${pageContext.request.contextPath }/"/>
    <%@include file="/common/head.jsp"%>
    <title>采购订单查询</title>
    <script src="${ctx}/js/purchasing/queryorder1.js"></script>
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
    <input type="text" name="supplieruuid" id="supplieruuid" lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
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


<table class="layui-hide" id="orderdetail1" lay-filter="orderdetail1"></table>

<div style="margin-top: 15px;margin-left:400px;height:100px;width: 150px">
    <input type="submit"  id="check" class="layui-btn layui-btn-lg" value="审查" >

</div>

</body>

<script>
    layui.use(['element','table','layer','form'], function() {
        var element = layui.element;//元素操作
        var $ = layui.jquery;
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;

        var Ohref=window.location.href;
        var arrhref=Ohref.split("?uuid=");

        var ordersuuid=arrhref[1];
        var path = $('#absolutePath').val();//路径
        var url ='${ctx}/orderdetail/queryorderdetail';
        table.render({
            elem: '#orderdetail1'
          /*  , data: []*/
            ,url:url
            ,where:{ordersuuid:ordersuuid}
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
                {field: 'uuid', title: "订单编号", width: "15%", algin: 'center'}
                ,{field: 'goodsuuid', title: "商品编号", width: "15%", algin: 'center'}
                , {field: 'goodsname', title: "商品名称", width: "12%", algin: 'center'}
                , {field: 'price', title: "价格", width: "10%", algin: 'center'}
                , {field: 'num', title: "数量", width: "10%", algin: 'center', }
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

       //提交到数据库
        $("#check").click(function () {
            //获取状态
            var state=$("#state").val();
            console.log("aa"+state);
            //获取路径，再切割获取地址后面的参数
            var Ohref=window.location.href;
            var arrhref=Ohref.split("?uuid=");
           if(state==2){
                layer.alert("此订单已审查", {
                    title: '当前行数据：'
                });
            }
           else if(state==3){
               layer.alert("此订单已入库", {
                   title: '当前行数据：'
               });
           }
            else if(state==4){
               layer.confirm('确认要结束该订单吗？', function(index){
                   basesubmit('${ctx}/order/updatecheck3?uuid='+arrhref[1]+'',null);
                   layer.close(index);
                   table.reload("orderdetailtable",{});
               });
           }

           else if(state==5){
               layer.alert("此订单已结束", {
                   title: '当前行数据：'
               });
           }
            else{
            layer.confirm('确认要审核吗？', function(index){
                basesubmit('${ctx}/order/updatecheck?uuid='+arrhref[1]+'',null);
                layer.close(index);
                table.reload("orderdetailtable",{});
            });
           }
        })



    });



</script>

</html>
