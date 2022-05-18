<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/4/5
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆失败界面</title>
</head>
<body>
用户名或者密码错误，五秒后进入登录界面
<%
    response.setHeader("refresh","5;url=login.jsp");
%>
</body>
</html>
