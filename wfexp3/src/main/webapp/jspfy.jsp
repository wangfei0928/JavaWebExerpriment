<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/4/28
  Time: 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useSSL=false","root","wangfei.*0928");
        PreparedStatement preparedStatement = connection.prepareStatement("select * from user");
        ResultSet resultSet = preparedStatement.executeQuery();

        int pagesize = 2;
        int allcount ;
        int pages ;
        int currentpage = 0;
        resultSet.last();
        allcount = resultSet.getRow();
        pages = (allcount%pagesize == 0)?(allcount/pagesize):(allcount/pagesize+1);
        String str = request.getParameter(String.valueOf(pages));
        if (str == null){
            str = "0" ;
        }else{
            currentpage = Integer.parseInt(str);
            if (currentpage<1){
                currentpage = 1;
            }if (currentpage>pagesize){
                currentpage = pages;
            }
        }
        resultSet.absolute((currentpage - 1)*pagesize+1);
%>
<table border="1">
    <tr>
        <td>用户名</td>
        <td>密码</td>
    </tr>
 <%
     for (int i = 1; i <pagesize; i++){
%><tr>
    <td><%=resultSet.getString("username")%></td>
    <td><%=resultSet.getString("password")%></td>
</tr>
    <%
         if (!resultSet.next()){
             break;
         }
     }
 %>
</table>

<%

        for(int i = 1; i<=pages;i++){
%>
            <a href="jspfy.jsp?page = <%=i%>"><%=i%></a>
        <%
        }
        %>
<p>
    <a href="jspfy.jsp?id=<%=id%>"></a>
</p>
<%
    }catch (Exception e){
        out.print(e);
    }

%>
</body>
</html>
