<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/24
  Time: 22:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%--学生详细打卡信息--%>
<div class="modal fade stu_message" tabindex="-1" role="dialog" id="message">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">详细信息</h4>
            </div>
            <div class="modal-body">
                <p>学号:<input type="text" readonly="readonly" id="message_sno"></p>
                <p>日期:<input type="date" readonly="readonly" id="message_date"></p>
                <p>国籍:<input type="text" readonly="readonly" id="message_g"></p>
                <p>户籍所在地:<input type="text" readonly="readonly" id="message_h"></p>
                <p>假期是否留校:<input type="text" readonly="readonly" id="message_j"></p>
                <p> 本日是否留校:<input type="text" readonly="readonly" id="message_b"></p>
                <p>当前所在国家:<input type="text" readonly="readonly" id="message_d"></p>
                <p>当前所在地:<input type="text" readonly="readonly" id="message_dq"></p>
                <p>是否发热:<input type="text" readonly="readonly" id="message_s"></p>
                <p>个人健康情况:<input type="text" readonly="readonly" id="message_gr"></p>
                <p>是否正在参加培训:<input type="text" readonly="readonly" id="message_sf"></p>
                <p>近14日是否曾逗留境外:<input type="text" readonly="readonly" id="message_jr"></p>
                <p>14日内有疫情中风险地旅居史:<input type="text" readonly="readonly" id="message_r"></p>
                <p>14日内接触过疫情中风险地返粤人员:<input type="text" readonly="readonly" id="message_rn"></p>
                <p>14日内有疫情高风险地旅居史:<input type="text" readonly="readonly" id="message_rny"></p>
                <p>14日内接触过疫情高风险地返粤人员:<input type="text" readonly="readonly" id="message_f"></p>
                <p>是否已经提交:<input type="text" readonly="readonly" id="message_sub"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).on("click",".find",function () {
        var sno=$(this).attr("id");
        var temp=$(this).attr("date");
        $.ajax({
            url:"${App_Path}/student_information/"+temp+"/"+sno,
            type:"GET",
            //显示数据
            success:function (result) {
                var information=result.extend.information;
                $("#message_sno").val(information.sno);
                $("#message_date").val(information.date);
                $("#message_g").val(information.nationality);
                $("#message_h").val(information.location);
                $("#message_j").val(information.vacationschool);
                $("#message_b").val(information.dayschool);
                $("#message_d").val(information.nowcountry);
                $("#message_dq").val(information.nowarea);
                $("#message_f").val(information.fever);
                $("#message_s").val(information.health);
                $("#message_gr").val(information.train);
                $("#message_sf").val(information.abroad);
                $("#message_jr").val(information.situationone);
                $("#message_r").val(information.situationtwo);
                $("#message_rn").val(information.situationthree);
                $("#message_rny").val(information.situationfour);
                $("#message_sub").val(information.submit);
            }
        });
        //弹出模态框
        $(".stu_message").modal({
            backdrop:"static"
        });
    })
</script>

