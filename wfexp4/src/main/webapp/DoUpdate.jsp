<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/4/30
  Time: 1:01
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

    String id = (String) session.getAttribute("id");

    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","wangfei.*0928");
    PreparedStatement preparedStatement = connection.prepareStatement("update db_new2022 set title = ? , writer = ? , date = ? , hot = ? where id = ?");
    preparedStatement.setString(1,request.getParameter("title"));
    preparedStatement.setString(2,request.getParameter("writer"));
    preparedStatement.setString(3,request.getParameter("date"));
    preparedStatement.setString(4,request.getParameter("hot"));
    preparedStatement.setString(5,id);


    int i = preparedStatement.executeUpdate();

    if (i > 0){
    response.setHeader("refresh","1;url = LoginSuc.jsp");
%>
<%
    }else{
        out.print("修改失败，请重新修改");
        response.setHeader("refresh","3;url = UpdateNew.jsp");
        %>
    <%
    }
    %>

</body>
</html>
