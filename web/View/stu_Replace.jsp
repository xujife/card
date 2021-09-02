<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/26
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <%pageContext.setAttribute("App_Path",request.getContextPath());%>
    <title>代替他人打卡</title>
</head>
<body>
<nav class="navbar navbar-default" role="navigation" style="background:#31b0d5">
    <div class="navbar-header col-md-offset-1">
        <h4 class="navbar-brand" style="text-align: center;color: black">学生功能界面</h4>
    </div>
    <div class="collapse navbar-collapse col-md-offset-5" id="menu">
        <ul class="nav navbar-nav ">
            <li><a id="stu_function" href="student_Function" role="button" style="color:black" onmouseover="$(this).css('background','#fff')"
                   onmouseleave="$(this).css('background','#31b0d5')"><h4>首页</h4></a></li>
            <li><a id="stu_update" href="#" role="button"  style="color:black" onmouseover="$(this).css('background','#fff')"
                   onmouseleave="$(this).css('background','#31b0d5')"><h4>更新个人信息</h4></a></li>
            <li><a id="cancellation" href="#" role="button"  style="color:black;" onmouseover="$(this).css('background','#fff')"
                   onmouseleave="$(this).css('background','#31b0d5')"><h4>注销</h4></a></li>
        </ul>
    </div>
    <div class="collapse navbar-collapse">
        <a href="/login" class="nav navbar-nav " role="button" style="color:black" onmouseover="$(this).css('background','#fff')"
           onmouseleave="$(this).css('background','#31b0d5')"></a>
    </div>
</nav>
<%--打卡模态框--%>
<div class="modal fade make" tabindex="-1" role="dialog" id="clock in">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">打卡</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal in_update">
                    <div class="form-group">
                        <label for="update_sno" class="col-sm-2 control-label">学号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" readonly="readonly" id="update_sno" name="sno">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_date" class="col-sm-2 control-label">日期</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="update_date" readonly="readonly" name="date">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_g" class="col-sm-2 control-label">国籍</label>
                        <div class="col-sm-10">
                            <select name="nationality" id="update_g">
                                <option value="是">中国</option>
                                <option value="否">美国</option>
                                <option value="英国">英国</option>
                                <option value="法国">法国</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_h" class="col-sm-2 control-label">户口所在地</label>
                        <div class="col-sm-9">
                          <%--  <input type="text" class="form-control" id="update_h" name="location">--%>
                            <select name="location" id="update_h">
                                <option value="肇庆">肇庆</option>
                                <option value="揭阳">揭阳</option>
                                <option value="广州">广州</option>
                                <option value="汕头">汕头</option>
                                <option value="佛山">佛山</option>
                                <option value="东莞">东莞</option>
                                <option value="茂名">茂名</option>
                                <option value="普宁">普宁</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_j" class="col-sm-2 control-label">假期是否留校</label>
                        <div class="col-sm-9">
                            <select name="vacationschool" id="update_j">
                                <option value="是">是</option>
                                <option value="否">否</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_b" class="col-sm-2 control-label">本日是否留校</label>
                        <div class="col-sm-10">
                            <select name="dayschool" id="update_b">
                                <option value="是">是</option>
                                <option value="否">否</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_d" class="col-sm-2 control-label">当前所在国家</label>
                        <div class="col-sm-10">
                           <%-- //<input type="text" id="update_d" name="nowcountry">--%>
                            <select name="nowcountry" id="update_d">
                                <option value="是">中国</option>
                                <option value="否">美国</option>
                                <option value="英国">英国</option>
                                <option value="法国">法国</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_dq" class="col-sm-2 control-label">当前所在地</label>
                        <div class="col-sm-10">
                            <%--<input type="text" id="update_dq" name="nowarea">--%>
                            <select name="nowarea" id="update_dq">
                                <option value="肇庆">肇庆</option>
                                <option value="揭阳">揭阳</option>
                                <option value="广州">广州</option>
                                <option value="汕头">汕头</option>
                                <option value="佛山">佛山</option>
                                <option value="东莞">东莞</option>
                                <option value="茂名">茂名</option>
                                <option value="普宁">普宁</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_f" class="col-sm-2 control-label">是否发热</label>
                        <div class="col-sm-10">
                            <select id="update_f" name="fever">
                                <option value="是">是</option>
                                <option value="否">否</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_s" class="col-sm-2 control-label">个人健康情况</label>
                        <div class="col-sm-10">
                            <select id="update_s" name="health">
                                <option value="健康">健康</option>
                                <option value="发烧">发烧</option>
                                <option value="感冒">感冒</option>
                                <option value="咳嗽">咳嗽</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_gr" class="col-sm-2 control-label">是否正在培训</label>
                        <div class="col-sm-10">
                            <select name="train" id="update_gr">
                                <option value="是">是</option>
                                <option value="否">否</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_sf" class="col-sm-2 control-label">近14日是否在境外</label>
                        <div class="col-sm-10">
                            <select id="update_sf" name="abroad">
                                <option value="是">是</option>
                                <option value="否">否</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_jr" class="col-sm-2 control-label">14日内有疫情中风险地旅居史:</label>
                        <div class="col-sm-10">
                            <select id="update_jr" name="situationone">
                                <option value="是">是</option>
                                <option value="否">否</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_r" class="col-sm-2 control-label">14日内接触过疫情中风险地返粤人员:</label>
                        <div class="col-sm-10">
                            <select id="update_r" name="situationtwo">
                                <option value="是">是</option>
                                <option value="否">否</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_rn" class="col-sm-2 control-label">14日内有疫情高风险地旅居史:</label>
                        <div class="col-sm-10">
                            <select id="update_rn" name="situationthree">
                                <option value="是">是</option>
                                <option value="否">否</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_rny" class="col-sm-2 control-label">14日内接触过疫情高风险地返粤人员:</label>
                        <div class="col-sm-10">
                            <select id="update_rny" name="situationfour">
                                <option value="是">是</option>
                                <option value="否">否</option>
                            </select>
                        </div>
                    </div>
                    <%--<p>是否已经提交:<input type="text"  id="update_sub"></p>--%>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary update">打卡</button>
            </div>
            </form>
        </div>
    </div>
