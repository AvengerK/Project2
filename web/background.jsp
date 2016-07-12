<%@ page import="database_operation.Operation" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: hou
  Date: 2016/7/7
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Administration</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.1.3/material.min.js"></script>
</head>
<body>
<%
    Operation operation=new Operation();
%>
<!-- Simple header with fixed tabs. -->
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header
            mdl-layout--fixed-tabs">
    <header class="mdl-layout__header">
        <div class="mdl-layout__header-row">
            <!-- Title -->
            <span class="mdl-layout-title">后台管理</span>
            <div class="mdl-layout-spacer"></div>
            <nav class="mdl-navigation">
                <a class="mdl-navigation__link" href="login.jsp">注销</a>
            </nav>
        </div>
        <!-- Tabs -->
        <div class="mdl-layout__tab-bar mdl-js-ripple-effect">
            <a href="#fixed-tab-1" class="mdl-layout__tab is-active">查询</a>
            <a href="#fixed-tab-2" class="mdl-layout__tab">编辑</a>
        </div>
    </header>
    <main class="mdl-layout__content">
        <section class="mdl-layout__tab-panel is-active" id="fixed-tab-1">
            <div class="page-content"><!-- Your content goes here -->
                <table border="0" align="center" style="margin-top: 10px" class="mdl-data-table mdl-js-data-table">
                    <thead>
                    <tr>
                        <th class="mdl-data-table__cell--non-numeric">学号</th>
                        <th class="mdl-data-table__cell--non-numeric">课程号</th>
                    </tr>
                    </thead>
                    <%
                        ResultSet resultSet=operation.exec("SELECT * FROM select_course");
                        try {
                            while (resultSet.next()){
                    %>
                    <tr>
                        <td><%=resultSet.getString("student_id")%></td>
                        <td><%=resultSet.getString("course_id")%></td>
                    </tr>
                    <%
                            }
                        }catch (SQLException sqlexception){
                            sqlexception.printStackTrace();
                        }
                    %>
                </table>
            </div>
        </section>
        <section class="mdl-layout__tab-panel" id="fixed-tab-2">
            <div class="page-content"><!-- Your content goes here -->
                <!-- Floating Multiline Textfield -->
                <form action="${pageContext.request.contextPath}/Servlet.EditInfoServlet" method="post">
                    <div class="mdl-textfield mdl-js-textfield" style="float: left">
                        <div>
                        <textarea class="mdl-textfield__input" rows= "10" id="java_web_info" name="java_web_info"></textarea>
                        <label class="mdl-textfield__label" for="java_web_info">JAVA WEB 课程介绍</label>
                        </div>
                        <div>
                            <textarea class="mdl-textfield__input" rows= "10" id="embedded_info" name="embedded_info" ></textarea>
                        <label class="mdl-textfield__label" for="embedded_info">嵌入式课程介绍</label>
                        </div>
                        <div>
                            <textarea class="mdl-textfield__input" rows= "10" id="picture_info" name="picture_info" ></textarea>
                        <label class="mdl-textfield__label" for="picture_info">图像处理课程介绍</label>
                        </div>
                    </div>
                    <input type="date" name="date" style="float: left">
                    <input type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" value="提交">
                </form>

            </div>
        </section>
    </main>
</div>
</body>
</html>
