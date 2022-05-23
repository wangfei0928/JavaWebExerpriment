<%@ page import="com.wf.service.ManagerService" %>
<%@ page import="com.wf.service.impl.ManagerServiceImpl" %>
<%@ page import="com.wf.domain.News" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.ParseException" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/4/30
  Time: 1:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%

    String  id = (String) session.getAttribute("id");
    String title = request.getParameter("title");
    String writer = request.getParameter("writer");
    Integer hot = Integer.valueOf(request.getParameter("hot"));
    String date = request.getParameter("date");
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
    Date parse = null;
    try {
        long time = simpleDateFormat.parse(date).getTime();
        parse = new Date(time);
    } catch (ParseException e) {
        e.printStackTrace();
    }
//    String id = String.valueOf(session.getAttribute("id"));
    News news = new News();
    news.setTitle(title);
    news.setId(Integer.valueOf(id));
    news.setWriter(writer);
    news.setHot(hot);
    news.setDate(parse);
    ManagerService managerService = new ManagerServiceImpl();
    int i = managerService.update(news);
    if (i > 0){
    response.setHeader("refresh","1;url = LoginSuc.jsp");
%>
<%
    }else{
        out.print("修改失败，请重新修改");
        response.setHeader("refresh","3;url = UpdateNew.jsp");
        %>
    <%
    }
    %>

</body>
</html>
