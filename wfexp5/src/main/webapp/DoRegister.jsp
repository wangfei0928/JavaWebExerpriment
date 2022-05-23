<%--<%@ page import="java.util.Date" %>--%>
<%@ page import="com.wf.service.ManagerService" %>
<%@ page import="com.wf.service.impl.ManagerServiceImpl" %>
<%@ page import="com.wf.domain.User" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/4/28
  Time: 23:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%

    String password = request.getParameter("password");
    String repassword = request.getParameter("repassword");
    String uid = request.getParameter("userid");
    String uname = request.getParameter("username");
    String usex = request.getParameter("sex");
    String email = request.getParameter("email");

    User user = new User();
    user.setUid(uid);
    user.setUname(uname);
    user.setUsex(usex);
    user.setUemail(email);
    ManagerService managerService = new ManagerServiceImpl();
    managerService.register(user);
    if (password.equals(repassword)) {
//        Date date = new Date(System.currentTimeMillis());
        user.setUpassword(repassword);
        Date date = new Date(System.currentTimeMillis());
        System.out.println(date);
        user.setUregdate(date);
        int i = managerService.register(user);
        try {
            if (i> 0){

%>
            <jsp:forward page="RegisterSuc.jsp"></jsp:forward>
<%
         }
        }catch (Exception e){
        request.setAttribute("idExist","登录ID已经存在");
%>
<jsp:forward page="RegisterFail.jsp"></jsp:forward>
<%
        }
    }else {
        request.setAttribute("wrong","两次密码不一致");
    %>
<jsp:forward page="RegisterFail.jsp"></jsp:forward>
<%
    }
%>
</body>
</html>