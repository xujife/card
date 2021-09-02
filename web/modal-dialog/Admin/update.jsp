<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/6/5
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade update" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改密码</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal pd">
                    <div class="form-group">
                        <label for="admin" class="col-sm-2 control-label">帐号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" readonly="readonly" id="admin" name="admin" value="${user}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control"  id="password" name="password">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary adm">修改</button>
            </div>
        </div>
    </div>
</div>
<script>
    function reset_form(ele){
        //$(ele)[0].reset();
        $(ele).find('*').removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    };
    $(document).on("click","#adm_update",function () {
        $(".update").modal({
            backdrop:"static"
        });
        reset_form("#adm_update form");
    });
    //前端校验
    function validate_update_form(){

        var pd = $("#password").val();
        var regpd=/(^[a-zA-Z0-9_-]{6,12}$)/;
        if(!regpd.test(pd))
        {
            show_validate_msg("#password","error","密码由6-12位数字和字符组成");
            return false;
        }
        else {
            show_validate_msg("#password","success","");
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
    //修改密码
    $(document).on("click",".adm",function () {
        if(!validate_update_form()){
            return false;
        }
        var param=$(".pd").serialize();
        $.ajax({
            url:"/admin",
            data:param+"&_method=PUT",
            type:"POST",
            success:function (result) {
                if(result.code==100)
                {
                    alert("修改密码成功！");
                    $("#password").empty();
                    $(".update").modal('hide');
                }
                else
                {
                    if(undefined!=result.extend.errors.password)
                    {
                        show_validate_msg("#password","error",result.extend.errors.password);
                    }
                }
            }
        });
    });
</script>