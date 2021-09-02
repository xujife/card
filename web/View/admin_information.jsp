<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/6/6
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
pageEncoding="UTF-8" %>
<html>
<head>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-default" role="navigation" style="background:#31b0d5">
    <div class="navbar-header col-md-offset-1">
        <h4 class="navbar-brand" style="text-align: center;color: black">管理员功能界面</h4>
    </div>
    <div class="collapse navbar-collapse col-md-offset-4" id="menu">
        <ul class="nav navbar-nav ">
            <li><a id="adm_function" href="admin_Function" role="button" style="color:black" onmouseover="$(this).css('background','#fff')"
                   onmouseleave="$(this).css('background','#31b0d5')"><h4>首页</h4></a></li>
            <li><a id="teacher" href="admin_information" role="button"  style="color:black;" onmouseover="$(this).css('background','#fff')"
                   onmouseleave="$(this).css('background','#31b0d5')"><h4>教师打卡信息</h4></a></li>
            <li><a id="tea" href="/admin_replace_stu" role="button"  style="color:black;" onmouseover="$(this).css('background','#fff')"
                   onmouseleave="$(this).css('background','#31b0d5')"><h4>代替学生打卡</h4></a></li>
            <li><a id="cancellation" href="#" role="button"  style="color:black;" onmouseover="$(this).css('background','#fff')"
                   onmouseleave="$(this).css('background','#31b0d5')"><h4>注销</h4></a></li>
        </ul>
    </div>
</nav>
<div class="row">
    <h4 align="center">所有教师今天的打卡信息</h4>
    <%--<div class="col-md-offset-3">应打卡人数：<span class="should"></span>实际打卡人数:<span class="actual"></span></div>--%>
    <div class="col-md-12">
        <table class="table table-hover" id="information">
            <thead>
            <tr>
                <th>#</th>
                <th>工号</th>
                <th>日期</th>
                <th>教职工身份</th>
                <th>假期是否留校</th>
                <th>当前所在国家</th>
                <th>当前所在地</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
    <%--  显示分页信息--%>
    <div class="row">
        <div class="col-md-6" id="page"></div>
        <div class="col-md-6" id="page_nav"></div>
    </div>
</div>
<jsp:include page="../JavaScript/Admin/teacher_information.jsp"></jsp:include>
</body>
<%--注销--%>
<jsp:include page="../common/cancellation.jsp"></jsp:include>
</html>
