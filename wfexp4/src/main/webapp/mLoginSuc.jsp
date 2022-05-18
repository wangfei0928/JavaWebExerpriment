<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/5/16
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    /*从数据库中获取mname的名字，并且显示在网页上*/
    String mid = (String)session.getAttribute("mid");
    System.out.println(mid);
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","wangfei.*0928");
    PreparedStatement preparedStatement = connection.prepareStatement("select mname from t_manager where mid = ?");
    preparedStatement.setString(1,mid);
    ResultSet resultSet = preparedStatement.executeQuery();
    while (resultSet.next()) {

        /*out.print("登陆成功！欢迎["+resultSet.getString("uname")+"]访问新闻管理系统");*/

%><h1 align="center">登陆成功！欢迎[<%=resultSet.getString("mname")%>]访问用户管理系统!</h1><br><hr>
<%
    }


    /*获取数据库中的<用户表>*/
    PreparedStatement preparedStatement1 = connection.prepareStatement("select * from t_user");
    ResultSet resultSet1 = preparedStatement1.executeQuery();
%>
<p align="center">
    <a href="mAddUser.jsp" >增加用户</a>
    <a href="Login.jsp">安全退出</a><br>
</p>

<table border="1" align="center">
    <tr>
        <th>登录ID</th>
        <th>真实姓名</th>
        <th>登录密码</th>
        <th>性别</th>
        <th>E-mail</th>
        <th>注册时间</th>
        <th>管理员操作</th>
    </tr>

        <%
    while (resultSet1.next()) {
    %>
    <tr>
        <td><%=resultSet1.getString(1)%></td>
        <td><%=resultSet1.getString(2)%></td>
        <td><%=resultSet1.getString(3)%></td>
        <td><%=resultSet1.getString(4)%></td>
        <td><%=resultSet1.getString(5)%></td>
        <td><%=resultSet1.getString(6)%></td>
        <td>
            <a href="mUpdateUser.jsp?uid=<%=resultSet1.getString("uid")%>">修改</a>
            <a href="mDeleteUser.jsp?uid=<%=resultSet1.getString("uid")%>">删除</a>
        </td>
    </tr>

        <%
    }
%>
</body>
</html>
