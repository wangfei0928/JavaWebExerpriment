<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/4/28
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录页面</title>
</head>
<body>
<h1 align="center">登录操作</h1><hr width="500"><br>
<form method="get" action="DoLogin.jsp">
    <table align="center" border="1">
        <tr>
            <td colspan="2">用户登录</td>
        </tr>
        <tr>
            <td>登录id:</td>
            <td><input type="text" name="userid"></td>
        </tr>
        <tr>
            <td>登录密码:</td>
            <td><input type="password" name="password"></td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;&nbsp;&nbsp;
                <input type="submit" value="登录">&nbsp;&nbsp;&nbsp;
                <input type="reset" value="重置">&nbsp;&nbsp;&nbsp;
                <input type="checkbox" value="1"> 记住我
            </td>

        </tr>
    </table>
    <br><br>
<hr width="500">
    <p align="center">如果尚未注册，请先点击<a href="Register.jsp">这里</a>进行注册！</p><br>
    <p align="center">如果您是管理员，请先点击<a href="mLogin.jsp">这里</a>进行登录！</p>
</form>
</body>
</html>
