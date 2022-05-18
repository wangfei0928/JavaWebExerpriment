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
    int pages = 0;//总页数
    int pagesize = 3;   //每页显示3个
    int allcounts = 0;  //总行数
    int currentPage = 1; //当前页
    PreparedStatement preparedStatement1 = connection.prepareStatement("select * from db_new2022",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
    ResultSet resultSet1 = preparedStatement1.executeQuery();
    resultSet1.last();
    allcounts = resultSet1.getRow();
    if (allcounts%pagesize==0){
        pages = allcounts/pagesize;
    }else {
        pages = allcounts/pagesize + 1;
    }

    String str = request.getParameter("page");
    if (str == null){
        str = "0";
    }else {
        currentPage = Integer.parseInt(str);
        if (currentPage < 1){
            currentPage = 1;
        }else {
            if (currentPage >= pages){
                currentPage = pages;
            }
        }
    }
    resultSet1.absolute((currentPage - 1)*pagesize + 1);
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
        for (int i = 1; i <= pagesize; i++) {
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
     <%  if (!resultSet1.next()){
        break;
         }
     }
    %>
</table>

    <p align="center">
        <a href="LoginSuc.jsp?page=1">第一页</a>
        <a href="LoginSuc.jsp?page=<%=currentPage-1%>">上一页</a>
        <%
            for (int i = 1; i <= pages;i++) {
        %>
             <a href="LoginSuc.jsp?page=<%=i%>"><%=i%></a>
        <%
            }
        %>
        <a href="LoginSuc.jsp?page=<%=currentPage+1%>">下一页</a>
        <a href="LoginSuc.jsp?page=<%=pages%>">最后一页</a>
    </p>

</body>
</html>
