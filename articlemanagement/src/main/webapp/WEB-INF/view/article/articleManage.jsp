<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/2
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
</head>
<body>
<div class="container" style="width: 90%;">
    <br/>
    <br/>
        <fieldset class="layui-elem-field layui-field-title">
            <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 170px;border-bottom: none;"><strong>文章信息列表</strong></legend>
        </fieldset>
        <br/>
        <h5 style="margin-top: -20px;">
            <i class="fa fa-paper-plane-o fa-fw" style="color: #299A74"></i>
            <span style="color: #299A74;"><strong>输入查询信息</strong></span>
        </h5>
        <hr style="margin-top: 0;"/>
        <div class="form table">
            <div>
                <form class="layui-form form-inline" action="<%=basePath%>/article/findByPage.do" role="form" method="post">
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="margin-left: -10px;padding-left:0;"><strong>文章作者</strong></label>
                        <div class="layui-input-inline">
                            <input name="a_name" placeholder="请输入文章作者姓名查询" class="layui-input" type="text">
                        </div>
                        <label class="layui-form-label" style="width:8%;"><strong>审核状态</strong></label>
                        <div class="layui-input-inline" style="width: 100px;">
                            <select name="r_verify">
                                <option></option>
                                <option>已审核</option>
                                <option>未审核</option>
                            </select>
                        </div>
                        <label class="layui-form-label" style="width:8%;"><strong>发布状态</strong></label>
                        <div class="layui-input-inline" style="width: 100px;">
                            <select name="r_publish">
                                <option></option>
                                <option>已发布</option>
                                <option>未发布</option>
                            </select>
                        </div>
                        <label class="layui-form-label" style="width:8%;"><strong>存在状态</strong></label>
                        <div class="layui-input-inline" style="width: 100px;">
                            <select name="r_status">
                                <option></option>
                                <option>存在</option>
                                <option>已删除</option>
                            </select>
                        </div>
                        <div class="layui-input-inline" style="margin-left: 50px;">
                            <button class="layui-btn" type="submit">查询</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    <h5>
        <i class="fa fa-paper-plane-o fa-fw" style="color: #299A74"></i>
        <span style="color: #299A74;"><strong>查询结果展示</strong></span>
    </h5>
    <hr style="margin-top: 0;"/>
        <div class="layui-inline">
            <button type="button" id="cleanBtnMore" class="layui-btn layui-btn-danger">批量删除</button>
            <a href="<%=basePath%>/article/toArticleWrite.do"><button type="button" id="addBtn" class="layui-btn layui-btn">添加文章</button></a>
        </div>
    <br/>
    <br/>
    <div class="table-responsive">
        <table class="table table-striped table-hover" id="countTable">
            <thead>
            <tr>
                <th style="text-align: center"><input type="checkbox" id="all"/></th>
                <th style="text-align:center;">文章编号</th>
                <th style="text-align: center">文章简介</th>
                <th style="text-align: center">文章作者</th>
                <th style="text-align: center">发表日期</th>

                    <th style="text-align: center">审核状态</th>
                    <th style="text-align: center">发布状态</th>
                    <th style="text-align: center">存在状态</th>
                    <th style="text-align: center;">操作</th>
            </tr>
            </thead>
            <tbody style="text-align: center">
                <tr>
                    <td><input name="r_id" value="${article.r_id}" type="checkbox"/></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                        <td>

                                <label style="color: #FF5722">未审核</label>

                        </td>
                        <td>
                        </td>
                        <td>
                                <label style="color: #FF5722">已删除</label>
                        </td>
                        <td>
                            <a href="<%=basePath%>/article/toArticleView.do?r_id=${article.r_id}"><button type="button" class="layui-btn layui-btn-sm">查看</button>
                                <a href="<%=basePath%>/article/toEditPage.do?r_id=${article.r_id}"><button type="button" class="layui-btn layui-btn-sm layui-btn-normal">编辑</button></a>
                                <button type="button" onclick="return clean(${article.r_id});" class="layui-btn layui-btn-sm layui-btn-danger">删除</button>
                        </td>
                        <td>
                            <a href="<%=basePath%>/article/toArticleView.do?r_id=${article.r_id}"><button type="button" class="layui-btn layui-btn-sm">查看文章</button>
                        </td>
                </tr>
            </tbody>
        </table>
    </div>

    <form class="listForm" name="listForm" method="post" action="<%=basePath%>/article/findByPage.do">
        <div class="row">
            <div class="form-inline" style="margin-left: 15px;">
                <label style="font-size:14px;margin-top:22px;">
                    <strong>共<b></b>条记录，共<b></b>页</strong>
                    &nbsp;
                    &nbsp;
                    <strong>每页显示</strong>
                    <select class="form-control" name="pageSize">
                        <option value="2">2
                        </option>
                        <option value="3">3
                        </option>
                        <option value="4">4
                        </option>
                        <option value="5">5
                        </option>
                    </select>
                    <strong>条</strong>
                    &nbsp;
                    &nbsp;
                    <strong>到第</strong>&nbsp;<input type="text" size="3" id="page" name="pageCode"
                                                    class="form-control input-sm"
                                                    style="width:11%"/>&nbsp;<strong>页</strong>
                    &nbsp;
                    <button type="submit" class="btn btn-sm btn-info">GO!</button>
                </label>
                <ul class="pagination" style="float:right;">
                    <li>
                        <a href=""><strong>首页</strong></a>
                    </li>
                    <li>
                            <a href="">&laquo;</a>
                    </li>

                    <!-- 写关于分页页码的逻辑 -->


                    <!-- 显示页码 -->


                    <li>
                            <a href="">&raquo;</a>
                    </li>
                    <li>
                        <a href=""><strong>末页</strong></a>
                    </li>
                </ul>
            </div>
        </div>
    </form>
</div>
</body>
</html>
