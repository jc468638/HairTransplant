package com.htransplant.servlet;

import com.htransplant.beans.Enquiry;
import com.htransplant.dao.ApplicationDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import java.util.Random;

@WebServlet("/addEnquiry")
public class addEnquiryServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("application/json");

        //Map<String, String[]> enquiry = req.getParameterMap();

      //  String user_name = Arrays.asList(enquiry.get("user_name")).get(0);

        String user_name = req.getParameter("user_name"); // abc
        String user_last_name = req.getParameter("user_last_name"); // cde
        String user_email = req.getParameter("user_email");
        String user_phone = req.getParameter("user_phone");
        int user_sex = Integer.parseInt(req.getParameter("user_sex"));
        int user_weight = Integer.parseInt(req.getParameter("user_weight"));
        String enquiry_title = req.getParameter("enquiry_title");
        String enquiry_message = req.getParameter("enquiry_message");

        Random rand = new Random();
        int enquiryRef = rand.nextInt(100000) + 1;

        Enquiry enquiry = new Enquiry(enquiryRef,user_email, user_name, user_last_name, user_phone, user_sex, user_weight, enquiry_title, enquiry_message);

        //call DAO layer
        ApplicationDao dao = new ApplicationDao();
        int rows = dao.addEnquiry(enquiry);


        resp.setStatus(200);
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");


        //TODO handle errors
        //resp.getWriter().write("{'id': " + rows + '}');
        resp.getWriter().write(String.valueOf(rows));



    }
    /*    public String generateJSONData(String jsonResponse){
        StringBuffer returnData = null;
        return returnData.toString();
    }*/
}
