layui.use(['table','layer','form'], function(){
    var table = layui.table,
        layer = layui.layer,
        form = layui.form
    $ = layui.jquery
    var path = $('#absolutePath').val();//路
    table.render({
        elem: '#addorders'
        ,data:[]
        // ,url:path+'orders/queryOrders'
        ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        ,toolbar: '#toolbarDemo'
        ,title: '商品类型'
        ,id:"addOrdersTable"
        ,totalRow:'true' //开启合计行
        ,cols: [[
            {type: 'checkbox', fixed: 'left'}
            ,{field:'uuid', title:'编号',align: 'center', width:100,sort: true, fixed: 'left', totalRowText: '合计：'}
            ,{field:'name', title:'商品名称',align: 'center'}
            ,{field:'outprice', title:'价格',align: 'center'}
            ,{field:'count', title:'数量',align: 'center',edit:'text'}
            ,{field:'money', title:'金额',align: 'center',width: 135, sort: true, totalRow: true}
            ,{fixed: 'right', title:'操作', toolbar: '#barDemo', align: 'center'}
        ]]
        ,page: true
    });
    table.render({
        elem: '#spcx'
        ,url:path+'goods/queryGoodsa'
        ,cellMinWidth: 100 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        ,title: '商品'
        ,id:'spcxa'
        ,cols: [[
            {type: 'checkbox', fixed: 'left'}
            ,{field:'uuid', title:'编号', sort: true,align: 'center'}
            ,{field:'name', title:'商品名称',align: 'center'}
            ,{field:'unit', title:'计量单位',align: 'center'}
            ,{field:'outprice', title:'价格',align: 'center'}
        ]]
        ,page: true
    });

    //头工具栏事件
    table.on('toolbar(test)', function(obj){
        switch(obj.event){
            case 'adda':
                var item =obj.config.data;
                sessionStorage.setItem("akey",JSON.stringify(item));
                layer.open({
                    type: 2,
                    title: '商品',
                    shadeClose: true,
                    shade: 0.8,
                    area: ['80%', '90%'],
                    content:path+'sale/spcx.jsp', //iframe的url
                });
                break;
        };
    });

    //获取下拉框选中的值
    var type=new Array();
    form.on('select(aihao)', function(data){
        type=data;
        console.log(type.value); //得到被选中的值
    });

    $("#tijiao").click(function(){
        var data = layui.table.cache['addOrdersTable'];
        if(data.length==0){
            layer.msg("请选择商品再购买")
            return false;
        }
        basesubmit(path+'order/addOrders?supplieruuid='+type.value+'', {items: JSON.stringify(data)});
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);//关闭当前页
    })

    $("#submit").click(function(){
        var data=table.checkStatus('spcxa').data;
        var sd = sessionStorage.getItem("akey");
        if(sd!='null'){
            var item=eval(sd);
        }else {
            var item=[];
        }
        $.each(data,function (index,elem) {
            var vv = true;
            $.each(item,function (ind,el) {
                if(el.uuid==elem.uuid){
                    elem.count=parseInt(el.count)+1;
                    elem.money=parseInt(elem.count)*elem.outprice;
                    vv = false;
                }
            })
            if(vv){
                elem.count=1;
                elem.money=elem.outprice;
            }
        })
        $.each(item,function (ind,el) {
            var vv = true;
            $.each(data,function (index,elem) {
                if(el.uuid==elem.uuid){
                    vv = false;
                }
            })
            if(vv){
                data.push(el);
            }
        })
        sessionStorage.clear();
        parent.layui.table.reload("addOrdersTable",{data:data});
        var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        parent.layer.close(index);
    })


    table.on('edit(test)', function(obj){ //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
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
        table.reload('addOrdersTable', {
            data: table.cache.addOrdersTable
        })


    });


    //监听行工具事件
    table.on('tool(test)', function(obj){ //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
        var data = obj.data; //获得当前行数据
        if(obj.event === 'del'){
            layer.confirm('真的删除行么', function(index){
                var datas=table.cache.addOrdersTable;//获取表格数据
                var dex ;
                $.each(datas,function (ind,elem) {
                    if(data.uuid==elem.uuid){
                        dex=ind;
                    }
                })
                if (dex > -1) {
                    datas.splice(dex , 1);
                }
                table.reload("addOrdersTable",{data:datas});
                layer.close(index);

            });

        }

    });





});