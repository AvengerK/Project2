package Servlet;

import database_operation.Operation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Project2_cloned
 * Created by hou on 2016/7/12 17:56.
 */
@WebServlet(name = "EditInfoServlet")
public class EditInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String javaWebInfo=new String(request.getParameter("java_web_info").getBytes("ISO_8859-1"),"utf-8");
        String embeddedInfo=new String(request.getParameter("embedded_info").getBytes("ISO_8859-1"),"utf-8");
        String pictureInfo=new String(request.getParameter("picture_info").getBytes("ISO_8859-1"),"utf-8");
        System.out.println(request.getParameter("date"));
        DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        try {
            java.util.Date date = dateFormat.parse(request.getParameter("date"));
        }catch (ParseException e){
            e.printStackTrace();
        }
        Operation operation=new Operation();
        System.out.println(javaWebInfo);
        System.out.println(embeddedInfo);
        System.out.println(pictureInfo);
        operation.exec("UPDATE course SET info='"+javaWebInfo+"' WHERE course_id=1");
        operation.exec("UPDATE course SET info='"+embeddedInfo+"' WHERE course_id=2");
        operation.exec("UPDATE course SET info='"+pictureInfo+"' WHERE course_id=3");
        response.sendRedirect("background.jsp");
    }
}
