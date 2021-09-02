<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/18
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <title>主功能界面</title>
</head>
<body>
<%--功能--%>
<jsp:include page="../common/stu_meun.jsp"></jsp:include>
<%--打卡模态框--%>
<jsp:include page="../modal-dialog/Student/check%20in.jsp"></jsp:include>
<%--编辑--%>
<jsp:include page="../modal-dialog/Student/edit.jsp"></jsp:include>
<%--详细信息--%>
<jsp:include page="../modal-dialog/Student/detailed%20message.jsp"></jsp:include>
<%--代替打卡--%>
<jsp:include page="../modal-dialog/Student/stu_replace.jsp"></jsp:include>
<%--更新个人信息--%>
<jsp:include page="../modal-dialog/Student/update_person.jsp"></jsp:include>
<%--//显示打卡信息表格--%>
<div class="row">
    <h4 align="center">历史打卡信息</h4>
    <div class="col-md-12">
        <table class="table table-hover" id="information">
            <thead>
            <tr>
                <th>#</th>
                <th>学号</th>
                <th>日期</th>
                <th>国籍</th>
                <th>户籍所在身份</th>
                <th>假期是否留校</th>
                <th>本日是否留校</th>
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
<%--具体实现表格的异步刷新--%>
<jsp:include page="../JavaScript/Student/information.jsp"></jsp:include>
<%--注销--%>
<jsp:include page="../common/cancellation.jsp"></jsp:include>
</body>
</html>
