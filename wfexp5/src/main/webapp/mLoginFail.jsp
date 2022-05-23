<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/5/16
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
登录失败，请重新登录！！!两秒后进入管理员登录界面
<%
    response.setHeader("refresh","2;url = mLogin.jsp");
%>
</body>
</html>
