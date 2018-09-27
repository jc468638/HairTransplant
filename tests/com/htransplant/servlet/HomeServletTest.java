package com.htransplant.servlet;

import org.junit.Assert;
import org.junit.Test;

import static org.junit.Assert.*;

public class HomeServletTest {


    @Test
    public void doGet() {
        HomeServlet homeServlet= new HomeServlet("home");
       assertNull("home.HomeServlet");
       assertNotNull("home.HomeServlet");
    }
}