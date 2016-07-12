<%--
  Created by IntelliJ IDEA.
  User: 74726
  Date: 2016/7/12 0012
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="bean.Course" %>
<%@page import="database_operation.Operation"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="bean.Student" %>
<html>
<head>
<style>h3{text-align: center}</style>
<title>选课</title>
</head>
<%
    int total =0;
    //Student student=(Student) session.getAttribute("student");
    List<Course> list = new ArrayList<>();
    Operation o = new Operation();
    ResultSet rs = o.exec("select * from course");
    try{
        while(rs.next()){
            Course c = new Course();
            c.setId(rs.getInt(3));
            c.setIntroduction(rs.getString(4));
            c.setName(rs.getString(1));
            System.out.print("label:"+c.getId()+" "+total+" "+rs.getInt(3)+rs.getString(1)+"\n");
            list.add(c);
            total++;
        }} catch (SQLException e){e.printStackTrace();}
%>
<h3>课程一览</h3>
<button style="position: absolute; top: 10px; right: 10px;">
    <a href="${pageContext.request.contextPath}/Servlet.LogoutServlet">注销</a>
</button>
<hr/>
<form action="${pageContext.request.contextPath}/Servlet.ChooseServlet" method="post">
<%
    for(int i = 0;i<total;i++){
        out.print("课程名："+list.get(i).getName());
        out.print("  课序号："+list.get(i).getId());
        out.print("<input type=radio name=class value="+list.get(i).getId()+" /><br/>");
        out.println("详情:"+list.get(i).getIntroduction()+"<br>");
    }
%>
    <input type="submit" name="submit" value="submit">
</form>
<body>

</body>
</html>
