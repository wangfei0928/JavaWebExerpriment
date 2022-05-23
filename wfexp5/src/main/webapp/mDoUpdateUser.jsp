<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/5/16
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%

    //    String  id = request.getParameter("id");

    String uid = (String) session.getAttribute("uid");

    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","wangfei.*0928");
    PreparedStatement preparedStatement = connection.prepareStatement("update t_user set uname = ? , upassword = ? , usex = ?,uemail=?,uregdate=? where uid = ?");
    preparedStatement.setString(1,request.getParameter("uname"));
    preparedStatement.setString(2,request.getParameter("upassword"));
    preparedStatement.setString(3,request.getParameter("usex"));
    preparedStatement.setString(4,request.getParameter("uemail"));
    preparedStatement.setString(5,request.getParameter("uregdate"));
    preparedStatement.setString(6,uid);

    int i = preparedStatement.executeUpdate();

    if (i > 0){
        response.setHeader("refresh","1;url = mLoginSuc.jsp");
%>
<%
}else{
    out.print("修改失败，请重新修改");
    response.setHeader("refresh","3;url = mUpdateUser.jsp");
%>
<%
    }
%>
</body>
</html>
