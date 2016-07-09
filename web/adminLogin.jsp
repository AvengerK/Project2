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
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.1.3/material.min.js"></script>
</head>
<body>
<%--管理员登录表单：ID和密码。提交到adminLoginServlet处理--%>
    <form action="${pageContext.request.contextPath}/Servlet.AdminLoginServlet" method="post">
        <!-- 管理员ID：
        <label>
            <input type="number" name="admin_id">
        </label>
        <br>
        密码：
        <label>
            <input type="password" name="password">
        </label>
        <br>
        <input type="submit" name="submit" value="submit"> -->
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    		<input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="sample4" name="admin_id">
    		<label class="mdl-textfield__label" for="sample4">Admin ID</label>
    		<span class="mdl-textfield__error">Input is not a number!</span>
  		</div>
  		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    		<input class="mdl-textfield__input" type="password" id="sample3" name="password">
    		<label class="mdl-textfield__label" for="sample3">Password</label>
  		</div>
        <br>
        <input type="submit" name="submit" value="提交" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">
    </form>
</body>
</html>
