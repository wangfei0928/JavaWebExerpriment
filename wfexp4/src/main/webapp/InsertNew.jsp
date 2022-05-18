<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/4/30
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加新闻界面</title>
</head>
<body>
    <form method="get" action="DoInsertNew.jsp">
        标题：<input type="text" name="title"><br>
        作者：<input type="text"name="writer"><br>
        日期:<input type="date" name="date"><br>
        热度：<input type="text" name="hot"><br>
        <input type="submit" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置">
    </form>
</body>
</html>
