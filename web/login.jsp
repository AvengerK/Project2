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
    <script type="text/javascript" src="jquery.js">

    </script>
</head>
<body>
<%
    Student student=(Student) session.getAttribute("student");
    if (student!=null){
        System.out.println("student in login.jsp not null");
        request.setAttribute("student",student);
        request.getRequestDispatcher("index_afterLogin.jsp").forward(request,response);
    }
%>
<h1 align="center">登录</h1>
<form action="${pageContext.request.contextPath}/Servlet.LoginServlet" method="post">
    student ID:
    <label>
    <input type="number" name="student_id">
    </label>
    <br>
    Password:
    <label>
    <input type="password" name="password">
    </label>
    <br>
    <input type="submit" name="submit" value="submit">
</form>

<button onclick="window.location.href='adminLogin.jsp';" style="position: absolute; bottom: 10px;right: 10px;">
    Admin
</button>
</body>
</html>
