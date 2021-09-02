<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/26
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(document).on("click","#stu_replace",function () {
        var sno=<%=request.getSession().getAttribute("user")%>
        $.ajax({
            url:"${App_Path}/students/"+sno,
            type:"GET",
            success:function (result) {
                if(result.code!=100)
                {
                    alert("不具备该权限！");
                }
                else
                {
                    self.location="Replace";
                }
            }
        });
    })
</script>
