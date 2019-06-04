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
    <
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Title</title>
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/css/font-awesome.min.css"/>
    <style type="text/css">
        .header{
            background-image: url("<%=basePath%>/static/img/color.jpeg");
            background-size: 100%;
            height: 240px;
        }
    </style>
</head>
<body>
<div class="header">
    <div style="margin: 0 45% 0 45%;padding-top: 5%;text-align: center">
        <div style="height: 39px;width: 167px;background: black;text-align: center">
            <h3 style="font-family: Menlo;color: white;padding-top: 6px"><strong>DSCaminSAMA</strong></h3>
        </div>
        <h4 style="margin-top: 45px">
            &nbsp;
            <span style="font-size: 20px;" class="fa fa-github fa-fw"></span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="font-size: 20px;" class="fa fa-home fa-fw"></span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="font-size: 20px;" class="fa fa-linkedin fa-fw"></span>
            <br/>
            <label><a href="https://github.com/DSCaminSAMA">GitHub</a></label>
            &nbsp;&nbsp;&nbsp;
            <label><a href="">Blog</a></label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <label><a href="">微博</a></label>
        </h4>
    </div>
</div>

<div class="container">
    <div class="text-center">
        <br/>
        <br/>
        <br/>
        <br/>
        <h1 style="color: #009688;">错误信息</h1>
        <hr/>

        <h3 style="color: #FF5722">${message}</h3>
        <br/>
        <br/>
        <button class="btn btn-primary btn-lg" type="button">
            <a href="<%=basePath%>/admin/index.do" style="text-decoration: none;color: white;">
                点我返回登录页面
            </a>
        </button>
    </div>
</div>
</body>
</html>
