<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/11
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>出错啦</title>
</head>
<body>
<center>
    <div style="background-color: cornflowerblue">
        <c:if test="${msg}!=null">${msg}</c:if>
    </div>
</center>
</body>
</html>
