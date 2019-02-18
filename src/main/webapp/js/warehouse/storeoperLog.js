var path = $('#absolutePath').val();//路径
layui.use(['table','layer','form'], function(){
    var table = layui.table,
        layer = layui.layer,
        form = layui.form,
        $ = layui.jquery
    table.render({
        elem: '#test'
        ,url:path+'storeoper/queryStoreoper'
        ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        ,toolbar: '#toolbarDemo'
        ,title: '仓库库存查询'
        ,id:"storeoperTable"
        ,cols: [[
            {type: 'checkbox', fixed: 'left'}
            ,{field:'uuid', title:'编号', sort: true,align: 'center'}
            ,{field:'empuuid', title:'员工',align: 'center'}
            ,{field:'opertime', title:'操作时间',align: 'center'}
            ,{field:'storeuuid', title:'仓库',align: 'center'}
            ,{field:'goodsuuid', title:'商品',align: 'center'}
            ,{field:'num', title:'数量',align: 'center'}
            ,{field:'type', title:'类型',align: 'center',
                templet:function (row) {
                    if(row.type==1){
                        return "入库";
                    }
                    else if(row.type==2){
                        return "出库";
                    }
                    else if(row.type==3){
                        return "退货入库";
                    }
                }
            }
        ]]
        ,page: true
    });
    //查询
    $("#search_btn").on("click", function () {
        var empuuid = $("#empuuid").val();
        var depuuid = $("#depuuid").val();
        var name = $("#name").val();
        var type = $("#type").val();
        var ks = $("#ks").val();
        var js = $("#js").val();
        table.reload("storeoperTable", {
            method: 'post',
            where: {
                empuuid: empuuid,//搜索的关键字
                storeuuid: depuuid,
                goodsuuid: name,
                type: type,
                ks: ks,
                js: js
            }
        })
    })
    // 搜索栏员工下拉框
    $.ajax({
        url: path+"emp/queryEmpa",
        dataType: 'json',
        success: function (data) {
            var html = '';
            $.each(data.data, function (index, elem) {
                html += '<option value="' + elem.username + '">' + elem.username + '</option>';
            });
            $("#empuuid").append(html);
            form.render('select');
        }
    });
    // 搜索栏仓库下拉框
    $.ajax({
        url: path+"store/querystore?lx='仓库'",
        dataType: 'json',
        success: function (data) {
            var html = '';
            $.each(data.data, function (index, elem) {
                html += '<option value="' + elem.name + '">' + elem.name + '</option>';
            });
            $("#depuuid").append(html);
            form.render('select');
        }
    });
    // 搜索栏商品下拉框
    $.ajax({
        url: path+"goods/queryGoods?lx='商品'",
        dataType: 'json',
        success: function (data) {
            var html = '';
            $.each(data.data, function (index, elem) {
                html += '<option value="' + elem.name + '">' + elem.name + '</option>';
            });
            $("#name").append(html);
            form.render('select');
        }
    });


});
layui.use(['laydate'], function () {
    laydate = layui.laydate;
    laydate.render({
        elem: '#ks'
        ,type: 'datetime'
    });
    laydate.render({
        elem: '#js'
        ,type: 'datetime'
    });
});