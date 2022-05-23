<%@ page import="java.sql.*" %>
<%@ page import="com.wf.domain.News" %>
<%@ page import="com.wf.service.ManagerService" %>
<%@ page import="com.wf.service.impl.ManagerServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/4/30
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
   request.setCharacterEncoding("UTF-8");
   String title = request.getParameter("title");
   String writer = request.getParameter("writer");
   Date date = Date.valueOf(request.getParameter("date"));
   int hot = Integer.parseInt(request.getParameter("hot"));
    News news = new News();
    news.setTitle(title);
    news.setWriter(writer);
    news.setDate(date);
    news.setHot(hot);
    ManagerService managerService = new ManagerServiceImpl();
    int i = managerService.addNews(news);
    if (i>0) {
            %>
<jsp:forward page="LoginSuc.jsp"></jsp:forward>
<%
    }else {
        out.print("添加失败！重新添加");
        response.setHeader("refresh","3;url = InsertNew.jsp");
        %>
<%
    }
%>
</body>
</html>
