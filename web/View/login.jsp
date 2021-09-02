<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/17
  Time: 12:54
  To change this template use File | Settings | File Templates.
--%>
<style>
    .heading{
        display: block;
        font-size: 35px;
        font-weight: 700;
        padding: 35px 0;
        border-bottom: 1px solid #f0f0f0;
        margin-bottom: 30px;
    }
</style>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>登录页面</title>
    <jsp:include page="../common/header.jsp"></jsp:include>
  </head>
  <body>
  <div class="container">
    <div class="row">
      <div class="col-md-offset-3 col-md-6">
        <form class="form-horizontal" action="/login" method="post">
          <span style="display: block;font-size: 35px;font-weight: 700; color:#337ab7 ;padding: 150px 180px 0;
 border-bottom: #337ab7; margin-bottom: 30px;">用户登录</span>
          <span style="color: #b92c28"><p>${msg}</p></span>
            <div class="form-group">
    <input type="text" name="admin" class="form-control" placeholder="学号或者工号"><br>
          </div>
          <div class="form-group help">
            <input type="password" name="password"class="form-control" placeholder="密码">
          </div>
          <div class="form-group">
   <select name="type" class="col-lg-2">
      <option value="student" selected="selected">学生</option>
      <option value="teacher">教师</option>
      <option value="admin">管理员</option>
    </select>
          </div>
          <div class="form-group">
              <button type="reset" class="col-md-offset-2 btn btn-info col-md-3">重置</button>
              <button type="submit" class="col-md-offset-3 btn btn-info col-md-3">登录</button>
            </div>
    </form>
      </div>
    </div>
  </div>
  </body>
</html>
