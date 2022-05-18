<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/5/16
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  String uid = request.getParameter("uid");
  Class.forName("com.mysql.jdbc.Driver");
  Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","wangfei.*0928");
  PreparedStatement preparedStatement = connection.prepareStatement("delete from t_user where uid = ?");
  preparedStatement.setString(1,uid);
  int i = preparedStatement.executeUpdate();
  if (i>0){
    out.print("删除成功，3秒后跳转到信息页面");
    response.setHeader("refresh","3;url = mLoginSuc.jsp");
  }else {
    out.print("删除失败");
  }
%>
</body>
</html>
