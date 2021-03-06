package com.htransplant.servlet;

import com.htransplant.beans.HairPackage;
import com.htransplant.dao.ApplicationDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/packages")
public class packagesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {



        ApplicationDao dao = new ApplicationDao();
        List<HairPackage> packages = dao.ListHairPackages();

        req.setAttribute("hairPackages",packages);
        req.getRequestDispatcher("/html/packages.jsp").forward(req,resp);
    }
}
