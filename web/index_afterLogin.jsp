<%@ page import="bean.Student" %>
<%@ page import="database_operation.Operation" %><%--
  Created by IntelliJ IDEA.
  User: hou
  Date: 2016/7/7
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--登录后的主页的样子，跟登录前的主页几乎完全一致，但是分为两个页面，因为不知道如何在同一个页面改变显示状态……--%>
<%--比如说在主页去掉登录和注册按钮而显示学生的姓名。所以退而求其次。--%>
<%--和登录前的主页的不同在于，这一“主页”的报名按钮是可用的。而右上角不显示登录注册按钮，转而显示注销按钮和学生姓名--%>
<html>
<head>
    <title>Home Page</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.1.3/material.min.js"></script>
    <style>
        body{font-family: 微软雅黑;}
    </style>
</head>
<body>
<%
    //从session中获取登录成功后存在session中的student对象
    Student student = (Student)session.getAttribute("student");
    //定义字符串name为学生的姓名
    String name = student.getName();
%>
<!-- Simple header with fixed tabs. -->
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header
            mdl-layout--fixed-tabs mdl-layout--no-drawer-button">
    <header class="mdl-layout__header">
        <div class="mdl-layout__header-row">
            <!-- Title -->
            <span class="mdl-layout-title">创新实验班</span>
            <div class="mdl-layout-spacer"></div>
            <nav class="mdl-navigation">
                <%--不显示登录注册按钮，显示一条带有学生姓名的欢迎信息和一个注销按钮--%>

                <%--<a class="mdl-navigation__link" href="register.jsp">注册</a>--%>
                <%--<a class="mdl-navigation__link" href="login.jsp">登录</a>--%>
                    <span class="mdl-layout-title"><%=name%>,欢迎!</span>
                    <%--注销操作由servlet实现--%>
                    <a class="mdl-navigation__link" href="${pageContext.request.contextPath}/Servlet.LogoutServlet">注销</a>

            </nav>
        </div>
        <!-- Tabs -->
        <div class="mdl-layout__tab-bar mdl-js-ripple-effect">
            <a href="#fixed-tab-1" class="mdl-layout__tab is-active">JAVA WEB</a>
            <a href="#fixed-tab-2" class="mdl-layout__tab">嵌入式</a>
            <a href="#fixed-tab-3" class="mdl-layout__tab">图像处理</a>
        </div>
    </header>
    <%--<div class="mdl-layout__drawer">--%>
    <%--<span class="mdl-layout-title">Title</span>--%>
    <%--</div>--%>

    <%--报名按钮可用--%>
    <main class="mdl-layout__content">
        <section class="mdl-layout__tab-panel is-active" id="fixed-tab-1">
            <div class="page-content"><!-- Your content goes here -->
                JAVA WEB实验班
                <!-- Colored FAB button with ripple -->
                <form>
                <button name="class_select" value="1" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored"
                        onclick="<%Operation p1 = new Operation();
                    if(!(p1).is_chosen(student.getStudent_id()))
                        {
                            p1.choose(student.getStudent_id(),1);
                        }else{%> alert('已经报过名了！');<%}%>">
                    <i class="material-icons">add</i>
                </button>
                    <%--<input type="button" name="class_select" value="1" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">--%>
                </form>
            </div>
        </section>
        <section class="mdl-layout__tab-panel" id="fixed-tab-2">
            <div class="page-content"><!-- Your content goes here -->
                嵌入式实验班
                <form>
                <button name="class_select" value="2" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored"
                        onclick="<%Operation p2 = new Operation();
                    if(!(p2).is_chosen(student.getStudent_id()))
                        {
                            p2.choose(student.getStudent_id(),2);
                        }else{%> alert('已经报过名了！');<%}%>">
                    <i class="material-icons">add</i>
                </button>
                </form>
            </div>
        </section>
        <section class="mdl-layout__tab-panel" id="fixed-tab-3">
            <div class="page-content"><!-- Your content goes here -->
                图像处理实验班
                <form>
                <button name="class_select" value="3" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored"
                        onclick="<%Operation p3 = new Operation();
                    if(!(p3).is_chosen(student.getStudent_id()))
                        {
                            p3.choose(student.getStudent_id(),3);
                        }else {%> alert('已经报过名了！')<%}%>">
                    <i class="material-icons">add</i>
                </button>
                </form>
            </div>
        </section>
    </main>
</div>
</body>
</html>
