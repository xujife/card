<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/30
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade tea_message" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">更新个人信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal teacher">
                    <div class="form-group">
                        <label for="p_tno" class="col-sm-2 control-label">工号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" readonly="readonly" id="p_tno" name="tno">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tea_tname" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control"  id="tea_tname" name="tname">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="p_tid" class="col-sm-2 control-label">身份证</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" readonly="readonly" id="p_tid" name="tid">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="p_tpw" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="p_tpw" name="tpw">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-sm-2 control-label">手机号码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="phone" name="phone">
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
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<script>
    var sno=<%=request.getSession().getAttribute("user")%>;
    var ogr='<%=request.getSession().getAttribute("ogr")%>';
    $(document).on("click","#teacher_update",function () {
        reset_form(".tea_message form");
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
            url:"/teacher/"+sno,
            type:"GET",
            success:function (result) {
                var teacher=result.extend.teacher;
                $("#p_tno").val(teacher.tno);
                $("#tea_tname").val(teacher.tname);
                $("#p_tid").val(teacher.tid);
                $("#phone").val(teacher.phone);
            }
        });
        $(".tea_message").modal({
            backdrop:"static"
        });
    });
    //确认更新
    $(document).on("click",".p_update",function () {
        if(!validate_update_form()){
            return false;
        }
        var datas=$(".teacher").serialize();
        $.ajax({
            url:"/teacher",
            type:"POST",
            data:datas+"&_method=PUT",
            success:function (result) {
                if(result.code==100) {
                    alert("更新个人信息成功！");
                    $(".tea_message").modal('hide');
                    document.location.reload();
                }
                else
                {
                    if(undefined!=result.extend.errors.tname)
                    {
                        show_validate_msg("#tea_tname","error",result.extend.errors.sname);
                    }
                    if(undefined!=result.extend.errors.phone)
                    {
                        show_validate_msg("#phone","error",result.extend.errors.phone);
                    }
                    if(undefined!=result.extend.errors.spw)
                    {
                        show_validate_msg("#p_tpw","error",result.extend.errors.spw);
                    }
                }
            }
        });
    });
    //前端校验
    function validate_update_form(){

        var Name = $("#tea_tname").val();
        var spw=$("#p_tpw").val();
        var phone=$("#phone").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        var regspw=/(^[a-zA-Z0-9_-]{6,12}$)/;
        var regphone=/^1\d{10}$/;
        //console.log(Name);
        //console.log(phone);
        if(!regName.test(Name)){
            show_validate_msg("#tea_tname","error","姓名必须是6-16位英文或2-5位中文");
            return false;
        }else{
            show_validate_msg("#tea_tname","success","");
        }
        if(!regspw.test(spw))
        {
            show_validate_msg("#p_tpw","error","密码由6-12位数字和字符组成");
            return false;
        }
        else {
            show_validate_msg("#p_tpw","success","");
        }
        if(!regphone.test(phone))
        {
            show_validate_msg("#phone","error","手机号码由11位数字组成,且以1开头");
            return false;
        }
        else
        {
            show_validate_msg("#phone","success","");
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
    $("#tea_tname").change(function() {
        $.ajax({
            url : "/teacher/"+$("#p_tno").val()+"/"+$("#tea_tname").val(),
            type : "GET",
            success : function(result) {
                if (result.code == 100) {
                    show_validate_msg("#tea_tname", "success", "用户名可用");
                    $("#tea_tname").attr("statu", "success");
                } else {
                    show_validate_msg("#tea_tname", "error", "用户名已存在");
                    $("#tea_tname").attr("statu", "error");
                }
            }
        });
    })
</script>

