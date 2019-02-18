layui.use(['table','layer','form'], function(){
    var table = layui.table,
        layer = layui.layer,
        form = layui.form,
        $ = layui.jquery
    var path = $('#absolutePath').val();//路径
    table.render({
        elem: '#supplier'
        ,url:path+'supplier/querySupplier?type=供应商'
        ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        ,toolbar: '#toolbarDemo'
        ,title: '供应商'
        ,id:"supplierTablea"
        ,cols: [[
            {type: 'checkbox', fixed: 'left'}
            ,{field:'uuid', title:'编号', sort: true,align: 'center'}
            ,{field:'name', title:'名称',align: 'center'}
            ,{field:'address', title:'地址',align: 'center'}
            ,{field:'contact', title:'联系人',align: 'center'}
            ,{field:'tele', title:'电话',align: 'center'}
            ,{field:'email', title:'EMAIL',align: 'center'}
            ,{field:'createdate', title:'创建时间',align: 'center'}
            ,{fixed: 'right', title:'操作', toolbar: '#barDemo', align: 'center'}

        ]]
        ,page: true
    });

    //头工具栏事件
    table.on('toolbar(supplier)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id);
        switch(obj.event){
            case 'addsupplier':
                layer.open({
                    type: 2,
                    title: '增加供应商',
                    shadeClose: true,
                    shade: 0.8,
                    btn:['增加', '取消'],
                    area: ['52%', '65%'],
                    content:path+'basicInfo/addSupplier.jsp', //iframe的url
                    yes:function(index, layero){
                        var body = layer.getChildFrame('body', index);
                        basesubmit(path+'supplier/addSupplier?type=供应商',body.find("#addsupplier").serialize());
                        layer.close(index); //再执行关闭，强制关闭弹窗
                        table.reload("supplierTablea",{});
                    }
                });
                break;
        };
    });


    //查询
    $("#searchsupplier_btn").on("click", function () {
        var name = $("#name").val();
        var address = $("#address").val();
        var contact = $("#contact").val();
        var  tele = $("#tele").val();
        var email = $("#email").val();
        table.reload("supplierTablea", {
            method: 'post',
            where: {
                name: name,//搜索的关键字
                contact: contact,
                address: address,
                tele:tele,
                email:email,
            }
        })
        //清空文本框的值
        $("#name").val('');
        $("#address").val('');
        $("#contact").val('');
        $("#tele").val('');
        $("#email").val('');

    })

    //监听行工具事件
    table.on('tool(supplier)', function(obj){
        var data = obj.data;
        if(obj.event === 'delsupplier'){
            layer.confirm('真的删除行么', function(index){
                basesubmit(path+'supplier/delSupplier', { uuid: data.uuid ,type:'供应商'});
                layer.close(index);
                table.reload("supplierTablea",{});
            });
        } else if(obj.event === 'editsupplier'){
            layer.open({
                type: 2,
                title: '修改供应商',
                shadeClose: true,
                scrollbar:true,
                shade: 0.5,
                area: ['35%', '50%'],
                btn:['修改', '取消'],
                content:path+'basicInfo/addSupplier.jsp', //iframe的url
                success: function (layero, index) {
                    var body = layui.layer.getChildFrame('body', index);
                    $.each(data, function(i, val) {
                        body.find("#"+i).val(val);
                    });
                    form.render();
                },
                yes:function(index,b){
                    var body = layer.getChildFrame('body', index);
                    basesubmit(path+'supplier/editSupplier?type=供应商',body.find("#addsupplier").serialize());
                    layer.close(index); //再执行关闭，强制关闭弹窗
                    table.reload("supplierTablea",{});
                }
            });
        }
    });


});