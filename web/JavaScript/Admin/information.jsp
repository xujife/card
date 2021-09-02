<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/6/5
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    /*//直接发送ajax请求获取打卡信息*/
    $(function () {
        var date =new Date().toLocaleDateString('chinese', {hour12: false}).split('/').join('-');
        to_page(1, date);//默认显示第一页数据
    });

    function to_page(pn, date) {
        $.ajax({
            url: "${App_Path}/student_informations/"+date,
            data: {pn: pn},
            type: "GET",
            success: function (result) {
                show_information(result);
                show_page(result);
                show_pageBag(result);
            }
        });
    }
    //显示打卡信息
    function show_information(result) {
        $("#information tbody").empty();
        var current=new Date().toLocaleDateString('chinese', {hour12: false}).split('/').join('-');
        var informations = result.extend.information.list;
        $.each(informations, function (index, item) {
            var num = $("<td></td>").append(index + 1);
            $(".actual").text(num).css("color","green");
            var sno = $("<td></td>").append(item.sno);
            var date = $("<td></td>").append(item.date);
            var nationality = $("<td></td>").append(item.nationality);
            var location = $("<td></td>").append(item.location);
            var vacationschool = $("<td></td>").append(item.vacationschool);
            var dayschool = $("<td></td>").append(item.dayschool);
            var find = $("<td></td>").append($("<a></a>").attr("date", item.date).attr("id", item.sno)
                .append("查看详细信息").addClass("btn btn-info find"));
            $("<tr></tr>").append(num).append(sno)
                .append(date).append(nationality)
                .append(location).append(vacationschool)
                .append(dayschool).append(find)
                .appendTo("#information tbody");
        });
    }
    //显示分页信息
    function show_page(result) {
        $("#page").empty();
        $("#page").append("当前" + result.extend.information.pageNum + "页，共" +
            result.extend.information.pages + "页，共" + result.extend.information.total + "条记录");
    }
    //显示分页导航条
    function show_pageBag(result) {
        $("#page_nav").empty();
        var sno =<%=request.getSession().getAttribute("user")%>;
        var ul = $("<ul></ul>").addClass("pagination");
        var first = $("<li></li>").append($("<a></a>").append("首頁"));
        var pre = $("<li></li>").append(
            $("<a></a>").append($("<span></span>").append("&laquo;")));
        if (result.extend.information.hasPreviousPage == false) {
            pre.addClass("disabled");
            first.addClass("disabled");
        } else {
            first.click(function () {
                to_page(1, sno);
            })
            pre.click(function () {
                to_page(result.extend.information.pageNum - 1, sno);
            })
        }
        ul.append(first).append(pre);
        $.each(result.extend.information.navigatepageNums, function (index, item) {
            var num = $("<li></li>").append($("<a></a>").append(item));
            num.click(function () {
                to_page(item, sno);
            })
            if (result.extend.information.pageNum == item) {
                num.addClass("active");
            }
            ul.append(num);
        });
        var next = $("<li></li>").append(
            $("<a></a>").append($("<span></span>").append("&raquo;")));
        var last = $("<li></li>").append($("<a></a>").append("尾頁"));
        if (result.extend.information.hasNextPage == false) {
            next.addClass("disabled");
            last.addClass("disabled");
        } else {
            next.click(function () {
                to_page(result.extend.information.pageNum + 1, sno);
            })
            last.click(function () {
                to_page(result.extend.information.pages, sno);
            })
        }
        ul.append(next).append(last);
        var nav = $("<nav></nav>").append(ul);
        nav.appendTo("#page_nav");
    }
</script>