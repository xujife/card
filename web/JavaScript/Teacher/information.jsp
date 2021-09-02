<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/29
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    /*//直接发送ajax请求获取打卡信息*/
    $(function () {
        var tno =<%=request.getSession().getAttribute("user")%>;
        to_page(1, tno);//默认显示第一页数据
    });

    function to_page(pn, tno) {
        $.ajax({
            url: "/teacher_information",
            data: "pn="+pn+"&tno="+tno,
            type: "GET",
            success: function (result) {
                //console.log(result);
                //显示打卡信息
                show_information(result);
                //显示分页信息
                show_page(result);
                //显示分页条信息
                show_pageBag(result);
            }
        });
    }

    //显示打卡信息
    function show_information(result) {
        var current=new Date().toLocaleDateString('chinese', {hour12: false}).split('/').join('-');
        $("#information tbody").empty();
        var informations = result.extend.informations.list;
        $.each(informations, function (index, item) {
            var num = $("<td></td>").append(index + 1);
            var tno = $("<td></td>").append(item.tno);
            var date = $("<td></td>").append(item.date);
            var identity = $("<td></td>").append(item.identity);
            var nowcountry = $("<td></td>").append(item.nowcountry);
            var nowarea=$("<td></td>").append(item.nowarea);
            var vacationschool = $("<td></td>").append(item.vacationschool);
            var find = $("<td></td>").append($("<a></a>").attr("date", item.date).attr("id", index + 1)
                .append("查看详细信息").addClass("btn btn-info tea_find"));
            var edit=$("<button></button>").append("编辑");
            $("<tr></tr>").append(num).append(tno)
                .append(date).append(identity)
                .append(vacationschool).append(nowcountry)
                .append(nowarea).append(find)
                .appendTo("#information tbody");
        });
    }

    //显示分页信息
    function show_page(result) {
        $("#page").empty();
        $("#page").append("当前" + result.extend.informations.pageNum + "页，共" +
            result.extend.informations.pages + "页，共" + result.extend.informations.total + "条记录");
    }

    //显示分页导航条
    function show_pageBag(result) {
        var tno =<%=request.getSession().getAttribute("user")%>;
        $("#page_nav").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var first = $("<li></li>").append($("<a></a>").append("首頁"));
        var pre = $("<li></li>").append(
            $("<a></a>").append($("<span></span>").append("&laquo;")));
        if (result.extend.informations.hasPreviousPage == false) {
            pre.addClass("disabled");
            first.addClass("disabled");
        } else {
            first.click(function () {
                to_page(1, tno);
            })
            pre.click(function () {
                to_page(result.extend.informations.pageNum - 1, tno);
            })
        }
        ul.append(first).append(pre);
        $.each(result.extend.informations.navigatepageNums, function (index, item) {
            var num = $("<li></li>").append($("<a></a>").append(item));
            num.click(function () {
                to_page(item, tno);
            })
            if (result.extend.informations.pageNum == item) {
                num.addClass("active");
            }
            ul.append(num);
        });
        var next = $("<li></li>").append(
            $("<a></a>").append($("<span></span>").append("&raquo;")));
        var last = $("<li></li>").append($("<a></a>").append("尾頁"));
        if (result.extend.informations.hasNextPage == false) {
            next.addClass("disabled");
            last.addClass("disabled");
        } else {
            next.click(function () {
                to_page(result.extend.informations.pageNum + 1, tno);
            })
            last.click(function () {
                to_page(result.extend.informations.pages, tno);
            })
        }
        ul.append(next).append(last);
        var nav = $("<nav></nav>").append(ul);
        nav.appendTo("#page_nav");
    }
</script>
