layui.use(['table','layer','form'], function(){
    var table = layui.table,
        layer = layui.layer,
        form = layui.form
    $ = layui.jquery
    var path = $('#absolutePath').val();
    table.render({
        elem: '#test'
        ,url:path+'order/queryOrders'
        ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        ,toolbar: '#toolbarDemo'
        ,title: '商品类型'
        ,id:"ordersTable"
        ,cols: [[
            {type: 'checkbox', fixed: 'left'}
            ,{field:'uuid', title:'编号', sort: true,align: 'center'}
            ,{field:'createtime', title:'录入日期',align: 'center'}
            ,{field:'starttime', title:'出库日期',align: 'center'}
            ,{field:'creater', title:'销售员',align: 'center'}
            ,{field:'supplieruuid', title:'客户',align: 'center'}
            ,{field:'totalmoney', title:'总金额',align: 'center'}
            ,{field:'state', title:'订单状态',align: 'center',
                templet:function (row) {
                    if(row.state==3){
                        return "未出库";
                    }
                    else if(row.state==4){
                        return "已出库";
                    }
                    else if(row.state==6){
                        return "退货申请";
                    }
                    else if(row.state==7){
                        return "订单结束";
                    }
                }
            }
        ]]
        ,page: true
    });

    //监听行单击事件（单击事件为：rowDouble）
 table.on('row(test)', function(obj) {
         var data = obj.data
         var aa = data.uuid;
     sessionStorage.setItem("ordersTableUUID",data.uuid);
     sessionStorage.setItem("ordersTablestate",data.state);
        layer.open({
            type: 2,
            title: '订单详情',
            shadeClose: true,
            scrollbar:true,
            shade: 0.5,
            area: ['900px','550px'],
            // btn:['确认','取消'],
            content:path+'sale/orderdetail.jsp?uuid='+aa+'', //iframe的url
            success: function (layero, index) {
                var body = layui.layer.getChildFrame('body', index);
                $.each(data, function(i, val) {
                    body.find("#"+i).val(val);
                });
                form.render();
            },
            yes:function(index,b){
                var body = layer.getChildFrame('body', index);
                layer.close(index); //再执行关闭，强制关闭弹窗
                table.reload("depTable",{});
            },
            end:function () {
                table.reload("ordersTable",{});
            }
        });
     });

    //出库按钮
    $("#chuku").click(function(){
        var state = sessionStorage.getItem("ordersTablestate");
        if(state==7){
            layer.msg("此订单已经交易完成")
            return false;
        }
        else if(state==6){
            layer.msg("此订单正在申请退货")
            return false;
        }
        else if(state!=3){
            layer.msg("此订单已出库!")
            return false;
        }
        var data = table.cache['orderdetailtable'];
        var id;
        $.each(data, function(i, val) {
            id = val.ordersuuid;
        });
        basesubmit(path+'order/updateorders', {uuid:id,item:JSON.stringify(data)});
        // var index = parent.layer.getFrameIndex(window.name);
        // parent.layer.close(index);//关闭当前页
    })

    //退货申请按钮
    $("#tuihuo").click(function(){
        var state = sessionStorage.getItem("ordersTablestate");
        if(state==7){
            layer.msg("此订单交易完成")
            return false;
        }
        else if(state==6){
            layer.msg("此订单正在审核，请勿重复提交")
            return false;
        }
        var id = sessionStorage.getItem("ordersTableUUID");
        basesubmit(path+'order/Salesreturn', {uuid:id});
        // var index = parent.layer.getFrameIndex(window.name);
        // parent.layer.close(index);//关闭当前页
    })
    //同意按钮
    $("#tongyi").click(function(){
        var id = sessionStorage.getItem("ordersTableUUID");
        var state = sessionStorage.getItem("ordersTablestate");
        if(state==7){
            layer.msg("此订单交易完成")
            return false;
        }
        else if(state!=6){
            layer.msg("请先申请退货")
            return false;
        }
        var data = table.cache['orderdetailtable'];
        basesubmit(path+'order/Salesreturna', {uuid:id,item:JSON.stringify(data)});
        // var index = parent.layer.getFrameIndex(window.name);
        // parent.layer.close(index);//关闭当前页
    })
    //头工具栏事件
    table.on('toolbar(test)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id);
        switch(obj.event){
            case 'add':
                layer.open({
                    type: 2,
                    title: '增加订单',
                    shadeClose: true,
                    shade: 0.8,
                    area: ['80%', '90%'],
                    content:path+'sale/addOrders.jsp', //iframe的url
                    end:function () {
                        table.reload("ordersTable",{});
                    }
                });
             break;
        };
    });
});