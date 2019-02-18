var zTreeObj;
var path = $('#absolutePath').val();//路径
$(function(){
    initzTree();
    a();
});
//  初始化权限zTree
function initzTree(){
    var setting={
        check:{ enable: true //每个节点上是否显示 CheckBox
            },
        data: {simpleData: {//简单数据模式
                enable:true,
            }
        }
    };
    $.ajax({
        url:path+'Module/zTree',
        dataType:'json',
        type:'post',
        //是否异步
        async:false,
        success:function(data){
            zTreeObj=$.fn.zTree.init($('#authTree'),setting,data);
        }
    });
}
function a(){
    var zTreeData = JSON.parse(sessionStorage.getItem("zTreeData"))//获取角色id
    if(null!=zTreeData){
        for(var i = 0; i<zTreeData.length;i++){
            // console.log(zTreeData[i].perid);
            //根据id属性的值获取zTree中对应的TreeNode节点
            var node = zTreeObj.getNodeByParam("id",zTreeData[i].perid);
            //设置该TreeNode节点为选中状态
            zTreeObj.checkNode(node, true, false);
        }
    }
}
//layui
layui.use(['table','layer','form'], function(){
    var table = layui.table,
        layer = layui.layer,
        form = layui.form,
        $ = layui.jquery
    var path = $('#absolutePath').val();//路径
    table.render({
        elem: '#test'
        ,url:path+'sysRole/querySysRole'
        ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        ,toolbar: '#toolbarDemo'
        ,title: '角色权限列表'
        ,id:"roleTable"
        ,cols: [[
            {type: 'checkbox', fixed: 'left'}
            ,{field:'roleid', title:'编号', sort: true,align: 'center'}
            ,{field:'rolename', title:'名称',align: 'center'}
            ,{fixed: 'right', title:'操作', toolbar: '#barDemo', align: 'center'}
        ]]
        ,page: true
    });

    //头工具栏事件
    table.on('toolbar(test)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id);
        switch(obj.event){
            case 'add':
                layer.prompt({title: '增加角色', formType: 3}, function(pass, index){
                    basesubmit(path+'sysRole/addSysRole',{rolename:pass});
                    layer.close(index); //再执行关闭，强制关闭弹窗
                    table.reload("roleTable",{});
                });

        };
    });

//监听行工具事件
    table.on('tool(test)', function(obj){
        var data = obj.data;
        if(obj.event === 'del'){
            layer.confirm('真的删除行么', function(index){
                basesubmit(path+'sysRole/delSysRole', { roleid: data.roleid });
                layer.close(index);
                table.reload("roleTable",{});
            });
        } else if(obj.event === 'edit'){
            layer.prompt({value:data.rolename,title: '修改角色', formType: 3}, function(pass, index){
                basesubmit(path+'sysRole/editSysRole',{rolename:pass,roleid:data.roleid});
                layer.close(index); //再执行关闭，强制关闭弹窗
                table.reload("roleTable",{});
            });
        }
        //授权
        else if(obj.event === 'accredit'){
            sessionStorage.setItem("rid",data.roleid);
            $.ajax({
                url:path+'sysRole/queryRolePermission',
                data:{'roleid':data.roleid},
                dataType:'json',
                type:'post',
                //是否异步
                async:false,
                success:function(data){
                    sessionStorage.setItem("zTreeData",JSON.stringify(data));
                }
            });
            layer.open({
                type: 2,
                title: '商品分类',
                shadeClose: true,
                shade: 0.8,
                area: ['40%', '80%'],
                btn:['确认', '取消'],
                content:path+'sys/accredit.jsp', //iframe的url
                yes:function(index, layero){
                    window[layero.find('iframe')[0]['name']].mya()
                }
            });
        }
    });
});

function mya () {
    var rid = sessionStorage.getItem("rid");//获取角色id
    var nodes = zTreeObj.getCheckedNodes();
    if(nodes.length>0) {
        var moduleid = "";
        for (var i = 0; i < nodes.length; i++) {
            moduleid += nodes[i].id + ",";
        }
        moduleid = moduleid.substring(0, moduleid.length - 1);
        $.ajax({
            url:path+'sysRole/saveRole',
            data:{'roleid':rid,'ids':moduleid},
            dataType:'json',
            type:'post',
            //是否异步
            async:false,
            success:function(data){
                if(data.flg){
                    layer.msg('保存权限信息成功,请重新登录!');
                    var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
                    parent.layer.close(index);
                }
                else{
                    layer.msg('消息','网络异常,请重试');
                }
            }
        });
    }
}
