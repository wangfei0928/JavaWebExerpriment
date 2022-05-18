<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/4/5
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆程序之验证页面</title>
<body>
    <%!
        public static String[] userids={"wangfei","wf","wangfey"};
        public static String[] usernames = {"王斐","帅哥","美女"};
        public static String[] userpws = {"123","456","789"};
        String check(String userid,String userpw){
            int i ;
            for ( i = 0; i < userids.length; i++) {
                if (userids[i].equals(userid)){
                    break;
                }
            }
            if (i < userids.length){
                if (userpws[i].equals(userpw)){
                    return usernames[i];
                } else {
                    return "";
                }
            } else {
                return "";
            }
        }
    %>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("userid");
    String password = request.getParameter("psw");
    String remember = request.getParameter("remember");

    String name;
    Cookie[] cookies;
    if (!(name = check(id,password)).equals("")){
        cookies = request.getCookies();
        int i ;
        boolean cookies_flag = false;
        if (cookies != null){
            for (i = 0; i < cookies.length; i++) {
                if ("Cookie2019".equals(cookies[i].getName())){
                    break;
                }
            }
            if (i<cookies.length){
                cookies_flag  = false;
            }else {
                cookies_flag = true;
            }
        }else {
            cookies_flag = true;
        }
        Cookie cookie;
        if (remember != null){
            if (cookies_flag){
                cookie = new Cookie("Cookie2019",id+"#"+password);
                cookie.setMaxAge(45);
                response.addCookie(cookie);
            }
        }else {
            if(!cookies_flag){
                cookie = new Cookie("Cookie2019",id + "#" +password);
                cookie.setMaxAge(0);
                response.addCookie(cookie);
                }
        }
        session.setAttribute("username",name);
        session.setMaxInactiveInterval(60);
        response.sendRedirect("login_success.jsp");
    }else {
        response.sendRedirect("login_failure.jsp");
    }
%>
</body>
</html>
