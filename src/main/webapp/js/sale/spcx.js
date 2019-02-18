layui.use(['table','layer','form'], function(){
    var table = layui.table,
        layer = layui.layer,
        form = layui.form
    $ = layui.jquery
    var path = $('#absolutePath').val();//路
    table.render({
        elem: '#spcx'
        ,url:path+'storedetail/querystoredetail'
        ,cellMinWidth: 100 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        ,title: '商品'
        ,id:'spcx'
        ,cols: [[
            {type: 'checkbox', fixed: 'left'}
            ,{field:'uuid', title:'编号', sort: true,align: 'center'}
            ,{field:'name', title:'商品名称',align: 'center'}
            ,{field:'unit', title:'计量单位',align: 'center'}
            ,{field:'outprice', title:'价格',align: 'center'}
        ]]
        ,page: true
    });


});