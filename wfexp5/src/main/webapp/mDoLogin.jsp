<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/5/16
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String mid = request.getParameter("mid");
    String password = request.getParameter("password");
    String remember = request.getParameter("remember");
    session.setAttribute("mid",mid);
    int flag = 0;   //如果flag = 1，登录进入，如果flag = 0;登录失败
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","wangfei.*0928");
        String sql = "SELECT * FROM t_manager";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next()){

            String findmid = resultSet.getString("mid");
            String finmserpassword = resultSet.getString("mpassword");

            if (findmid.equals(mid) && finmserpassword.equals(password)){
                if ("1".equals(remember)){
                    Cookie c_password = new Cookie("password",finmserpassword);
                    Cookie c_mId = new Cookie("mId",findmid);
                    c_password.setMaxAge(60*60*24*7);//七天
                    c_mId.setMaxAge(60*60*24*7);//七天
                    response.addCookie(c_mId);
                    response.addCookie(c_password);
                }
                flag = 1;
                response.sendRedirect("mLoginSuc.jsp");
            }
        }

        if (flag == 0) {
            response.sendRedirect("mLoginFail.jsp");
        }

    }catch (Exception e){
        out.print(e);
    }
%>
</body>
</html>
