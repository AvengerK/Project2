package Servlet;

import bean.Student;
import database_operation.Operation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by hou on 2016/7/6.
 */
@WebServlet(name = "Servlet.LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("UTF-8");

        String student_id = request.getParameter("student_id");
        String password = request.getParameter("password");

        PrintWriter out = response.getWriter();

        Operation operation=new Operation();
//        Student student = null;
        String result=operation.checkUser(student_id,password);
        switch (result) {
            case "CORRECT":
                System.out.println("correct");

                try {
                    Student student = operation.select("student_signup", "student_id", student_id);
                    if (student != null) {
                        HttpSession session = request.getSession();
                        session.setAttribute("student", student);
                        response.addCookie(new Cookie("student_id", student_id));
                        response.addCookie(new Cookie("password", password));
                    }
                }catch (SQLException sqlexception){
                    sqlexception.printStackTrace();
                }

                response.sendRedirect("index.jsp");
//                request.getRequestDispatcher("index.jsp").forward(request,response);

                break;
            case "INCORRECT":
                System.out.println("incorrect");
                out.flush();
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"incorrect password!\");");
                out.println("history.back();");
                out.println("</script>");
                break;
            case "NO SUCH USER":
                System.out.println("no such user");
                out.flush();
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"no such user!\");");
                out.println("history.back();");
                out.println("</script>");
                break;
        }

    }

}