</div>
</div>
<div class="row">
    <h4 align="center">可以代替打卡的学生的信息</h4>
    <div class="col-md-12">
        <table class="table table-hover" id="replace">
            <thead>
            <tr>
                <th>#</th>
                <th>学号</th>
                <th>姓名</th>
                <th>身份证</th>
                <th>组织</th>
                <th>电话</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
</div>
<jsp:include page="../modal-dialog/Student/update_person.jsp"></jsp:include>
<%--注销--%>
<jsp:include page="../common/cancellation.jsp"></jsp:include>
<script>
    var ogrs="<%=request.getSession().getAttribute("ogr")%>";
    var snos=<%=request.getSession().getAttribute("user")%>;
    $.ajax({
        url:"/student",
        data:"ogr="+ogrs,
        type:"GET",
        success:function (result) {
            //console.log(result);
            var students=result.extend.students;
            $.each(students,function (index,item) {
                if(item.sno!=snos) {
                   // var num = $("<td><td>").append(index);
                    var sno = $("<td></td>").append(item.sno);
                    var name = $("<td></td>").append(item.sname);
                    var sid = $("<td></td>").append(item.sid);
                    var ogr = $("<td></td>").append(item.organization);
                    var phone = $("<td></td>").append(item.phone);
                    var make = $("<td></td>").append($("<a></a>").attr("href", "#")
                        .attr("role", "button").addClass("btn btn-info replace").attr("id", item.sno).append("代替打卡"));
                    $("<tr></tr>").append($("<td></td>").append(index)).append(sno)
                        .append(name).append(sid).append(ogr)
                        .append(phone).append(make).appendTo("#replace tbody");
                }
            });
        }
    });
    $(document).on("click",".replace",function () {
        var date = new Date().toLocaleDateString('chinese', {hour12: false}).split('/').join('-');
        var othersno=$(this).attr("id");
        $.ajax({
            url: "${App_Path}/student_information/" + date + "/" + othersno,
            type: "GET",
            success: function (result) {
               //console.log(result);
                if(result.extend.information!=null)
                {
                    alert("该学生已经打卡");
                }
                else
                {
                    $("#update_sno").val(othersno);
                    $("#update_date").val(date);
                    //弹出模态框
                    $(".make").modal({
                        backdrop: "static"
                    });
                }
            }
        })
    });
    //打卡
    $(document).on("click", ".update", function () {
        //alert("打卡");
        //console.log($(".in_update").serialize());
        var datas=$(".in_update").serialize();
        $.ajax({
            url: "/student_information",
            type: "POST",
            data: datas,
            success: function (result) {
                //console.log(result);
                if (result.code == 100) {
                    alert("代替打卡成功！");
                    $(".make").modal('hide');
                } else {
                    alert("代替打卡失败!");
                }
            }
        })
    })
</script>
</body>
</html>
