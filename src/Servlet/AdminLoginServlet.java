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
        String admin_id=request.getParameter("admin_id");
        String password=request.getParameter("password");
        PrintWriter out=response.getWriter();

        Operation operation=new Operation();
        String result=operation.checkAdmin(admin_id,password);
        switch (result){
            case "CORRECT":
                System.out.println("correct");
                response.sendRedirect("background.jsp");
                break;
            case "INCORRECT":
                System.out.println("incorrect");
                out.flush();
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"incorrect password!\");");
                out.println("history.back();");
                out.println("</script>");
                break;
            case "NO SUCH ADMIN":
                System.out.println("no such admin");
                out.flush();
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"no such admin!\");");
                out.println("history.back();");
                out.println("</script>");
                break;
        }
    }
}
