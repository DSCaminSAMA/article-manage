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
<div class="container" style="width: 95%;">
    <br/>
    <br/>
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 170px;border-bottom: none;"><strong>回收站信息列表</strong></legend>
    </fieldset>
    <br/>
    <br/>
    <h5 style="margin-top: -20px;">
        <i class="fa fa-paper-plane-o fa-fw" style="color: #299A74"></i>
        <span style="color: #299A74;"><strong>已经删除的文章信息列表</strong></span>
    </h5>
    <hr/>
    <div class="layui-inline">
        <button type="button" id="cleanBtnMore" class="layui-btn layui-btn-danger">批量删除</button>
        <a href=""><button type="button" id="addBtn" class="layui-btn layui-btn">添加文章</button></a>
    </div>
    <br/>
    <br/>
    <div class="table-responsive">
        <table class="table table-striped table-hover" id="countTable">
            <thead>
            <tr>
                <th style="text-align: center"><input type="checkbox" id="all"></th>
                <th style="text-align: center;">文章编号</th>
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
                    <td><input name="r_id" value="" type="checkbox"/></td>
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
                        <button type="button" onclick="" class="layui-btn layui-btn-sm layui-btn-normal">恢复</button>
                        <button type="button" onclick="" class="layui-btn layui-btn-sm layui-btn-danger">删除</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <form class="listForm" name="listForm" method="post" action="">
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
</body>
</html>
