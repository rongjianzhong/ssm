layui.use(['table','layer','form', 'laydate'], function(){
    var table = layui.table,
        layer = layui.layer,
        form = layui.form,
        laydate = layui.laydate;
    $ = layui.jquery
    var path = $('#absolutePath').val();//路径
    table.render({
        elem: '#test'
        ,url:path+'emp/queryEmp'
        ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        ,toolbar: '#toolbarDemo'
        ,title: '员工管理'
        ,id:"empTable"
        ,cols: [[
            {type: 'checkbox', fixed: 'left'}
            ,{field:'uuid', title:'编号', sort: true,align: 'center'}
            ,{field:'username', title:'登录名',align: 'center'}
            ,{field:'name', title:'真实姓名',align: 'center'}
            ,{field:'gender', title:'性别',align: 'center'}
            ,{field:'email', title:'Email',align: 'center'}
            ,{field:'tele', title:'电话',align: 'center'}
            ,{field:'address', title:'地址',align: 'center'}
            ,{field:'birthday', title:'创建日期',align: 'center'}
            ,{field:'depuuid', title:'部门',align: 'center'}
            ,{fixed: 'right', title:'操作', toolbar: '#barDemo', align: 'center'}
        ]]
        ,page: true
    });

    //查询
    $("#search_btn").on("click", function () {
        var username = $("#username").val();
        var name = $("#name").val();
        var address = $("#address").val();
        var depuuid = $("#depuuid").val();
        var ks = $("#ks").val();
        var js = $("#js").val();
        table.reload("empTable", {
            method: 'post',
            where: {
                username: username,//搜索的关键字
                name: name,//搜索的关键字
                address: address,//搜索的关键字
                depuuid: depuuid,//搜索的关键字
                ks:ks,
                js:js
            }
        })
        //清空文本框的值
        $("#username").val('');
        $("#name").val('');
        $("#address").val('');
    })

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
                    area: ['30%', '65%'],
                    btn:['增加', '取消'],
                    content:path+'personnel/addEmp.jsp', //iframe的url
                    yes:function(index, layero){
                        var body = layer.getChildFrame('body', index);
                        console.log(body.find("#addEmpa").serialize());
                        basesubmit(path+'emp/addEmp',body.find("#addEmpa").serialize());//{username:body.find("#username").val()}
                        layer.close(index); //再执行关闭，强制关闭弹窗
                        table.reload("empTable",{});
                    }
                });
                break;
        };
    });

    //监听行工具事件
    table.on('tool(test)', function(obj){
        var data = obj.data;
        if(obj.event === 'del'){
            layer.confirm('真的删除行么', function(index){
                basesubmit(path+'emp/delEmp', { uuid: data.uuid });
                layer.close(index);
                table.reload("empTable",{});
            });
        } else if(obj.event === 'edit'){
            layer.open({
                type: 2,
                title: '员工编辑',
                shadeClose: true,
                scrollbar:true,
                shade: 0.5,
                area: ['30%', '65%'],
                btn:['修改', '取消'],
                content:path+'personnel/addEmp.jsp', //iframe的url
                success: function (layero, index) {
                    var body = layui.layer.getChildFrame('body', index);
                    $.each(data, function(i, val) {
                        body.find("#"+i).val(val);
                    });
                    form.render();
                },
                yes:function(index, layero){
                    var body = layer.getChildFrame('body', index);
                    basesubmit(path+'emp/editEmp',body.find("#addEmpa").serialize());
                    layer.close(index); //再执行关闭，强制关闭弹窗
                    table.reload("empTable",{});
                }
            });
        }
    });
    laydate.render({
        elem: '#ks'
    });
    laydate.render({
        elem: '#js',
    });
});