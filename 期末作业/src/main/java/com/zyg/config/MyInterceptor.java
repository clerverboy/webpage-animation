package com.zyg.config;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyInterceptor implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
        if(request.getRequestURI().contains("toLogin") || request.getRequestURI().contains("login")){
            return true;
        }

        if(request.getRequestURI().contains("toRegist") || request.getRequestURI().contains("regist")){
            return true;
        }

        if(session.getAttribute("userNameInfo") != null){
            return true;
        }
        if(request.getRequestURI().contains("checkUserName")){
            return true;
        }

        request.getRequestDispatcher("login.jsp").forward(request,response);
        System.out.println("请登录");
        return false;
    }
}
