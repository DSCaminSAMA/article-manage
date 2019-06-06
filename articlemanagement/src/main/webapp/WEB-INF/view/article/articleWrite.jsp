<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/2
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date date = new Date();
    String nowDate = sdf.format(date);
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/editormd/editormd.min.css"/>
</head>
<body>
<div class="container" style="width:80%;">
    <div style="margin-top: 60px;">
        <fieldset class="layui-elem-field layui-field-title">
            <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 100px;border-bottom: none;"><strong>文章撰写</strong>
            </legend>
        </fieldset>
    </div>
    <br/>
    <!-- 编辑器的表单 -->
    <div class="layui-form">
        <form action="<%=basePath%>/" method="post">
            <div class="layui-inline" style="margin-left: -10px;">
                <label class="layui-form-label" style="padding-left: 0;"><strong>文章作者</strong></label>
                <div class="layui-input-inline" style="margin-left:-255px;">
                    <input type="text" name="r_author" id="r_author" value="${sessionScope.name}" class="layui-input"/>
                </div>
                <label class="layui-form-label" style="margin-left:169px;padding-left: 0;"><strong>发布日期</strong></label>
                <div class="layui-input-inline" style="margin-left: 88px;">
                    <input type="text" name="r_date" id="r_date" value="<%=nowDate%>" class="layui-input" readonly="readonly"/>
                </div>
            </div>
            <hr style="margin-top: 0;"/>
            <div class="layui-inline" style="margin-left: -10px;padding-left: 0;">
                <label class="layui-form-label" style="padding-left: 0;"><strong>文章简介</strong></label>
                <div class="layui-input-inline" style="margin-left: -6px;width: 275px;">
                    <input type="text" name="r_summary" id="r_summary" placeholder="请用简短的文字介绍一下你的文章吧！" class="layui-input"/>
                </div>
            </div>
            <br/>
            <br/>
            <label><strong>文章内容</strong></label>
            <!-- 添加Markdown的容器 -->
            <div id="editormd">
                <textarea class="editormd-markdown-textarea" name="editormd-markdown-doc"></textarea>
                <textarea class="editormd-html-textarea" name="editormd-html-code"></textarea>
            </div>
            <div class="layui-inline" style="margin-top: 20px;">
                <button type="button" id="verifyBtn" class="layui-btn">存入草稿箱</button>
                <button type="button" id="publishBtn" class="layui-btn">发布</button>
                <button type="button" id="cleanBtn" class="layui-btn">清空</button>
            </div>
        </form>
    </div>
    <br/>
    <br/>
    <br/>
</div>
</body>
</html>
