<%@ page import="com.mysql.jdbc.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="database_operation.Operation" %><%--
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
    <title>REGISTER</title>
</head>
<body>
    <h1 align="center">注册</h1>
    <form action="${pageContext.request.contextPath}/Servlet.RegisterServlet" method="post">
        Name:
        <input type="text" name="name"/><br>
        Password:
        <input type="password" name="password"><br>
        Student ID:
        <input type="number" name="student_id"><br>
        <input type="submit" value="submit"/>
    </form>

</body>


</html>
