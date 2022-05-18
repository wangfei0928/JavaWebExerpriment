<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/5/16
  Time: 13:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String mId = "";
    String password = "";
    Cookie[] cookies = request.getCookies();  //定义一个cookie数组，从客户端获取信息。
    //遍历cookie数组，找到是否有对应的账号和密码
    if (cookies != null){
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("userId")) {       //如果cookies 数组的名字是"userId"
                mId = cookies[i].getValue();     //获取到cookies[i] 数组中的userid
            }
            if (cookies[i].getName().equals("password")){
                password = cookies[i].getValue();   //获取到cookies[i] 数组中的password
            }
            request.setAttribute("mid",mId);            //将userId 命名为userid
            request.setAttribute("password",password);

        }
    }
%>
<h1 align="center">管理员登录操作</h1><hr width="500"><br>
<form method="get" action="mDoLogin.jsp">
    <table align="center" border="1">
        <tr>
            <td colspan="2">管理员登录</td>
        </tr>
        <tr>
            <td>管理员id:</td>
            <td><input type="text" name="mid" value="<%=mId%>"></td>
        </tr>
        <tr>
            <td>登录密码:</td>
            <td><input type="password" name="password" value="<%=password%>"></td>
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
    <p align="center"><a href="Login.jsp">返回用户登录界面</a></p><br>
</form>
</body>
</html>
