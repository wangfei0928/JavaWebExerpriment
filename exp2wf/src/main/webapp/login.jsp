<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/4/5
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>用户登录界面</title>
</head>
<body>
<%
    String userId = "";
    String password = "";
    Cookie[] cookies = request.getCookies();  //定义一个cookie数组，从客户端获取信息。
    if (cookies != null){
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("Cookie2019")){       //如果cookies 数组的名字是"Cookie2019"
                userId = cookies[i].getValue().split("#")[0];     //获取到cookies[i] 数组中的userid   split("#")  #分隔
                password = cookies[i].getValue().split("#")[1];   //获取到cookies[i] 数组中的password   split("#")  #分隔
                request.setAttribute("userid",userId);            //将userId 命名为userid
                request.setAttribute("password",password);
            }
        }
    }
%>
    <h1 align="center">登录操作</h1>
    <hr>
    <form action="login_check.jsp" method="get">
        <table align="center" border="1">
            <tr>
                <td colspan="2">用户登录</td>
            </tr>
            <tr>
                <td>登录id</td>
                <td><input type="text" name="userid" value="${userid}"></td>
            </tr>
            <tr>
                <td>登陆密码</td>
                <td><input type="password" name="psw" value="${password}"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="登录"> &nbsp;&nbsp;&nbsp
                    <input type="reset" value="重置">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="checkbox" name="remember"> 记住我
                </td>
            </tr>
        </table>
    </form>



</body>
</html>
