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
<jsp:include page="../common/admin_meun.jsp"></jsp:include>
<%--详细信息--%>
<jsp:include page="../modal-dialog/Admin/message.jsp"></jsp:include>
<%--查询--%>
<jsp:include page="../JavaScript/Admin/Search.jsp"></jsp:include>
<%--修改密码--%>
<jsp:include page="../modal-dialog/Admin/update.jsp"></jsp:include>
<%--学生显示打卡信息表格--%>
<div class="row">
    <h4 align="center">所有学生今天的打卡信息</h4>
   <%-- <div class="col-md-offset-3">应打卡人数：<span class="should"></span>实际打卡人数:<span class="actual"></span></div>--%>
    <div class="col-md-12">
        <div class="col-md-offset-2">
            <form id="check">
            <span>学号:<input type="text" name="sno"></span>
                <span>国籍:<select name="nationality">
                    <option></option>
                    <option value="中国">中国</option>
                    <option value="美国">美国</option>
                    <option value="英国">英国</option>
                    <option value="法国">法国</option>
                </select></span>
            <span>户口所在地:<select name="location">
                 <option></option>
                <option value="肇庆">肇庆</option>
                <option value="揭阳">揭阳</option>
                <option value="广州">广州</option>
                <option value="汕头">汕头</option>
                <option value="佛山">佛山</option>
                <option value="东莞">东莞</option>
                <option value="茂名">茂名</option>
                <option value="普宁">普宁</option>
            </select></span>
               <span>假期是否留校:<select name="vacationschool">
                    <option></option>
                    <option value="是">是</option>
                    <option value="否">否</option>
               </select></span>
                <span>本日是否留校:<select name="dayschool">
                    <option></option>
                    <option value="是">是</option>
                    <option value="否">否</option>
                </select></span>
                <span>健康情况:<select name="health">
                    <option></option>
                    <option value="健康">健康</option>
                    <option value="发烧">发烧</option>
                    <option value="感冒">感冒</option>
                    <option value="咳嗽">咳嗽</option>
                </select></span>
                <span><a href="#" class="btn-info search btn">查询</a></span>
            </form>
        </div>
        <table class="table table-hover" id="information">
            <thead id="stu">
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
<jsp:include page="../JavaScript/Admin/information.jsp"></jsp:include>
<%--注销--%>
<jsp:include page="../common/cancellation.jsp"></jsp:include>
</body>
<script>
    $(document).on("click","#submit",function () {
            if(confirm("确定提交今天已经打卡的信息？"))
            {
                var date=new Date().toLocaleDateString('chinese', {hour12: false}).split('/').join('-');
                //设置不可更改
                $.ajax({
                    url:"/students_informations/"+date,
                    type:"POST",
                    data:"_method=PUT",
                    success:function () {
                        alert("提交成功！");
                    }
                });
            }
    });
</script>
</html>
