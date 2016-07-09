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
</head>
<body>
<%
    Student student=(Student) session.getAttribute("student");
    if (student!=null){
        //检测session中的student对象，如果存在表示已经登录，转发到登录后的界面。
        request.getRequestDispatcher("index_afterLogin.jsp").forward(request,response);
    }
%>
<h1 align="center">登录</h1>

<%--学生登录信息表单：学号，密码--%>
<%--提交到LoginServlet实现登录功能--%>
<form action="${pageContext.request.contextPath}/Servlet.LoginServlet" method="post">
    学号：
    <label>
    <input type="number" name="student_id">
    </label>
    <br>
    密码：
    <label>
    <input type="password" name="password">
    </label>
    <br>
    <input type="submit" name="submit" value="submit">
</form>

<%--右下角小按钮为管理员登录，转到管理员登录界面。--%>
<button onclick="window.location.href='adminLogin.jsp';" style="position: absolute; bottom: 10px;right: 10px;">
    Admin
</button>
</body>
</html>
