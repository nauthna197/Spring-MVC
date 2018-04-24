package com.fastfood.security;

import com.fastfood.model.User;
import com.fastfood.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor extends HandlerInterceptorAdapter {


    @Autowired
    UserService userService;


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        User user = (User) request.getSession().getAttribute("UserInfo");
        if (user==null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return false;
        }
        user = userService.checkLogin(user.getUsername(), user.getPassword());

        if (user != null) {
            return true;
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return false;
        }


    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {


    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
