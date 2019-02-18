<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/28
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <%@include file="/common/head.jsp"%>
</head>
<body>

<div class="layui-form">

    <div class="layui-input-inline">
    <label class="layui-form-label">供应商:</label>
    </div>
 <%-- <div class="layui-input-block" id="type" >
    <select name="type"  lay-verify="required" id="type2" >
      <option v-for="i in BookTypeList" :key="i.uuid" :value="i.producer">{{i.producer}}</option>
    </select>
  </div>--%>
    <div id="aa"  class="layui-input-inline">
        <select name="producer" id="producer" lay-filter="aihao" style="width: 150px" class="from-control input-sum">
            <option value="">请选择供应商</option>
            <option v-for="i of module" :key="i.uuid" :value="i.producer">{{i.producer}}</option>
        </select>
    </div>


</div>

<table class="layui-hide" id="table" lay-filter="table"></table>

<div style="margin-left: 20px">
  <input type="submit"  id="tijiao" class="layui-btn" value="提交">
</div>


<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">

    <button class="layui-btn layui-btn-sm" lay-event="Addbuyer">采购商品</button>

  </div>
</script>

<script type="text/html" id="barDemo">

  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>

    layui.use(['element','table','layer','form'], function(){
        var element = layui.element;//元素操作
        var $ = layui.jquery;
        var table=layui.table;
        var layer=layui.layer;
        var form=layui.form;
        table.render({
            elem: '#table'
           ,data:[]
            ,method:'post'
            ,toolbar: '#toolbarDemo'
            ,title: '采购表',
            id:"table"
           ,totalRow:'true'
            ,request: {
                pageName: 'page' //页码的参数名称，默认：page
                ,limitName: 'rows' ,//每页数据量的参数名，默认：limit，
            }
            ,cols: [[
                {field:'uuid',title:"商品编号",width:"15%",algin:'center',sort:true}
                ,{field:'name',title:"商品名称",width:"25%",algin:'center'}
                ,{field:'outprice',title:"价格",width:"10%",algin:'center'}
                ,{field:'COUNT',title:"数量",width:"10%",algin:'center',edit:'text', totalRowText: '合计:'}
                ,{field:'money',title:"金额",width:"10%",algin:'center',totalRow:true}
                ,{fixed: 'right', width:"10%", align:'center', toolbar: '#barDemo'}
            ]]
            ,page: true


            //获取表格的所有数据
            ,done: function(res, curr, count){
                //如果是异步请求数据方式，res即为你接口返回的信息。
                //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                // console.log(res.data);
                $.each(res.data, function(i, val) {
                    // body.find("#"+i).val(val);
                    console.log(val.uuid)
                });

            }


        });

        //头工具栏事件
        table.on('toolbar(table)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'Addbuyer':

                       var item =table.cache.table;

                    layer.open({
                        type: 2,
                        title: '采购商品',
                        shadeClose: true,
                        shade: 0.8,
                        area: ['70%', '70%'], //宽高
                        content: '${ctx}/purchasing/buyergoods.jsp' , //iframe的url
                        success:function(layero, index){
                            var body=layui.layer.getChildFrame("body",index);//获取ifram的DOM
                            body.find("#item").val(JSON.stringify(item))
                        }
                    });
                    break;
            };
        });


        table.on('edit(table)', function(obj){ //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
          /*  console.log(obj.value); //得到修改后的值
            console.log(obj.field); //当前编辑的字段名
            console.log(obj.data); //所在行的所有相关数据*/

                var data=obj.data;
                var value=obj.value;

                data.outprice = data.outprice * value;
                data.outprice = data.outprice.toFixed(2);
                /*只保留两位小数*/
                obj.update({
                    money: data.outprice

                });
                /*重载表格，重新计算合计*/
                table.reload('table', {
                    data: table.cache.test,

                })


        });

        table.on('tool(table)', function(obj){ //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    var datas=table.cache.table;//获取表格数据
                    var dex ;
                    $.each(datas,function (ind,elem) {
                        if(data.goodsId==elem.goodsId){
                            dex=ind;
                        }
                    })
                    if (dex > -1) {
                        datas.splice(dex , 1);
                    }
                    table.reload("table",{data:datas});
                    layer.close(index);

                });

            }

        });


      //获取下拉框选中的值
        var type=new Array();
        form.on('select(aihao)', function(data){
            type=data;
            console.log(type.value); //得到被选中的值
        });

   //提交到数据库
    $("#tijiao").click(function () {
        var data = layui.table.cache['table'];
        var da = JSON.stringify(data)
        basesubmit('${ctx}/order/addorder?supplieruuid='+type.value+'',{data:da});
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);//关闭当前页
    })
})


    var mv = new Vue({
        el: '#aa',
        data: {
            module:[],

        },
        methods:{
            lst:function(lx){
                //发送post请求
                this.$http.post('${ctx}/goods/queryall',{lx:lx},{emulateJSON: true}).then(function(res){
                    this.module = res.body.data;
                });
            },
        },
        //在页面渲染完成后调用
        mounted() {
            this.lst("供应商");
        },
    })


</script>


</body>
</html>
