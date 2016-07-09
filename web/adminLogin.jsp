<%--
  Created by IntelliJ IDEA.
  User: hou
  Date: 2016/7/7
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--管理员登录页面--%>
<html>
<head>
    <title>Admin Login</title>
</head>
<body>
<%--管理员登录表单：ID和密码。提交到adminLoginServlet处理--%>
    <form action="${pageContext.request.contextPath}/Servlet.AdminLoginServlet" method="post">
        管理员ID：
        <label>
            <input type="number" name="admin_id">
        </label>
        <br>
        密码：
        <label>
            <input type="password" name="password">
        </label>
        <br>
        <input type="submit" name="submit" value="submit">
    </form>
</body>
</html>
