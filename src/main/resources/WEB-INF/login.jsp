<%--
  Created by IntelliJ IDEA.
  User: waiter
  Date: 18-11-9
  Time: 下午12:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>欢迎使用</h2>
    <form action="${pageContext.request.contextPath}/login" method="post">
        <label>
            用户名 ：<input type="text" name="username">
        </label>
        <label>
            密码 ：  <input type="password" name="password">
        </label>
        <button type="submit" value="登录">登录</button>
    </form>
</body>
</html>
