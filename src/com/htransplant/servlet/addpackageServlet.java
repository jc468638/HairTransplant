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

@WebServlet("/addPackage")
public class addpackageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        List<String> cart = (ArrayList<String>)session.getAttribute("cart");

        if (cart==null){
            cart = new ArrayList<>();
        }
        if(request.getParameter("hairPackages")!= null){
            cart.add(request.getParameter("hairPackages"));
        }
        session.setAttribute("cart",cart);


        ApplicationDao dao = new ApplicationDao();
        List<HairPackage> hairPackages = dao.ListHairPackages();

        request.setAttribute("hairPackages", hairPackages);

        request.getRequestDispatcher("/html/packages.jsp").forward(request,response);
    }

}
