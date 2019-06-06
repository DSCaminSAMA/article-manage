<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/2
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
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
    <br/>
    <br/>
    <!-- 文章标题概要 -->
    <h3><center>『』</center></h3>
    <br/>
    <!-- 添加Markdown的容器 -->
    <div id="content">
        <textarea></textarea>
    </div>
    <hr style="height: 3px;border: none;background-color: #ddd;background-image: repeating-linear-gradient(-45deg, #fff, #fff 4px, transparent 4px, transparent 8px);"/>
    <div style="border-left: 3px solid #f44336;">
        <br/>
        <div style="margin-bottom:8px;">
            &nbsp;&nbsp;&nbsp;&nbsp;<strong style="font-size:18px;">本文作者：&nbsp;&nbsp;</strong>
            <span style="font-size:16px;">${article.r_author}</span>
        </div>
        <div style="margin-bottom:8px;">
            &nbsp;&nbsp;&nbsp;&nbsp;<strong style="font-size:18px;">发表时间：&nbsp;&nbsp;</strong>
            <span style="font-size:16px;">${article.r_date}</span>
        </div>
        <div>
            &nbsp;&nbsp;&nbsp;&nbsp;<strong style="font-size:18px;">版权声明：&nbsp;&nbsp;</strong>
            <span style="font-size:16px;">本项目所有解释权归<strong>TyCoding</strong>所有</span>
        </div>
        <br/>
    </div>
    <br/>
    <br/>
    <br/>
    <div style="margin:0 4% 0 4%;">
        <br/>
        <!-- 留言的表单 -->
        <form class="layui-form" action="" method="post">
            <input name="lw_name" value="" hidden="hidden"/>
            <input name="lw_date" value="" hidden="hidden"/>
            <input name="lw_for_article_id" value="" hidden="hidden"/>
            <div class="layui-input-block" style="margin-left: 0;">
                <textarea id="lw_content" name="lw_content" placeholder="请输入你的留言" class="layui-textarea" style="height: 150px;"></textarea>
            </div>
            <br/>
            <div class="layui-input-block" style="text-align: left;margin-left: 0;">
                <input type="submit" class="layui-btn" value="留言">
            </div>
        </form>
        <br/>
        <!-- 留言信息列表展示 -->
        <div>
            <ul>
                <!-- 先遍历留言信息（一条留言信息，下面的全是回复信息） -->
                    <!-- 如果留言信息是在本文章下的才显示 -->
                        <li style="border-top: 1px dotted #01AAED">
                            <br/>
                            <div style="text-align: left;color:#444">
                                <div>
                                    <span style="color:#01AAED"></span>
                                </div>
                                <div></div>
                            </div>
                            <div>
                                <div class="comment-parent" style="text-align:left;margin-top:7px;color:#444">
                                    <span></span>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <p>
                                        <a href="javascript:;" style="text-decoration: none;" onclick="btnReplyClick(this)">回复</a>
                                    </p>
                                    <hr style="margin-top: 7px;"/>
                                </div>
                                <!-- 回复表单默认隐藏 -->
                                <div class="replycontainer layui-hide" style="margin-left: 61px;">
                                    <form action="<%=basePath%>/article/saveReply.do" method="post" class="layui-form">
                                        <input name="lr_for_article_id" id="lr_for_article_id" value="" hidden="hidden"/>
                                        <input name="lr_name" id="lr_name" value="" hidden="hidden"/>
                                        <input name="lr_date" id="lr_date" value="" hidden="hidden"/>
                                        <input name="lr_for_name" id="lr_for_name" value="" hidden="hidden"/>
                                        <input name="lr_for_words" id="lr_for_words" value="" hidden="hidden"/>
                                        <input name="lr_for_reply" id="lr_for_reply" value="" hidden="hidden"/>
                                        <div class="layui-form-item">
                                            <textarea name="lr_content" id="lr_content" lay-verify="replyContent" placeholder="请输入回复内容" class="layui-textarea" style="min-height:80px;"></textarea>
                                        </div>
                                        <div class="layui-form-item">
                                            <button id="replyBtn" class="layui-btn layui-btn-mini" lay-submit="formReply" lay-filter="formReply">提交</button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <!-- 以下是回复信息 -->
                                <!-- 每次遍历出来的留言下存在回复信息才展示（本条回复信息是本条留言下的就显示在当前留言下） -->
                                    <div style="text-align: left;margin-left:61px;color: #444">
                                        <div>
                                            <span style="color:#5FB878">&nbsp;&nbsp;</span>
                                        </div>
                                        <div>:&nbsp;&nbsp; </div>
                                    </div>
                                    <div>
                                        <div class="comment-parent" style="text-align:left;margin-top:7px;margin-left:61px;color:#444">
                                            <span></span>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <p>
                                                <a href="javascript:;" style="text-decoration: none;" onclick="btnReplyClick(this)">回复</a>
                                            </p>
                                            <hr style="margin-top: 7px;"/>
                                        </div>
                                        <!-- 回复表单默认隐藏 -->
                                        <div class="replycontainer layui-hide" style="margin-left: 61px;">
                                            <form action="" method="post" class="layui-form">
                                                <input name="lr_for_article_id" id="lr_for_article_id" value="" hidden="hidden"/>
                                                <input name="lr_name" id="lr_name" value="" hidden="hidden"/>
                                                <input name="lr_date" id="lr_date" value="" hidden="hidden"/>
                                                <input name="lr_for_name" id="lr_for_name" value="" hidden="hidden"/>
                                                <input name="lr_for_words" id="lr_for_words" value="" hidden="hidden"/>
                                                <input name="lr_for_reply" id="lr_for_reply" value="" hidden="hidden"/>
                                                <div class="layui-form-item">
                                                    <textarea name="lr_content" id="lr_content" lay-verify="replyContent" placeholder="请输入回复内容" class="layui-textarea" style="min-height:80px;">
                                                      :&nbsp;&nbsp;
                                                  </textarea>
                                                </div>
                                                <div class="layui-form-item">
                                                    <button id="replyBtn" class="layui-btn layui-btn-mini" lay-submit="formReply" lay-filter="formReply">提交</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                        </li>
            </ul>
        </div>
    </div>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
</div>
</body>
</html>
