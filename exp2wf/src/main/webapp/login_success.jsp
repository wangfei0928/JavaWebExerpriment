<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/4/5
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆成功</title>
</head>
<body>
<%
    if (session.getAttribute("username" )== null){
        response.sendRedirect("login.jsp");
    }
%>
<h2>欢迎[<%= session.getAttribute("username")%>]</h2><br>
<table>
    <tr>
        <th>新闻管理系统</th>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td align="center"><a href="function1.jsp" >功能一</a></td>
    </tr>
    <tr>
        <td align="center"><a href="function2.jsp">功能二</a></td>
    </tr>
    <tr>
        <td align="center"><a href="function3.jsp">功能三</a></td>
    </tr>
</table>
</body>
</html>
