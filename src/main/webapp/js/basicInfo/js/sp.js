layui.use(['table','layer','form'], function(){
    var table = layui.table,
        layer = layui.layer,
        form = layui.form,
        $ = layui.jquery
    var path = $('#absolutePath').val();//路径
    table.render({
        elem: '#goods'
        ,url:path+'goods/queryGoods'
        ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        ,toolbar: '#toolbarDemo'
        ,title: '商品类型'
        ,id:"goodSTablea"
        ,cols: [[
            {type: 'checkbox', fixed: 'left'}
            ,{field:'uuid', title:'编号',align: 'center'}
            ,{field:'name', title:'名称',align: 'center'}
            ,{field:'origin', title:'产地',align: 'center'}
            ,{field:'producer', title:'厂家',align: 'center'}
            ,{field:'unit', title:'计量单位',align: 'center'}
            ,{field:'inprice', title:'进货价格',align: 'center'}
            ,{field:'outprice', title:'销售价格',align: 'center'}
            ,{field:'goodstypeuuid', title:'商品类型',align: 'center'}
            ,{field:'createdate', title:'创建时间', sort: true,align: 'center'}
            ,{fixed: 'right', title:'操作', toolbar: '#barDemo', align: 'center'}

        ]]
        ,page: true
    });

    //头工具栏事件
    table.on('toolbar(goods)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id);
        switch(obj.event){
            case 'addgoods':
                layer.open({
                    type: 2,
                    title: '商品分类',
                    shadeClose: true,
                    shade: 0.8,
                    btn:['增加', '取消'],
                    area: ['45%', '55%'],
                    content:path+'basicInfo/addsp.jsp', //iframe的url
                    yes:function(index, layero){
                        var body = layer.getChildFrame('body', index).find("#addGoods").serialize();
                        basesubmit(path+'goods/addGoods',body);
                        layer.close(index); //再执行关闭，强制关闭弹窗
                        table.reload("goodSTablea",{});
                    }
                });
                break;
        };
    });


    //查询
    $("#searchgoods_btn").on("click", function () {
        var name = $("#name").val();
        var origin = $("#origin").val();
        var producer = $("#producer").val();
        var goodstypeuuid = $("#goodstypeuuid").val();
        table.reload("goodSTablea", {
            method: 'post',
            where: {
                name: name,//搜索的关键字
                origin:origin,
                producer:producer,
                goodstypeuuid:goodstypeuuid
            }
        })
        //清空文本框的值
        $("#name").val('');
        $("#origin").val('');
        $("#producer").val('');
    })

    //监听行工具事件
    table.on('tool(goods)', function(obj){
        var data = obj.data;
        if(obj.event === 'delgoods'){
            layer.confirm('真的删除行么', function(index){
                basesubmit(path+'goods/delGoods', { uuid: data.uuid });
                layer.close(index);
                table.reload("goodSTablea",{});
            });
        } else if(obj.event === 'editgoods'){
            layer.open({
                type: 2,
                title: '商品编辑',
                shadeClose: true,
                scrollbar:true,
                shade: 0.5,
                area: ['50%', '70%'],
                btn:['修改', '取消'],
                content:path+'basicInfo/addsp.jsp', //iframe的url
                success: function (layero, index) {
                    var body = layui.layer.getChildFrame('body', index);
                    $.each(data, function(i, val) {
                        body.find("#"+i).val(val);
                    });
                    form.render();
                },
                yes:function(index,b){
                    var body = layer.getChildFrame('body', index);
                    basesubmit(path+'goods/editGoods',body.find("#addGoods").serialize());
                    layer.close(index); //再执行关闭，强制关闭弹窗
                    table.reload("goodSTablea",{});
                }
            });
        }
    });
});