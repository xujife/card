<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/27
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade p_message" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">更新个人信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal person">
                    <div class="form-group">
                        <label for="p_sno" class="col-sm-2 control-label">学号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" readonly="readonly" id="p_sno" name="sno">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="p_sname" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control"  id="p_sname" name="sname">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="p_sid" class="col-sm-2 control-label">身份证</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" readonly="readonly" id="p_sid" name="sid">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="p_spw" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="p_spw" name="spw">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_phone" class="col-sm-2 control-label">手机号码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="update_phone" name="phone">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="ogr" class="col-sm-2 control-label">组织</label>
                        <div class="col-sm-10 div">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary p_update">更新</button>
            </div>
        </div>
    </div>
</div>
<script>
    var sno=<%=request.getSession().getAttribute("user")%>;
    var ogr='<%=request.getSession().getAttribute("ogr")%>';
    $(document).on("click","#stu_update",function () {
        reset_form(".p_message form");
        //查询相关部门
        $.ajax({
            url:"/organizations",
            type:"GET",
            success:function (result) {
                $(".div").empty();
                var list=result.extend.ogr;
                var num;
                var option=$("<select></select>").attr("name","organization").addClass("stu_ogr");
                $.each(list,function (index,item) {
                    if(item.code!=ogr)
                    option.append($("<option></option>").attr("value",item.code)
                    .text(item.code));
                    else option.append($("<option></option>").attr("value",item.code).attr("selected","selected")
                        .text(item.code));
                });
                $(".div").append(option);
            }
        });
        //查询个人信息
        $.ajax({
            url:"/student/"+sno,
            type:"GET",
            success:function (result) {
                var student=result.extend.student;
                $("#p_sno").val(student.sno);
                $("#p_sname").val(student.sname);
                $("#p_sid").val(student.sid);
                $("#update_phone").val(student.phone);
            }
        });
        $(".p_message").modal({
            backdrop:"static"
        });
    });
    //确认更新
    $(document).on("click",".p_update",function () {
        if(!validate_update_form()){
            return false;
        }
        var datas=$(".person").serialize();
        $.ajax({
            url:"/student",
            type:"POST",
            data:datas+"&_method=PUT",
            success:function (result) {
                if(result.code==100) {
                    alert("更新个人信息成功！");
                    $(".p_message").modal('hide');
                    document.location.reload();
                }
                else
                {
                    if(undefined!=result.extend.errors.sname)
                    {
                        show_validate_msg("#p_sname","error",result.extend.errors.sname);
                    }
                    if(undefined!=result.extend.errors.phone)
                    {
                        show_validate_msg("#update_phone","error",result.extend.errors.phone);
                    }
                    if(undefined!=result.extend.errors.spw)
                    {
                        show_validate_msg("#p_spw","error",result.extend.errors.spw);
                    }
                }
            }
        });
    });
    //前端校验
    function validate_update_form(){

        var Name = $("#p_sname").val();
        var spw=$("#p_spw").val();
        var phone=$("#update_phone").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        var regspw=/(^[a-zA-Z0-9_-]{6,12}$)/;
        var regphone=/^1\d{10}$/;
        console.log(Name);
        console.log(phone);
        if(!regName.test(Name)){
            show_validate_msg("#p_sname","error","姓名必须是6-16位英文或2-5位中文");
            return false;
        }else{
            show_validate_msg("#p_sname","success","");
        }
        if(!regspw.test(spw))
        {
            show_validate_msg("#p_spw","error","密码由6-12位数字和字符组成");
            return false;
        }
        else {
            show_validate_msg("#p_spw","success","");
        }
        if(!regphone.test(phone))
        {
            show_validate_msg("#update_phone","error","手机号码由11位数字组成");
            return false;
        }
        else
        {
            show_validate_msg("#update_phone","success","");
        }
        return true;
    };
    function show_validate_msg(ele,status,msg){
        //为了清空之前的错误信息，免得即使输入正确了，输入框还是红色的
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        //进行比对
        if("success"== status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }

    };
    function reset_form(ele){
        $(ele)[0].reset();
        $(ele).find('*').removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    };
    //判断姓名是否可存在
    $("#p_sname").change(function() {
        //console.log($("#p_sno").val());
        //console.log($("#p_sname").val());
        $.ajax({
            url : "/student/"+$("#p_sno").val()+"/"+$("#p_sname").val(),
            type : "GET",
            success : function(result) {
                if (result.code == 100) {
                    show_validate_msg("#p_sname", "success", "用户名可用");
                    $("#p_sname").attr("statu", "success");
                } else {
                    show_validate_msg("#p_sname", "error", "用户名已存在");
                    $("#p_sname").attr("statu", "error");
                }
            }
        });
    })
</script>
