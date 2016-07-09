package Servlet;

import bean.Student;
import database_operation.Operation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Project2
 * Created by hou on 2016/7/6 21:53.
 */
@WebServlet(name = "RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //从注册页面表单提交的信息获取输入的姓名，学号，密码
        String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"utf-8");
        String password = request.getParameter("password");
        String student_id = request.getParameter("student_id");

        //声明一个resultSet结果集和student对象和一个页面输出对象
        //ResultSet resultSet;
        Student student;
        PrintWriter out=response.getWriter();

        //声明一个数据库操作对象
        Operation operation=new Operation();
        try {
            //从数据库中选择与输入学号一致的学生对象，如果存在表示已经被注册，返回注册页面
            student = operation.select("student_signup", "student_id", student_id);
            if (student!=null){
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"这个账户已被注册过!\")");
                out.println("history.back();");
                out.println("</script>");
                return;
            }
        }catch (SQLException sqlexception){
            sqlexception.printStackTrace();
        }

        //定义向数据库中输入的项目集合
        Object operatingStudent[]={name,password,student_id};
        //向数据库进行insert操作
        operation.exec("INSERT INTO student_signup(name, password, student_id) VALUES (?,?,?)",operatingStudent);
        //检测是否insert成功，如果成功就回到登录前的主页
        try{
            if (operation.select("student_signup","student_id",student_id)!=null){
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"注册成功!\")");
                out.println("window.location.href=\"index.jsp\"");
                out.println("</script>");
            }
        }catch (SQLException sqlexception){
            sqlexception.printStackTrace();
        }
    }
}
