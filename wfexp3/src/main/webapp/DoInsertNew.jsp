<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/4/30
  Time: 13:32
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
    PreparedStatement preparedStatement = connection.prepareStatement("insert into db_new2022(title, writer, date, hot) values(?,?,?,?) ");
    preparedStatement.setString(1,request.getParameter("title"));
    preparedStatement.setString(2,request.getParameter("writer"));
    preparedStatement.setString(3,request.getParameter("date"));
    preparedStatement.setString(4,request.getParameter("hot"));

    int resultSet = preparedStatement.executeUpdate();
    if (resultSet>0) {
            %>
<jsp:forward page="LoginSuc.jsp"></jsp:forward>
<%
    }else {
        out.print("添加失败！重新添加");
        response.setHeader("refresh","3;url = InsertNew.jsp");
        %>
<%
    }
%>
</body>
</html>
