package com.htransplant.servlet;

import com.htransplant.beans.User;
import com.htransplant.dao.ApplicationDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/signup")
public class signupServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/html/signup.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //collecting info from form
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String firstName = req.getParameter("fname");
        String lastname = req.getParameter("lname");

        //fill the data in the user bean
        User user = new User(username,firstName,lastname,password);

        //call DAO layer
        ApplicationDao dao = new ApplicationDao();
        int rows = dao.registerUser(user);

        //prepare a message
        String infoMessage = null;
        if(rows==0){
            infoMessage = "Sorry, an error ocurred";
        }else{
            infoMessage = "User registered succesfully";
        }
    }
}
