<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/5/16
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","wangfei.*0928");
    PreparedStatement preparedStatement = connection.prepareStatement("insert into t_user(uid, uname, upassword, usex, uemail,uregdate) values (?,?,?,?,?,?)");
    preparedStatement.setString(1,request.getParameter("userid"));
    preparedStatement.setString(2,request.getParameter("username"));
    preparedStatement.setString(4,request.getParameter("sex"));
    preparedStatement.setString(5,request.getParameter("email"));
    String password = request.getParameter("password");
    String repassword = request.getParameter("repassword");

    if (password.equals(repassword)) {
        Date date = new Date();
        preparedStatement.setObject(6, date);
        preparedStatement.setString(3,password);
        try {
            int i = preparedStatement.executeUpdate();%>
            <jsp:forward page="mLoginSuc.jsp"></jsp:forward>
    <%
}catch (Exception e){
    request.setAttribute("idExist","登录ID已经存在");
    %>
        <jsp:forward page="mAddUserFail.jsp"></jsp:forward>
<%
    }
}else {
    request.setAttribute("wrong","两次密码不一致");
%>
<jsp:forward page="mAddUserFail.jsp"></jsp:forward>
<%
    }
%>
</body>
</html>
