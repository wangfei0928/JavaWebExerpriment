<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/5/16
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1 align="center">添加操作</h1><br><hr width="500"><br>
<form method="get" action="mDoAddUser.jsp">
    <table border="1" align="center" >
        <tr>
            <td colspan="2">添加用户</td>
        </tr>
        <tr>
            <td>登录ID:</td>
            <td><input type="text" name="userid"></td>
        </tr>
        <tr>
            <td>真实姓名:</td>
            <td><input type="text" name="username"></td>
        </tr>
        <tr>
            <td>性别:</td>
            <td><input type="radio" name="sex" value="男">男 <input type="radio" name="sex" value="女">女</td>
        </tr>
        <tr>
            <td>E-mail</td>
            <td><input type="text" name="email"></td>
        </tr>
        <tr>
            <td>登陆密码</td>
            <td><input type="password" name="password"></td>
        </tr>
        <tr>
            <td>确认密码</td>
            <td><input type="password" name="repassword"></td>
        </tr>
        <tr align="center">
            <td colspan="2" >

                <input type="submit"value="添加">
                <input type="reset"value="重置"></td>
        </tr>

    </table>
</form>
</body>
</html>
