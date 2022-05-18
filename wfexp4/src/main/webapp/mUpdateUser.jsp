<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/5/16
  Time: 14:01
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
    session.setAttribute("uid",uid);
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","wangfei.*0928");
    PreparedStatement preparedStatement = connection.prepareStatement("select * from t_user where uid = ?");
    preparedStatement.setString(1,uid);
    ResultSet resultSet = preparedStatement.executeQuery();

    if (resultSet.next()){
        String id = resultSet.getString("uid");
        String  name = resultSet.getString("uname");
        String  password = resultSet.getString("upassword");
        String sex = resultSet.getString("usex");
        String email = resultSet.getString("uemail");
        String regdate = resultSet.getString("uregdate");


%>

<form action="mDoUpdateUser.jsp" method="get" >
    用户ID：<input type="text" name="uid" value="<%=id%>"><br>
    用户姓名:<input type="text" name="uname" value="<%=name%>"><br>
    用户密码:<input type="text" name="upassword" value="<%=password%>"><br>
    用户性别:<input type="text" name="usex" value="<%=sex%>"><br>
    用户邮箱:<input type="text" name="uemail" value="<%=email%>"><br>
    注册时间:<input type="date" name="uregdate" value="<%=regdate%>"><br>
    <input type="submit" value="确认修改">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置">
</form>
<%
    }
%>
</body>
</html>
