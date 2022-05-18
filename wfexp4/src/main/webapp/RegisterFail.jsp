<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/4/29
  Time: 0:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
${wrong}
<%--<%=request.getAttribute("wrong")%>   用request.getAttribute()方法时，id存在时在前面会输出null,因此用EL表达式--%>
${idExist}
<%
    out.print("登陆失败，五秒后自动跳转注册界面");
    response.setHeader("refresh","5;url=Register.jsp");
%>
</body>
</html>
