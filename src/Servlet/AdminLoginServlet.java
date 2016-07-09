package Servlet;

import database_operation.Operation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Project2
 * Created by hou on 2016/7/7 15:21.
 */
@WebServlet(name = "AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //从表单获取输入的管理员ID和密码，获取页面输出对象
        String admin_id=request.getParameter("admin_id");
        String password=request.getParameter("password");
        PrintWriter out=response.getWriter();

        //new一个数据库操作类
        Operation operation=new Operation();
        //检查ID和密码正确与否
        String result=operation.checkUser("admin",admin_id,password);
        switch (result){
            case "CORRECT":
                //如果正确则进入后台管理页面
                System.out.println("correct");
                response.sendRedirect("background.jsp");
                break;
            case "INCORRECT":
                //密码不正确，alert警告，退回管理员登录界面
                System.out.println("incorrect");
                out.flush();
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"密码错误\");");
                out.println("history.back();");
                out.println("</script>");
                break;
            case "NO SUCH USER":
                //管理员用户不存在，alert警告，退回管理员登录界面
                System.out.println("no such admin");
                out.flush();
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"管理员账户不存在\");");
                out.println("history.back();");
                out.println("</script>");
                break;
        }
    }
}
