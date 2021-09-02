<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/19
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <li><a id="adm_update" href="#" role="button"  style="color:black" onmouseover="$(this).css('background','#fff')"
                   onmouseleave="$(this).css('background','#31b0d5')"><h4>修改密码</h4></a></li>
            <li><a id="adm_replace" href="/admin_replace_stu" role="button"  style="color:black;" onmouseover="$(this).css('background','#fff')"
                   onmouseleave="$(this).css('background','#31b0d5')"><h4>代替学生打卡</h4></a></li>
            <li><a id="submit" href="#" role="button"  style="color:black;" onmouseover="$(this).css('background','#fff')"
                   onmouseleave="$(this).css('background','#31b0d5')"><h4>提交打卡信息</h4></a></li>
            <li><a id="grant" href="/admin_replace_stu" role="button"  style="color:black;" onmouseover="$(this).css('background','#fff')"
                   onmouseleave="$(this).css('background','#31b0d5')"><h4>赋予权限</h4></a></li>
            <li><a id="cancellation" href="#" role="button"  style="color:black;" onmouseover="$(this).css('background','#fff')"
                   onmouseleave="$(this).css('background','#31b0d5')"><h4>注销</h4></a></li>
        </ul>
    </div>
</nav>
