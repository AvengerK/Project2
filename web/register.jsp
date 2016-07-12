<%--
  Created by IntelliJ IDEA.
  User: hou
  Date: 2016/7/4
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="student" class="bean.Student"/>
<jsp:setProperty name="student" property="*"/>

<html>
<head>
	<title>Register</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.indigo-pink.min.css">
	<script defer src="https://code.getmdl.io/1.1.3/material.min.js"></script>
</head>
<body>
<!-- Always shows a header, even in smaller screens. -->
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
  <header class="mdl-layout__header">
    <div class="mdl-layout__header-row">
      <!-- Title -->
      <span class="mdl-layout-title">创新实验班</span>
      <!-- Add spacer, to align navigation to the right -->
      <div class="mdl-layout-spacer"></div>
      <!-- Navigation. We hide it in small screens. -->
        <nav class="mdl-navigation">
            <a class="mdl-navigation__link" href="login.jsp">登录</a>
        </nav>
    </div>
  </header>
  <main class="mdl-layout__content">
    <div class="page-content"><!-- Your content goes here -->
    	<form action="${pageContext.request.contextPath}/Servlet.RegisterServlet" method="post" align="center">
  			<!-- Textfield with Floating Label -->
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <input class="mdl-textfield__input" type="text" id="sample3" name="name">
          <label class="mdl-textfield__label" for="sample3">Name</label>
        </div>
        <!-- Numeric Textfield with Floating Label -->
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <input name="student_id" class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="sample">
          <label class="mdl-textfield__label" for="sample4">Student ID</label>
          <span class="mdl-textfield__error">Input is not a number!</span>
        </div>
        <!-- Numeric Textfield with Floating Label -->
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <input name="password" class="mdl-textfield__input" type="password" id="sample4">
          <label class="mdl-textfield__label" for="sample4">Password</label>
          <%--<span class="mdl-textfield__error">Input is not a number!</span>--%>
        </div>
        <br>
        <!-- Flat button with ripple -->
        <button class="mdl-button mdl-js-button mdl-js-ripple-effect">
          注册
        </button>
    	</form>
    </div>
  </main>
</div>
</body>
</html>