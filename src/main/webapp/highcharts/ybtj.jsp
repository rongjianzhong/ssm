<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/common/head.jsp"%>
    <script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
    <script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
    <script src="https://img.hcharts.cn/highcharts/modules/oldie.js"></script>
    <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
    <script src="https://img.hcharts.cn/highcharts/themes/dark-unica.js"></script>
    <style>
        .layui-form layui-border-box layui-table-view{
            float: left;
            width: 300px;
        }
        #container{
            float: right;
            margin-top: -553px;
            margin-right: 9px;
        }
    </style>
</head>
<body>
<form>
    <label>年份</label>
    <div class="layui-input-inline " style="width: 150px">
        <input type="text" name="ks" id="ks" lay-verify="date" placeholder="yyyy" autocomplete="off" class="layui-input">
    </div>
</form>
<table class="layui-hide" id="test" lay-filter="test"></table>
<div id="container" style="min-width:825px;height:543px"></div>
<script>
    layui.use(['table','layer','form','laydate'], function() {
        var table = layui.table,
            layer = layui.layer,
            form = layui.form,
            laydate = layui.laydate;
        $ = layui.jquery
        var path = $('#absolutePath').val();
        var ks = $("#ks").val();
        laydate.render({
            elem: '#ks'
            ,type: 'year'
            ,done:function (value, date, endDate) {
                table.reload('ordersTablesss', {
                    url: 'order/querybgtj'
                    ,where: {
                        ks:value
                    }
                });
                $(function(){
                    $.ajax({
                        url:'order/queryybtj',
                        data:{ks:value},
                        dataType:'json',
                        type:'post',
                        async:false,
                        success:function(data){
                            var chart = Highcharts.chart('container', {
                                chart: {
                                    type: 'line'
                                },
                                title: {
                                    text: '总销售额'
                                },
                                subtitle: {
                                    text: '数据来源: WorldClimate.com'
                                },
                                xAxis: {
                                    categories: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月']
                                },
                                yAxis: {
                                    title: {
                                        text: ' 金额(元)'
                                    }
                                },
                                plotOptions: {
                                    line: {
                                        dataLabels: {
                                            // 开启数据标签
                                            enabled: true
                                        },
                                        // 关闭鼠标跟踪，对应的提示框、点击事件会失效
                                        enableMouseTracking: false
                                    }
                                },
                                series: [ {
                                    name: data.name,
                                    data: data.data
                                }],
                            });
                        }
                    });
                });
            }
        });
        table.render({
            elem: '#test',
            width:300,
            data:[]
            , cellMinWidth: 20 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , toolbar: '#toolbarDemo'
            , title: '商品类型'
            , id: "ordersTablesss"
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'month', title: '月份', align: 'center'}
                , {field: 'money', title: '销售额', align: 'center'}
            ]]
        });
    })
</script>
</body>
</html>
