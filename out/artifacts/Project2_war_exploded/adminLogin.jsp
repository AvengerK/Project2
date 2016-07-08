<%--
  Created by IntelliJ IDEA.
  User: hou
  Date: 2016/7/7
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Login</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/Servlet.AdminLoginServlet" method="post">
        Admin ID:
        <label>
            <input type="number" name="admin_id">
        </label>
        <br>
        Password:
        <label>
            <input type="password" name="password">
        </label>
        <br>
        <input type="submit" name="submit" value="submit">
    </form>
</body>
</html>
