<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <input type="hidden" id="absolutePath" value="${pageContext.request.contextPath }/"/>
    <%@include file="/common/head.jsp"%>
    <link rel="stylesheet" type="text/css" href="${ctx}/js/zTree/css/zTreeStyle/zTreeStyle.css">
    <script type="text/javascript" src="${ctx}/js/zTree/jquery.ztree.all.min.js"></script>
    <title>zTree</title>
</head>
<body>
<div id="zTr" style="margin-left: 60px">
    <ul id="authTree" class="zTree"></ul>
</div>
</body>
<script type="text/javascript" src="${ctx}/js/sys/role.js"></script>
</html>
