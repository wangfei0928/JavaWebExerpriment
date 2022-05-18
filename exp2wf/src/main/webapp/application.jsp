<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/4/8
  Time: 1:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>使用application实现的计数器</title>
</head>
<body>
    <%
        int n ;

        if (application.getAttribute("num")==null)
            n=1;
        else
            n = Integer.valueOf(application.getAttribute("num").toString());

        if (session.isNew()){
            n++;
        }
        application.setAttribute("num",n);

    %>
    <%=" 欢迎光临您是第"+application.getAttribute("num")+"位访问者"%>
</body>
</html>
