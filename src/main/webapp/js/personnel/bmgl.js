layui.use(['table','layer','form'], function(){
    var table = layui.table,
        layer = layui.layer,
        form = layui.form,
        $ = layui.jquery
    var path = $('#absolutePath').val();//路径
    table.render({
        elem: '#test'
        ,url:path+'dep/queryDep'
        ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        ,toolbar: '#toolbarDemo'
        ,title: '部门管理'
        ,id:"depTable"
        ,cols: [[
            {type: 'checkbox', fixed: 'left'}
            ,{field:'uuid', title:'编号', sort: true,align: 'center'}
            ,{field:'name', title:'名称',align: 'center'}
            ,{field:'tele', title:'电话',align: 'center'}
            ,{fixed: 'right', title:'操作', toolbar: '#barDemo', align: 'center'}
        ]]
        ,page: true
    });

    //头工具栏事件
    table.on('toolbar(test)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id);
        switch(obj.event){
            case 'add':
                layer.open({
                    type: 2,
                    title: '增加',
                    shadeClose: true,
                    shade: 0.8,
                    area: ['50%', '50%'],
                    content:path+'personnel/addDep.jsp', //iframe的url
                    end: function() {
                        table.reload("depTable",{});
                    }
                });
                break;
        };
    });

    //查询
    $("#search_btn").on("click", function () {
        var name = $("#name").val();
        table.reload("depTable", {
            method: 'post',
            where: {
                name: name,//搜索的关键字
            }
        })
        //清空文本框的值
        $("#name").val('');
    })


    //监听行工具事件
    table.on('tool(test)', function(obj){
        var data = obj.data;
        if(obj.event === 'del'){
            layer.confirm('真的删除行么', function(index){
                basesubmit(path+'dep/delDep', { uuid: data.uuid });
                layer.close(index);
                table.reload("depTable",{});
            });
        } else if(obj.event === 'edit'){
            layer.open({
                type: 2,
                title: '部门编辑',
                shadeClose: true,
                scrollbar:true,
                shade: 0.5,
                area: ['50%', '50%'],
                btn:['修改', '取消'],
                content:path+'personnel/editDep.jsp', //iframe的url
                success: function (layero, index) {
                    var body = layui.layer.getChildFrame('body', index);
                    $.each(data, function(i, val) {
                        body.find("#"+i).val(val);
                    });
                    layui.form.render();
                },
                yes:function(index, layero){
                    var data = table.checkStatus('depTable').data;
                    console.log(data)
                    var body = layer.getChildFrame('body', index);
                    basesubmit(path+'dep/editDep',body.find("#editDep").serialize());
                    layer.close(index); //再执行关闭，强制关闭弹窗
                    table.reload("depTable",{});
                }
            });
        }
    });

    $("#btn_Dep").click(function () {
        basesubmit('http://localhost:8080/ssm/dep/addDep', $('#addDep').serialize());
        //关闭自身
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        parent.layer.close(index); //再执行关闭，强制关闭弹窗
    });

});