<%--<%@ page import="com.mysql.jdbc.Connection" %>--%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="database_operation.Operation" %>
<%@ page import="bean.Student" %>
<%--
  Created by IntelliJ IDEA.
  User: hou
  Date: 2016/7/6
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.1.3/material.min.js"></script>
</head>
<body>
<%
    Student student=(Student) session.getAttribute("student");
    if (student!=null){
        //检测session中的student对象，如果存在表示已经登录，转发到登录后的界面。
        request.getRequestDispatcher("index_afterLogin.jsp").forward(request,response);
    }
%>
<!-- Always shows a header, even in smaller screens. -->
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
  <header class="mdl-layout__header">
    <div class="mdl-layout__header-row">
      <!-- Title -->
      <span class="mdl-layout-title">登录</span>
      <!-- Add spacer, to align navigation to the right -->
      <div class="mdl-layout-spacer"></div>
      <!-- Navigation. We hide it in small screens. -->
        <nav class="mdl-navigation">
            <a class="mdl-navigation__link" href="register.jsp">注册</a>
        </nav>
    </div>
  </header>

  <main class="mdl-layout__content">
    <div class="page-content"><!-- Your content goes here -->

<form action="${pageContext.request.contextPath}/Servlet.LoginServlet" method="post" align="center">
    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input name="student_id" class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="sample4">
    <label class="mdl-textfield__label" for="sample4">Student ID</label>
    <span class="mdl-textfield__error">Input is not a number!</span>
  	</div>

  	<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input name="password" class="mdl-textfield__input" type="password" id="sample">
    <label class="mdl-textfield__label" for="sample4">Password</label>
    <%--<span class="mdl-textfield__error">Input is not a number!</span>--%>
  	</div>
  	<br>
  	<input type="submit" name="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" value="提交">
</form>

        <button onclick="window.location.href='adminLogin.jsp';" style="position: absolute; bottom: 10px;right: 10px;" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">
            Admin
        </button>
    </div>
  </main>
</div>

<%--学生登录信息表单：学号，密码--%>
<%--提交到LoginServlet实现登录功能--%>


<%--右下角小按钮为管理员登录，转到管理员登录界面。--%>

</body>
</html>
