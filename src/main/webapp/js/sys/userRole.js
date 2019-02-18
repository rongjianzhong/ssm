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
        ,id:"roleTable"
        ,cols: [[
            {type: 'checkbox', fixed: 'left'}
            ,{field:'uuid', title:'编号',align: 'center'}
            ,{field:'username', title:'登录名',align: 'center'}
            ,{field:'name', title:'真实姓名',align: 'center'}
            ,{field:'birthday', title:'创建日期',align: 'center'}
            ,{field:'depuuid', title:'部门',align: 'center'}
            ,{fixed: 'right', title:'操作', toolbar: '#barDemo', align: 'center'}
        ]]
        ,page: true
    });

    //查询
    $("#search_btn").on("click", function () {
        var username = $("#username").val();
        var depuuid = $("#depuuid").val();
        table.reload("roleTable", {
            method: 'post',
            where: {
                username: username,//搜索的关键字
                depuuid: depuuid,//搜索的关键字
            }
        })
        //清空文本框的值
        $("#username").val('');
    })

    //监听行工具事件
    table.on('tool(test)', function(obj){
        var data = obj.data;
        if(obj.event === 'edit'){
            layer.open({
                type: 2,
                title: '设置角色',
                shadeClose: true,
                scrollbar:true,
                shade: 0.5,
                area: ['30%', '65%'],
                btn:['确认', '取消'],
                content:path+'sys/rolea.jsp', //iframe的url
                success: function (layero, index) {
                    var body = layui.layer.getChildFrame('body', index);
                    body.find("#userid").val(data.uuid);
                    form.render();
                },
                yes:function(index, layero){
                    var body = layer.getChildFrame('body', index);
                    basesubmit(path+'sysRole/addSysUserRole',body.find("#userRole").serialize());
                    layer.close(index); //再执行关闭，强制关闭弹窗
                    table.reload("roleTable",{});
                }
            });
        }
        // else if(obj.event === 'udpate'){
        //     layer.prompt({title: '重置密码', formType: 3}, function(pass, index){
        //         basesubmit(path+'emp/editEmp',{pwd:pass,roleid:data.uuid});
        //         layer.close(index); //再执行关闭，强制关闭弹窗
        //         table.reload("roleTable",{});
        //     });
        // }
    });
});