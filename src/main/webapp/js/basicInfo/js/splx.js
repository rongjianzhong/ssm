layui.use(['table','layer','form'], function(){
    var table = layui.table,
        layer = layui.layer,
        form = layui.form
        $ = layui.jquery
    var path = $('#absolutePath').val();//路径
    table.render({
        elem: '#test'
        ,data:[]
        // ,url:path+'goodStype/queryGoodStype'
        ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        ,toolbar: '#toolbarDemo'
        ,title: '商品类型'
        ,id:"goodStypeTable"
        ,cols: [[
            {type: 'checkbox', fixed: 'left'}
            ,{field:'uuid', title:'编号', sort: true,align: 'center'}
            ,{field:'name', title:'名称',align: 'center'}
            ,{fixed: 'right', title:'操作', toolbar: '#barDemo', align: 'center'}
        ]]
        ,page: true
    });

    //查询
    $("#search_btn").on("click", function () {
        var name = $("#name").val();
        table.reload("goodStypeTable", {
            url: path+'goodStype/queryGoodStype?lx=a',
            method: 'post',
            where: {
                name: name,//搜索的关键字
            }
        })
        //清空文本框的值
        $("#name").val('');
    })

    //头工具栏事件
    table.on('toolbar(test)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id);
        switch(obj.event){
            case 'add':
                layer.open({
                    type: 2,
                    title: '商品分类',
                    shadeClose: true,
                    shade: 0.8,
                    area: ['30%', '20%'],
                    btn:['增加', '取消'],
                    content:path+'basicInfo/addsplx.jsp', //iframe的url
                    yes:function(index, layero){
                        var body = layer.getChildFrame('body', index);
                        basesubmit(path+'goodStype/addGoodStype',body.find("#addGoodStype").serialize());
                        layer.close(index); //再执行关闭，强制关闭弹窗
                        table.reload("goodStypeTable",{});
                    }
                });
        };
    });

    //监听行工具事件
    table.on('tool(test)', function(obj){
        var data = obj.data;
        if(obj.event === 'del'){
            layer.confirm('真的删除行么', function(index){
                basesubmit(path+'goodStype/delGoodStype', { uuid: data.uuid });
                layer.close(index);
                table.reload("goodStypeTable",{});
            });
        } else if(obj.event === 'edit'){
            layer.open({
                type: 2,
                title: '商品编辑',
                shadeClose: true,
                scrollbar:true,
                shade: 0.5,
                area: ['30%', '20%'],
                btn:['修改', '取消'],
                content:path+'basicInfo/addsplx.jsp', //iframe的url
                success: function (layero, index) {
                    var body = layui.layer.getChildFrame('body', index);
                    $.each(data, function(i, val) {
                        body.find("#"+i).val(val);
                    });
                    form.render();
                },
                yes:function(index, layero){
                    var body = layer.getChildFrame('body', index);
                    basesubmit(path+'goodStype/editGoodStype',body.find("#addGoodStype").serialize());
                    layer.close(index); //再执行关闭，强制关闭弹窗
                    table.reload("goodStypeTable",{});
                }
            });
        }
    });
});