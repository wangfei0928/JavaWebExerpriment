<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/4/5
  Time: 0:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>输出菱形</title>
</head>
<body>
<%
    StringBuffer wflingxing = new StringBuffer();
    int n = 10;
    for (int i = 1; i < n; i++) {
        for (int k = n; k >= i; k--) {
            wflingxing.append("&nbsp");
        }
        for (int j = 1; j <= i; j++) {
            wflingxing.append("*");
        }
        wflingxing.append("<br>");
    }
    for (int i = n-1;i >= 1;i--){
        for (int k = i; k <= n; k++) {
            wflingxing.append("&nbsp");
        }
        for (int j = 1; j <= i; j++){
            wflingxing.append("*");
        }
        wflingxing.append("<br>");
    }
%>
<%= wflingxing.toString() %>
</body>
</html>
