<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/4/5
  Time: 12:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>counter计数器</title>
</head>
<body>
<%!
    int count = 0;
%>
<%
    count++;
%>
<%= "you are visitor number:"+ count%>
</body>
</html>
