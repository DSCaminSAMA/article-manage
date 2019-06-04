<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/2
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2>${message}</h2>
</div>
</body>
</html>
