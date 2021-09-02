<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/18
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
   <jsp:include page="../common/header.jsp"></jsp:include>
    <title>主功能界面</title>
</head>
<body>
<%--菜单栏--%>
<jsp:include page="../common/tea_meun.jsp"></jsp:include>
<%--详细打卡信息--%>
<jsp:include page="../modal-dialog/Teacher/detailed%20message.jsp"></jsp:include>
<%--打卡--%>
<jsp:include page="../modal-dialog/Teacher/check.jsp"></jsp:include>
<%--更新个人信息--%><%--赋予权限--%>
<jsp:include page="../modal-dialog/Teacher/update.jsp"></jsp:include>
<%--查看学生今天的打卡情况--%>
<%--//显示打卡信息表格--%>
<div class="row">
    <h4 align="center">个人打卡信息</h4>
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
<jsp:include page="../JavaScript/Teacher/information.jsp"></jsp:include>
<jsp:include page="../common/cancellation.jsp"></jsp:include>
</body>
</html>
