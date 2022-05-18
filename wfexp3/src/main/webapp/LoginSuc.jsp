<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/4/28
  Time: 21:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    /*从数据库中获取uname的名字，并且显示在网页上*/
    String id = (String)session.getAttribute("userid");
    System.out.println(id);
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","wangfei.*0928");
    PreparedStatement preparedStatement = connection.prepareStatement("select uname from t_user where uid = ?");
    preparedStatement.setString(1,id);
    ResultSet resultSet = preparedStatement.executeQuery();
    while (resultSet.next()) {

        /*out.print("登陆成功！欢迎["+resultSet.getString("uname")+"]访问新闻管理系统");*/

     %><h1 align="center">登陆成功！欢迎[<%=resultSet.getString("uname")%>]访问新闻管理系统!</h1><br><hr>
<%
    }


/*获取数据库中的<新闻表>*/
    PreparedStatement preparedStatement1 = connection.prepareStatement("select * from db_new2022");
    ResultSet resultSet1 = preparedStatement1.executeQuery();
    %>
<p align="center">
    <a href="InsertNew.jsp" >增加新闻</a>
    <a href="Login.jsp">安全退出</a><br>
</p>

<table border="1" align="center">
<tr>
    <th>标题</th>
    <th>作者</th>
    <th>日期</th>
    <th>热度</th>
    <th>操作</th>
</tr>

<%
    while (resultSet1.next()) {
    %>
<tr>
    <td><%=resultSet1.getString("title")%></td>
    <td><%=resultSet1.getString("writer")%></td>
    <td><%=resultSet1.getString("date")%></td>
    <td><%=resultSet1.getString("hot")%></td>
    <td><a href="SelectNew.jsp?id=<%=resultSet1.getString("id")%>">查询详细</a>
        <a href="UpdateNew.jsp?id=<%=resultSet1.getString("id")%>">修改</a>
        <a href="DeleteNew.jsp?id=<%=resultSet1.getString("id")%>">删除</a>
    </td>
</tr>

<%
    }
%>
</table>
</body>
</html>
