layui.use(['table','layer','form'], function(){
    var table = layui.table,
        layer = layui.layer,
        form = layui.form,
        $ = layui.jquery
    var path = $('#absolutePath').val();//路径
    table.render({
        elem: '#store'
        ,url:path+'store/querystore'
        ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        ,toolbar: '#toolbarDemo'
        ,title: '仓库'
        ,id:"storeTable"
        ,cols: [[
            {type: 'checkbox', fixed: 'left'}
            ,{field:'uuid', title:'编号', sort: true,align: 'center'}
            ,{field:'name', title:'名称',align: 'center'}
            ,{field:'address', title:'地址',align: 'center'}
            ,{field:'empuuid', title:'仓库管理员',align: 'center'}
            ,{field:'createdate', title:'创建时间',align: 'center'}
            ,{fixed: 'right', title:'操作', toolbar: '#barDemo', align: 'center'}

        ]]
        ,page: true
    });


    //头工具栏事件
    table.on('toolbar(store)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id);
        switch(obj.event){
            case 'addstore':
                layer.open({
                    type: 2,
                    title: '增加',
                    shadeClose: true,
                    shade: 0.8,
                    btn:['增加', '取消'],
                    area: ['52%', '65%'],
                    content:path+'basicInfo/addStore.jsp', //iframe的url
                    yes:function(index, layero){
                        var body = layer.getChildFrame('body', index);
                        basesubmit(path+'store/addstore',body.find("#addstore").serialize());
                        layer.close(index); //再执行关闭，强制关闭弹窗
                        table.reload("storeTable",{});
                    }
                });
                break;
        };
    });


    //查询
    $("#searchstore_btn").on("click", function () {
        var name = $("#name").val();
        var address = $("#address").val();

        table.reload("storeTable", {
            method: 'post',
            where: {
                name: name,//搜索的关键字
                address: address,
            }
        })
        //清空文本框的值
        $("#name").val('');
        $("#address").val('');


    })

    //监听行工具事件
    table.on('tool(store)', function(obj){
        var data = obj.data;
        if(obj.event === 'delstore'){
            layer.confirm('真的删除行么', function(index){
                basesubmit(path+'store/delstore', { uuid: data.uuid });
                layer.close(index);
                table.reload("storeTable",{});
            });
        } else if(obj.event === 'editstore'){
            layer.open({
                type: 2,
                title: '修改',
                shadeClose: true,
                scrollbar:true,
                shade: 0.5,
                area: ['35%', '50%'],
                btn:['修改', '取消'],
                content:path+'basicInfo/addStore.jsp', //iframe的url
                success: function (layero, index) {
                    var body = layui.layer.getChildFrame('body', index);
                    $.each(data, function(i, val) {
                        body.find("#"+i).val(val);
                    });
                    form.render();
                },
                yes:function(index,b){
                    var body = layer.getChildFrame('body', index);
                    basesubmit(path+'store/editstore',body.find("#addstore").serialize());
                    layer.close(index); //再执行关闭，强制关闭弹窗
                    table.reload("storeTable",{});
                }
            });
        }
    });


});