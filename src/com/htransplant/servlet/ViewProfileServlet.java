package com.htransplant.servlet;

import com.htransplant.beans.User;
import com.htransplant.dao.ApplicationDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/getProfileDetails")
public class ViewProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //get the user name from the session
        System.out.println("User name in profile servlet: " + req.getSession().getAttribute("username"));
        String username = (String)req.getSession().getAttribute("username");

        //call dao and get profile details
        ApplicationDao dao = new ApplicationDao();
        User user = dao.getProfileDetails(username);

        //Store all information in request object
        req.setAttribute("user",user);

        //forward control to profile jsp
        req.getRequestDispatcher("/html/profile.jsp").forward(req,resp);
    }
}
