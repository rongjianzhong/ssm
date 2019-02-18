layui.use(['table','layer','form'], function(){
    var table = layui.table,
        layer = layui.layer,
        form = layui.form,
        $ = layui.jquery
    var path = $('#absolutePath').val();//路径
    table.render({
        elem: '#test'
        ,url:path+'storedetail/querystoredetail'
        ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        ,toolbar: '#toolbarDemo'
        ,title: '仓库库存查询'
        ,id:"storedetailTable"
        ,cols: [[
            {type: 'checkbox', fixed: 'left'}
            ,{field:'uuid', title:'编号', sort: true,align: 'center'}
            ,{field:'storeuuid', title:'仓库',align: 'center'}
            ,{field:'goodsuuid', title:'商品',align: 'center'}
            ,{field:'num', title:'数量',align: 'center'}
        ]]
        ,page: true
    });
    //查询
    $("#search_btn").on("click", function () {
        var goodsuuid = $("#goodsuuid").val();
        var storeuuid = $("#storeuuid").val();
        table.reload("storedetailTable", {
            method: 'post',
            where: {
                goodsuuid: goodsuuid,//搜索的关键字
                storeuuid:storeuuid
            }
        })
        //清空文本框的值
        $("#storeuuid").val('');
        $("#goodsuuid").val('');
    })

});