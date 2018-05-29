package com.htransplant.filter;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class AuthenticationFilter implements Filter { //filter is an interface


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        //TODO restrict access to shopping cart & checkout https://www.lynda.com/Java-tutorials/Filters-Implement-filter-logic/636136/701487-4.html?org=jcu.edu.au
    }

    @Override
    public void destroy() {

    }
}
