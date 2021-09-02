<%@page import="Bean.Student_information"%>
<%@page import="Bean.Message"%>
<%@page import="java.util.List"%>
<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="UTF-8"%>
<%@ page contentType="application/msexcel" %>
<%
    response.setHeader("Content-disposition","attachment; filename=Student_information.xls");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>outAgency</title>
    </head>
    <body>
        <%
            List<Student_information> list= (List<Student_information>)request.getAttribute("information");
            if(list!=null&&list.size()>0){
        %>
        <div id="printdiv" style="display:none;">
        <table align="left" border="2">
            <thead>
                <tr>
                    <th>学号</th>
                    <th>日期</th>
                    <th>国籍</th>
                    <th>户籍所在地</th>
                    <th>假期是否留校</th>
                    <th>本日是否留校</th>
                    <th>当前所在国家</th>
                    <th>当前所在地</th>
                    <th>是否发热</th>
                    <th>个人健康情况</th>
                    <th>是否正在参加培训</th>
                    <th>近14日是否曾逗留境外</th>
                    <th>14日内有疫情中风险地旅居史</th>
                    <th>14日内接触过疫情中风险地返粤人员</th>
                    <th>14日内有疫情高风险地旅居史</th>
                    <th>14日内接触过疫情高风险地返粤人员</th>
                    <th>是否已经提交</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for(Student_information agency:list){
                %>
                <tr>
                    <td align="center"><%=agency.getSno() %></td>
                    <td align="center"><%=agency.getDate() %></td>
                    <td align="center"><%=agency.getNationality()%></td>
                    <td align="center"><%=agency.getLocation()%></td>
                    <td align="center"><%=agency.getVacationschool()%></td>
                    <td align="center"><%=agency.getDayschool()%></td>
                    <td align="center"><%=agency.getNowcountry()%></td>
                    <td align="center"><%=agency.getNowarea()%></td>
                    <td align="center"><%=agency.getFever()%></td>
                    <td align="center"><%=agency.getHealth()%></td>
                    <td align="center"><%=agency.getAbroad()%></td>
                    <td align="center"><%=agency.getSituationone()%></td>
                    <td align="center"><%=agency.getSituationtwo()%></td>
                    <td align="center"><%=agency.getSituationthree()%></td>
                    <td align="center"><%=agency.getSituationfour()%></td>
                    <td align="center"><%=agency.getSubmit()%></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        </div>
    </body>

</html>