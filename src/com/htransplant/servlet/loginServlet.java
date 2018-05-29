package com.htransplant.servlet;

import com.htransplant.dao.ApplicationDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class loginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/html/login.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //get the username from the login form
        String username = req.getParameter("inputEmail");
        String password = req.getParameter("inputPassword");

        //Call DAO to validate the logic
        ApplicationDao dao = new ApplicationDao();
        boolean isValidUser = dao.validateUser(username,password);

        //check if user is invalid and set up an error message
        if(isValidUser){
            //Set up the HTTP session
            HttpSession session = req.getSession();

            //set the user name as attribute
            session.setAttribute("username",username);

            //forward to home jsp
            req.getRequestDispatcher("/html/index.html").forward(req,resp); //TODO check this, home.jsp is on lynda
        }else{
            String errorMessage="Invalid credentials, please login again";
            req.setAttribute("error",errorMessage);
            req.getRequestDispatcher("/html/login.jsp").forward(req,resp);

        }
    }
}
