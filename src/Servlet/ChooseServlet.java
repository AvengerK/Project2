package Servlet;

import bean.Student;
import database_operation.Operation;

import javax.servlet.ServletException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by 74726 on 2016/7/9 0009.
 */
@WebServlet(name = "ChooseServlet")
public class ChooseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("servlet");
        HttpSession session = request.getSession();
        Student student =(Student) session.getAttribute("student");
        Operation o = new Operation();
        boolean i = o.is_chosen(student.getStudent_id());
        int cid = 0;
        String id = request.getParameter("class");
        try {
             cid = Integer.valueOf(id).intValue();
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        System.out.println(cid);
        if(i){
            PrintWriter out = response.getWriter();
            out.print("<script language='javascript'>alert('请勿重复选课！')</script>");
            response.sendRedirect("ChooseClass.jsp");
        }
        else{
            o.choose(student.getStudent_id(),cid);
            response.sendRedirect("ChooseClass.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
