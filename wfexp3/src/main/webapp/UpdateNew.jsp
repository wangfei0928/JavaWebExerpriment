<%@ page import="java.sql.Connection" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="static jdk.javadoc.internal.doclets.formats.html.markup.HtmlStyle.title" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/4/30
  Time: 0:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>修改新闻界面</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    session.setAttribute("id",id);
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","wangfei.*0928");
    PreparedStatement preparedStatement = connection.prepareStatement("select * from db_new2022 where id = ?");
    preparedStatement.setString(1,id);
    ResultSet resultSet = preparedStatement.executeQuery();

    if (resultSet.next()){
        String title = resultSet.getString("title");
        String  writer = resultSet.getString("writer");
        String  date = resultSet.getString("date");
        String hot = resultSet.getString("hot");

%>
<form action="DoUpdate.jsp" method="get" >
    新闻标题：<input type="text" name="title" value="<%=title%>"><br>
    作者:<input type="text" name="writer" value="<%=writer%>"><br>
    日期:<input type="date" name="date" value="<%=date%>"><br>
    热度:<input type="text" name="hot" value="<%=hot%>"><br>
    <input type="submit" value="确认修改">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置">
</form>
<%
    }
%>
</body>
</html>
