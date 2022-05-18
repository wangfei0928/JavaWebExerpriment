<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/5/1
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //获取所有cookie
    Cookie[] cookies =  request.getCookies();

    boolean flag =  false;  //没有cookie为lastTime

    //遍历cookie数组
    if (  cookies != null && cookies.length >0){
        for (Cookie cookie : cookies) {
            //获取cookie的名称
            String name = cookie.getName();
            //判断cookie的名称是否是lastTime
            if ("lastTime".equals(name)){
                //有该cookie，不是第一次访问
                flag = true; //有lastTime的cookie的值
                //设置cookie的value,获取当前时间字符串，重新设置cookie的值，并且重新设置cookie
                Date date = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日HH:mm:ss秒");
                String str_sdf = sdf.format(date);
                cookie.setValue(str_sdf);
                //设置cookie的存活时间
                cookie.setMaxAge(60*60*24*30);  //一个月
                response.addCookie(cookie);
                //响应数据
                String value = cookie.getValue();
                response.getWriter().write("欢迎回来，您上次访问的时间为 "+value);
                break;
            }
        }

    }
    if (cookies ==null || cookies.length==0||flag == false){
        //设置cookie的value,获取当前时间字符串，重新设置cookie的值，并且重新设置cookie
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日HH:mm:ss秒");
        String str_sdf = sdf.format(date);
        Cookie cookie = new Cookie("lastTime",str_sdf);
        //设置cookie的存活时间
        cookie.setMaxAge(60*60*24*30);  //一个月
        response.addCookie(cookie);

        response.getWriter().write("欢迎您第一次访问");
    }
%>
</body>
</html>
