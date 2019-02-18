<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/28
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
   <%@include file="/common/head.jsp"%>
</head>
<body>

<table class="layui-hide" id="tableadd" ></table>

<div style="padding: 15px"  id="addBook">

   <input type="hidden" id="item">

   <form class="layui-form" id="bookForm">
      <button class="layui-btn" id="submit">立即提交</button>

   </form>
</div>


<script>
    layui.use(['element','table','layer'], function(){
        var element = layui.element;//元素操作
        var $ = layui.jquery;
        var table=layui.table;
        var layer=layui.layer;
        table.render({
            elem: '#tableadd'
           , url:'${ctx}/goods/querymap'
            ,method:'post'
            ,toolbar:'#toolbarDemo'
            ,id:"tableadd"
            ,request: {
                pageName: 'page' //页码的参数名称，默认：page
                ,limitName: 'rows' ,//每页数据量的参数名，默认：limit，
            }
            ,cols: [[{type: 'checkbox', fixed: 'left'}
                ,{field:'uuid',title:"商品编号",width:"15%",algin:'center'}
                ,{field:'name',title:"商品名称",width:"25%",algin:'center'}
                ,{field:'outprice',title:"价格",width:"10%",algin:'center'}
            ]]
            ,page: true
        });


        $("#submit").click(function(){
            //得到原有的数据
            var item=eval($("#item").val())
            var ids=[];//保存已经存在的id
            $.each(item,function (index,elem) {
                ids.push(elem.uuid)
            })

            //得到选择的数据
            var data=table.checkStatus('tableadd').data;
            $.each(item,function (index,elem) {
                $.each(data,function (ind,el) {
                    //如果选择的商品一样
                    if(elem.uuid==el.uuid){
                        //修改商品购买数量
                        elem.COUNT=elem.COUNT+el.COUNT;
                        elem.money=elem.money+el.money;
                    }
                    else if(ids.indexOf(el.uuid)==-1){
                        ids.push(el.uuid);//重新刷新已有的id
                        item.push(el)
                    }
                })
            })

            if(item.length==0){
                item=data;
            }

            parent.layui.table.reload("table",{data:item});
            var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
            parent.layer.close(index);


        })



    });
</script>

</body>
</html>
