<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/4/28
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.wf.dao.impl.LoginDaoImpl" %>
<%@ page import="com.wf.dao.LoginDao" %>
<%@ page import="com.wf.service.LoginService" %>
<%@ page import="com.wf.service.impl.LoginServiceImpl" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String uid = request.getParameter("userid");
    String upassword = request.getParameter("password");
    LoginService loginService = new LoginServiceImpl();
    session.setAttribute("userid",uid);
    int flag = loginService.LoginUser(uid,upassword);
    if (flag == 1) {
        System.out.println("登陆成功");
%>
<jsp:forward page="LoginSuc.jsp"></jsp:forward>
<%
 }else {
     %>
<jsp:forward page="LoginFail.jsp"></jsp:forward>
    <%
 }
%>
</body>
</html>
