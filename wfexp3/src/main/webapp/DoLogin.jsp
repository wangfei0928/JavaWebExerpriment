<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/4/28
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%


    String id = request.getParameter("userid");
    String password = request.getParameter("password");
    String remember = request.getParameter("remember");
    session.setAttribute("userid",id);
    int flag = 0;   //如果flag = 1，登录进入，如果flag = 0;登录失败
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","wangfei.*0928");
        String sql = "SELECT * FROM t_user";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next()){

            String findUid = resultSet.getString("uid");
            String finUserpassword = resultSet.getString("upassword");
 /*           String findUserName = resultSet.getString("uname");
            System.out.println(findUserName);*/
            if (findUid.equals(id) && finUserpassword.equals(password)){
//                System.out.println(findUserName);
                if ("1".equals(remember)){
//                    Cookie c_username = new Cookie("userName",findUserName);
                    Cookie c_password = new Cookie("password",finUserpassword);
                    Cookie c_userId = new Cookie("userId",findUid);
                    c_password.setMaxAge(60*60*24*7);//七天
//                    c_username.setMaxAge(60*60*24*7);//七天
                    c_userId.setMaxAge(60*60*24*7);//七天
                    response.addCookie(c_userId);
                    response.addCookie(c_password);
//                    response.addCookie(c_username);
                }
                flag = 1;
                response.sendRedirect("LoginSuc.jsp");
            }
        }

        if (flag == 0) {
            response.sendRedirect("LoginFail.jsp");
        }

    }catch (Exception e){
        out.print(e);
    }
%>

</body>
</html>
