<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/4/5
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>session实现计数</title>
</head>
<body>
<%!
   static int num =1 ;
%>
<%
    if (session.isNew())
        num++;
%>
<%="欢迎光临，您是第"+num+"位访问者"%>
</body>
</html>
