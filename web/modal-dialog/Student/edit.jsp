<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/26
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade edit" tabindex="-1" role="dialog" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">更新打卡信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal edit_stu">
                    <div class="form-group">
                        <label for="stu_sno" class="col-sm-2 control-label">学号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" readonly="readonly" id="stu_sno" name="sno">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stu_date" class="col-sm-2 control-label">日期</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="stu_date" readonly="readonly" name="date">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stu_g" class="col-sm-2 control-label">国籍</label>
                        <div class="col-sm-10">
                            <select name="nationality" id="stu_g">
                                <option value="中国">中国</option>
                                <option value="美国">美国</option>
                                <option value="英国">英国</option>
                                <option value="法国">法国</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stu_h" class="col-sm-2 control-label">户口所在地</label>
                        <div class="col-sm-9">
                            <select name="location" id="stu_h">
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
                        <label for="stu_j" class="col-sm-2 control-label">假期是否留校</label>
                        <div class="col-sm-9">
                            <select name="vacationschool" id="stu_j">
                                <option value="是">是</option>
                                <option value="否">否</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stu_b" class="col-sm-2 control-label">本日是否留校</label>
                        <div class="col-sm-10">
                            <select name="dayschool" id="stu_b">
                                <option value="是">是</option>
                                <option value="否">否</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stu_d" class="col-sm-2 control-label">当前所在国家</label>
                        <div class="col-sm-10">
                            <select name="nowcountry" id="stu_d">
                                <option value="中国">中国</option>
                                <option value="美国">美国</option>
                                <option value="英国">英国</option>
                                <option value="法国">法国</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stu_dq" class="col-sm-2 control-label">当前所在地</label>
                        <div class="col-sm-10">
                            <select name="nowarea" id="stu_dq">
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
                        <label for="stu_f" class="col-sm-2 control-label">是否发热</label>
                        <div class="col-sm-10">
                            <select  id="stu_f" name="fever">
                                <option value="是">是</option>
                                <option value="否">否</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stu_s" class="col-sm-2 control-label">个人健康情况</label>
                        <div class="col-sm-10">
                            <select  id="stu_s" name="health">
                                <option value="健康">健康</option>
                                <option value="发烧">发烧</option>
                                <option value="感冒">感冒</option>
                                <option value="咳嗽">咳嗽</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stu_gr" class="col-sm-2 control-label">是否正在培训</label>
                        <div class="col-sm-10">
                            <select name="train" id="stu_gr">
                                <option value="是">是</option>
                                <option value="否">否</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stu_sf" class="col-sm-2 control-label">近14日是否在境外</label>
                        <div class="col-sm-10">
                            <select  id="stu_sf" name="abroad">
                                <option value="是">是</option>
                                <option value="否">否</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stu_sf" class="col-sm-2 control-label">14日内有疫情中风险地旅居史:</label>
                        <div class="col-sm-10">
                            <select  id="stu_jr" name="situationone">
                                <option value="是">是</option>
                                <option value="否">否</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stu_sf" class="col-sm-2 control-label">14日内接触过疫情中风险地返粤人员:</label>
                        <div class="col-sm-10">
                            <select id="stu_r" name="situationtwo">
                                <option value="是">是</option>
                                <option value="否">否</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stu_rn" class="col-sm-2 control-label">14日内有疫情高风险地旅居史:</label>
                        <div class="col-sm-10">
                            <select  id="stu_rn" name="situationthree">
                                <option value="是">是</option>
                                <option value="否">否</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stu_rny" class="col-sm-2 control-label">14日内接触过疫情高风险地返粤人员:</label>
                        <div class="col-sm-10">
                            <select  id="stu_rny" name="situationfour">
                                <option value="是">是</option>
                                <option value="否">否</option>
                            </select>
                        </div>
                    </div>
                    <%--<p>是否已经提交:<input type="text"  id="update_sub"></p>--%>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary change">更新</button>
            </div>
            </form>
        </div>
    </div>
</div>
</div>
<script>
    //编辑
    $(document).on("click",".change",function () {
        //alert($(".edit_stu").serialize());
        var datas=$(".edit_stu").serialize();
        datas=decodeURIComponent(datas,true);
        //alert(datas);
        $.ajax({
            url: "/student_information",
            type: "POST",
            data: datas+ "&_method=PUT",
            success: function (result) {
                //console.log(result);
                if (result.code == 100) {
                    alert("更新成功！");
                    $(".edit").modal('hide');
                } else {
                    alert("更新失败!");
                }

                to_page(1, sno);
            }
        })
    })
</script>

