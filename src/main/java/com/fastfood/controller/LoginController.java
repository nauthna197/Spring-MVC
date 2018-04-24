/**
 *
 */
package com.fastfood.controller;

import com.fastfood.model.User;
import com.fastfood.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

/**
 * @author TuanAnh
 */
@Controller
@RequestMapping("/admin")
public class LoginController {
    private static final Logger logger = Logger.getLogger(User.class);

    @Autowired
    UserService userService;

    @RequestMapping("/login")
    public String login(ModelMap mm) {
        mm.put("user", new User());
        return "login/login";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("UserInfo");
        return "redirect:/admin/login";
    }

    @PostMapping(value = "/login")
    public String login(@ModelAttribute User user, RedirectAttributes redirectAttributes, HttpSession session) {
        User user1 = userService.checkLogin(user.getUsername(), user.getPassword());
        if (user1!=null && user1.getRole()==1) {
            session.setAttribute("UserInfo",user1);
            return "admin/index";
        }else if(user1!=null && user1.getRole()==2){
            session.setAttribute("UserInfo",user1);
            return "admin/index";
        }else if(user1!=null && user1.getRole()==3){
            redirectAttributes.addFlashAttribute("message", "Tài khoản của bạn không có quyền để truy cập trang web này !!!");
            return "redirect:/admin/login";
        }
        else {
            redirectAttributes.addFlashAttribute("message", "Đăng nhập thất bại");
            return "redirect:/admin/login";
        }
    }

}
