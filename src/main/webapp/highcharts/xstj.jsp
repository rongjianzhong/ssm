<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"><link rel="icon" href="https://static.jianshukeji.com/highcharts/images/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        /* css 代码  */
    </style>
    <%@include file="/common/head.jsp"%>
    <script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
    <script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
    <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
    <script src="https://img.hcharts.cn/highcharts/themes/dark-unica.js"></script>
    <style>
        #container{
            float: right;
            margin-top: -253px;
            margin-right: 50px;
        }
    </style>
</head>
<body>
<form>
    <label>开始日期</label>
    <div class="layui-input-inline " style="width: 150px">
        <input type="text" name="ks" id="ks" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
    </div>
    <label>至</label>
    <div class="layui-input-inline" style="width: 150px">
        <input type="text" name="js" id="js" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
    </div>
</form>
<table class="layui-hide" id="test" lay-filter="test"></table>
<div id="container" style="min-width:800px;height:530px"></div>
<script>
    layui.use(['table','layer','form','laydate'], function() {
        var table = layui.table,
            layer = layui.layer,
            form = layui.form,
            laydate = layui.laydate;
        $ = layui.jquery
        var path = $('#absolutePath').val();
        laydate.render({
            elem: '#ks'
            ,type: 'datetime'
        });
        laydate.render({
            elem: '#js'
            ,type: 'datetime'
        });
        $.ajax({
            url: 'order/queryxstj',
            data: {},
            dataType: 'json',
            type: 'post',
            async: false,
            success: function (data) {
                table.render({
                    elem: '#test',
                    width:300,
                    data:data.data
                    , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    , toolbar: '#toolbarDemo'
                    , title: '商品类型'
                    , id: "ordersTable"
                    , cols: [[
                        {type: 'checkbox', fixed: 'left'}
                        , {field: 'name', title: '商品类型', align: 'center'}
                        , {field: 'totalmoney', title: '销售额', align: 'center'}
                    ]]
                });

                Highcharts.chart('container', {
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie'
                    },
                    title: {
                        text: '销售统计图'
                    },
                    tooltip: {
                        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: true,
                                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                                style: {
                                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                }
                            }
                        }
                    },
                    series: [{
                        name: '销售占比',
                        colorByPoint: true,
                        data: data.ljga
                    }]
                });

            }
        })


    })



</script>
</body>
</html>
