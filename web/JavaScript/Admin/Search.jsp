<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/6/5
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    function serializeNotNull(serStr){
        //去空值
        return serStr.split("&").filter(str => !str.endsWith("=")).join("&");
    };
    $(document).on("click",".search",function () {
        var param=serializeNotNull($("#check").serialize());
        var date=new Date().toLocaleDateString('chinese', {hour12: false}).split('/').join('-');
        if(param!=null) {
            $.ajax({
                url: "student_information/"+date,
                data: param + "&pn=" + 1,
                type: "GET",
                success: function (result) {
                    if(result.extend.information.list.length!=0) {
                        show_information(result);
                        show_page(result);
                        show_pageBag(result);
                    }
                    else {
                        alert("查询结果为空！");
                    }
                }
            });
        }
    });
</script>
