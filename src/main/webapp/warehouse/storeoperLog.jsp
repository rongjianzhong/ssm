<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <input type="hidden" id="absolutePath" value="${pageContext.request.contextPath }/"/>
    <title>库存变动记录</title>
    <%@include file="/common/head.jsp"%>
    <title>库存查询</title>
    <script src="${ctx}/js/warehouse/storeoperLog.js"></script>
</head>

<body>
    <label>员工</label>
    <div class="layui-input-inline" style="width: 150px;">
        <form class="layui-form">
            <select id="empuuid" name="empuuid" style="height: 40px">
                <option value="">请选择员工</option>
            </select>
        </form>
    </div>&nbsp;&nbsp;
    <label>仓库</label>
    <div class="layui-input-inline" style="width: 150px;">
        <form class="layui-form">
            <select id="depuuid" name="depuuid" style="height: 40px">
                <option value="">请选择仓库</option>
            </select>
        </form>
    </div>&nbsp;&nbsp;
    <label>商品</label>
    <div class="layui-input-inline" style="width: 150px;">
        <form class="layui-form">
            <select id="name" name="name" style="height: 40px">
                <option value="">请选择商品</option>
            </select>
        </form>
    </div>&nbsp;&nbsp;
    <label>类型</label>
    <div class="layui-input-inline" style="width: 150px;">
        <form class="layui-form">
            <select id="type" name="type" style="height: 40px">
                <option value="">请选择类型</option>
                <option value="1">入库</option>
                <option value="2">出库</option>
                <option value="3">退货入库</option>
            </select>
        </form>
    </div>&nbsp;&nbsp;
    <label>操作日期</label>
    <div class="layui-input-inline " style="width: 150px">
        <input type="text" name="ks" id="ks" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
    </div>
    <label>至</label>
    <div class="layui-input-inline" style="width: 150px">
        <input type="text" name="js" id="js" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
    </div>&nbsp;&nbsp;
    <a class="layui-btn layui-icon " id="search_btn" data-type="reload">&nbsp;搜索</a>

    <table class="layui-hide" id="test" lay-filter="test"></table>
</body>
</html>
