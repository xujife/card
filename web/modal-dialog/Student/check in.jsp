<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/25
  Time: 0:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                                <option value="中国">中国</option>
                                <option value="美国">美国</option>
                                <option value="英国">英国</option>
                                <option value="法国">法国</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_h" class="col-sm-2 control-label">户口所在地</label>
                        <div class="col-sm-9">
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
                            <select name="nowcountry" id="update_d">
                                <option value="中国">中国</option>
                                <option value="美国">美国</option>
                                <option value="英国">英国</option>
                                <option value="法国">法国</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_dq" class="col-sm-2 control-label">当前所在地</label>
                        <div class="col-sm-10">
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
                                <option value="否">否</option>
                                <option value="是">是</option>
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
                                <option value="否">否</option>
                                <option value="是">是</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_sf" class="col-sm-2 control-label">近14日是否在境外</label>
                        <div class="col-sm-10">
                            <select id="update_sf" name="abroad">
                                <option value="否">否</option>
                                <option value="是">是</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_jr" class="col-sm-2 control-label">14日内有疫情中风险地旅居史:</label>
                        <div class="col-sm-10">
                            <select id="update_jr" name="situationone">
                                <option value="否">否</option>
                                <option value="是">是</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_r" class="col-sm-2 control-label">14日内接触过疫情中风险地返粤人员:</label>
                        <div class="col-sm-10">
                            <select id="update_r" name="situationtwo">
                                <option value="否">否</option>
                                <option value="是">是</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_rn" class="col-sm-2 control-label">14日内有疫情高风险地旅居史:</label>
                        <div class="col-sm-10">
                            <select id="update_rn" name="situationthree">
                                <option value="否">否</option>
                                <option value="是">是</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_rny" class="col-sm-2 control-label">14日内接触过疫情高风险地返粤人员:</label>
                        <div class="col-sm-10">
                            <select id="update_rny" name="situationfour">
                                <option value="否">否</option>
                                <option value="是">是</option>
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
<script>
    var sno =<%=request.getSession().getAttribute("user")%>;
    var date = new Date().toLocaleDateString('chinese', {hour12: false}).split('/').join('-');
    $(document).on("click", ".clock", function () {
        $.ajax({
            url: "${App_Path}/student_information/" + date + "/" + sno,
            type: "GET",
            success: function (result) {
                var information = result.extend.information;
                //判断是否已经打卡
                if (information != null) {
                    var submit = information.submit;
                    if (submit == "是") {
                        alert("今天的打卡信息已经上交不可更改！");
                    } else {
                        if (confirm("是否更改今天的打卡信息?")) {
                            $("#stu_sno").val(information.sno);
                            $("#stu_date").val(information.date);
                            $("#stu_g").val(information.nationality);
                            $("#stu_h").val(information.location);
                            $("#stu_j").val(information.vacationschool);
                            $("#stu_b").val(information.dayschool);
                            $("#stu_d").val(information.nowcountry);
                            $("#stu_dq").val(information.nowarea);
                            $("#stu_f").val(information.fever);
                            $("#stu_s").val(information.health);
                            $("#stu_gr").val(information.train);
                            $("#stu_sf").val(information.abroad);
                            $("#stu_jr").val(information.situationone);
                            $("#stu_r").val(information.situationtwo);
                            $("#stu_rn").val(information.situationthree);
                            $("#stu_rny").val(information.situationfour);
                            //弹出模态框
                            $(".edit").modal({
                                backdrop: "static"
                            });
                        }
                    }
                }

                //打卡
                else {
                    $("#update_sno").val(sno);
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
        var datas=$(".in_update").serialize();
        $.ajax({
            url: "/student_information",
            type: "POST",
            data: datas,
            success: function (result) {
                if (result.code == 100) {
                    alert("打卡成功！");
                    $(".make").modal('hide');
                } else {
                    alert("打卡失败!");
                }
                to_page(1, sno);
            }
        })
    })
</script>