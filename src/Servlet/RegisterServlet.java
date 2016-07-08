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
        String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"utf-8");
        String password = request.getParameter("password");
        String student_id = request.getParameter("student_id");

        ResultSet resultSet;
        Student student;
        PrintWriter out=response.getWriter();

        Operation operation=new Operation();
        try {
            student = operation.select("student_signup", "student_id", student_id);
            if (student!=null){
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"This ID has been registered!\")");
                out.println("history.back();");
                out.println("</script>");
                return;
            }
        }catch (SQLException sqlexception){
            sqlexception.printStackTrace();
        }

        Object operatingStudent[]={name,password,student_id};

        resultSet=operation.exec("INSERT INTO student_signup(name, password, student_id) VALUES (?,?,?)",operatingStudent);
        /*if (operation.checkUser(student_id,password).equals("CORRECT")){
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"registered successfully!\")");
            out.println("window.location.href=\"index.jsp\"");
            out.println("</script>");
        }*/
        try{
            if (operation.select("student_signup","student_id",student_id)!=null){
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"registered successfully!\")");
                out.println("window.location.href=\"index.jsp\"");
                out.println("</script>");
            }
        }catch (SQLException sqlexception){
            sqlexception.printStackTrace();
        }
    }
}
