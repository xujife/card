<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/30
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--教师的详细打卡信息--%>
<div class="modal fade teacher_message" tabindex="-1" role="dialog" id="message">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">详细信息</h4>
            </div>
            <div class="modal-body">
                <p>工号:<input type="text" readonly="readonly" id="message_tno"></p>
                <p>日期:<input type="date" readonly="readonly" id="message_date"></p>
                <p>教职工身份:<input type="text" readonly="readonly" id="message_g"></p>
                <p>假期是否留校:<input type="text" readonly="readonly" id="message_h"></p>
                <p>是否已经返校:<input type="text" readonly="readonly" id="message_j"></p>
                <p>当前所在国家:<input type="text" readonly="readonly" id="message_b"></p>
                <p>当前所在地:<input type="text" readonly="readonly" id="message_dq"></p>
                <p>是否发热:<input type="text" readonly="readonly" id="message_s"></p>
                <p>个人健康情况:<input type="text" readonly="readonly" id="message_gr"></p>
                <p>近14日是否曾逗留境外:<input type="text" readonly="readonly" id="message_jr"></p>
                <p>14日内有疫情中风险地旅居史:<input type="text" readonly="readonly" id="message_r"></p>
                <p>14日内接触过疫情中风险地返粤人员:<input type="text" readonly="readonly" id="message_rn"></p>
                <p>14日内有疫情高风险地旅居史:<input type="text" readonly="readonly" id="message_rny"></p>
                <p>14日内接触过疫情高风险地返粤人员:<input type="text" readonly="readonly" id="message_f"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).on("click",".tea_find",function () {
        var tno=<%=request.getSession().getAttribute("user")%>;
        var date=$(this).attr("date");
        $.ajax({
            url:"${App_Path}/teacher_information/"+tno+"/"+date,
            type:"GET",
            //显示数据
            success:function (result) {
                console.log(result);
                var information=result.extend.information;
                $("#message_tno").val(tno);
                $("#message_date").val(date);
                $("#message_g").val(information.identity);
                $("#message_h").val(information.vacationschool);
                $("#message_j").val(information.atschool);
                $("#message_b").val(information.nowcountry);
                $("#message_dq").val(information.nowarea);
                $("#message_s").val(information.fever);
                $("#message_gr").val(information.health);
                $("#message_jr").val(information.abroad);
                $("#message_r").val(information.situationone);
                $("#message_rn").val(information.situationtwo);
                $("#message_rny").val(information.situationthree);
                $("#message_f").val(information.situationfour);
            }
        });
        //弹出模态框
        $(".teacher_message").modal({
            backdrop:"static"
        });
    })
</script>
