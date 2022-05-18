<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/4/30
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","wangfei.*0928");
    PreparedStatement preparedStatement = connection.prepareStatement("delete from db_new2022 where id = ?");
    preparedStatement.setString(1,id);
    int i = preparedStatement.executeUpdate();
    if (i>0){
        out.print("删除成功，3秒后跳转到信息页面");
        response.setHeader("refresh","3;url = LoginSuc.jsp");
    }else {
        out.print("删除失败");
    }
%>
</body>
</html>
