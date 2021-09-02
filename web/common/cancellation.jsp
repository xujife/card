<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/6/6
  Time: 18:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(document).on("click","#cancellation",function () {
        if(confirm("确认注销？"))
            window.location.href="/index";
    });
</script>
