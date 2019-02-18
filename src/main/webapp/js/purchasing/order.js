layui.use(['table','layer','form'], function(){
    var table = layui.table,
        layer = layui.layer,
        form = layui.form,
        $ = layui.jquery
    var path = $('#absolutePath').val();//路径

    table.render({
        elem: '#order'
        ,url:path+'order/queryorder'
        ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        ,toolbar: '#toolbarDemo'
        ,title: '商品类型'
        ,id:"queryTable"
        ,cols: [[
            {type: 'checkbox', fixed: 'left'}
            ,{field:'uuid', title:'编号', sort: true,align: 'center'}
            ,{field:'createtime', title:'创建日期',align: 'center'}
            ,{field:'checktime', title:'检查日期',align: 'center'}
            ,{field:'starttime', title:'开始时间',align: 'center'}
            ,{field:'endtime', title:'结束时间',align: 'center'}
            ,{field:'creater', title:'下单员',align: 'center'}
            ,{field:'checker', title:'审查员',align: 'center'}
            ,{field:'starter', title:'采购员',align: 'center'}
            ,{field:'ender', title:'库管员',align: 'center'}
            ,{field:'supplieruuid', title:'供应商',align: 'center'}
            ,{field:'totalmoney', title:'总金额',align: 'center'}
            ,{field:'state', title:'订单状态',align: 'center',
                templet:function (row) {
                    // return createTime(row.birthday)
                    if(row.state==1){
                        return "未入库";
                    }
                    else if(row.state==2){
                        return "已审核";
                    }
                    else if(row.state==3){
                        return "已入库";
                    }
                    else if(row.state==4){
                        return "采购退货审批";
                    }
                    else if(row.state==5){
                        return "采购结束";
                    }

                }
        }

        ]]
        ,page: true
    });


    //头工具栏事件
    table.on('toolbar(order)', function(obj){

        var checkStatus = table.checkStatus(obj.config.id);
        switch(obj.event){
            case 'addorder':
                layer.open({
                    type: 2,
                    title: '商品分类',
                    shadeClose: true,
                    shade: 0.8,
                    area: ['80%', '80%'],
                   /* btn:['增加', '取消'],*/
                    content:path+'purchasing/buyerAdd.jsp', //iframe的url
                   /* yes:function(index, layero){
                        var body = layer.getChildFrame('body', index);
                        basesubmit(path+'goodStype/addGoodStype',body.find("#addGoodStype").serialize());
                        layer.close(index); //再执行关闭，强制关闭弹窗
                        table.reload("queryTable",{});
                    }*/
                });

        };
    });




});