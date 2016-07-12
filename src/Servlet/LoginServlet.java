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
//学生登录操作的servlet实现
@WebServlet(name = "Servlet.LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //解决中文乱码问题（好像没什么存在的必要了，因为改变了一些方法，不过怕出问题……摆着也没啥事）
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        //从表单提交的信息中获取学号和密码
        String student_id = request.getParameter("student_id");
        String password = request.getParameter("password");
        //获取向页面输入信息的对象
        PrintWriter out = response.getWriter();

        //new一个数据库操作类的对象
        Operation operation=new Operation();
        //利用对象的checkUser方法检查学号密码是否正确
        String result=operation.checkUser("student_signup",student_id,password);
        switch (result) {
            case "CORRECT":
                System.out.println("correct");
                try {
                    //如果正确，利用操作类对象的select方法返回一个学生对象，存储到session
                    Student student = operation.select("student_signup", "student_id", student_id);
                    if (student != null) {
                        HttpSession session = request.getSession();
                        session.setAttribute("student", student);
                    }
                }catch (SQLException sqlexception){
                    sqlexception.printStackTrace();
                }
                //如果正确，最后重定向到index。因为index有检测session是否存在student对象的代码
                //所以如果登录成功，则会再被转发到登录后的界面。
                response.sendRedirect("ChooseClass.jsp");
//                request.getRequestDispatcher("index.jsp").forward(request,response);

                break;
            case "INCORRECT":
                System.out.println("incorrect");
                //如果密码错误，向页面输出javascript代码，alert提示密码错误，返回登录界面
                out.flush();
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"密码错误!\");");
                out.println("history.back();");
                out.println("</script>");
                break;
            case "NO SUCH USER":
                System.out.println("no such user");
                //如果数据库中没有此学号，向页面输出javascript代码，alert提示没有此用户。返回登录界面
                out.flush();
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"没有该用户!\");");
                out.println("history.back();");
                out.println("</script>");
                break;
        }

    }

}
