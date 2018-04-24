package com.fastfood.controller;

import com.fastfood.model.Product;
import com.fastfood.model.User;
import com.fastfood.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/user")
public class UserController {
    private static final Logger logger = Logger.getLogger(User.class);

    @Autowired
    UserService userService;

    @RequestMapping("/")
    public String lstUser(ModelMap modelMap) throws Exception {
        modelMap.addAttribute("user", userService.findAll());
        return "admin/user";
    }



    @RequestMapping("/add")
    public String addUser(ModelMap modelMap) {
        modelMap.addAttribute("user", new User());
        return "admin/add-user";
    }

    @PostMapping("/add")
    public String addUser(@Validated @ModelAttribute User user, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (!bindingResult.hasErrors()) {
            try {
                userService.persist(user);
                redirectAttributes.addFlashAttribute("message", "Thêm tài khoản thành công");
                return "redirect:/admin/user/add";
            } catch (Exception e) {
                logger.info(e);
                redirectAttributes.addFlashAttribute("message", "Thêm tài khoản thất bại");
                return "redirect:/admin/user/add";
            }
        }
        return "admin/add-user";
    }


    @RequestMapping("/edit/{id:[\\d]+}")
    public String editUser(@PathVariable Integer id,ModelMap modelMap) throws Exception {
        modelMap.addAttribute("user", userService.findById(id));
        return "admin/edit-user";
    }

    @PostMapping("edit/{id:[\\d]+}")
    public String editUser(@Validated @ModelAttribute User user, BindingResult bindingResult, @PathVariable int id, RedirectAttributes redirectAttributes) {
        if (!bindingResult.hasErrors()) {
            try {
                userService.saveOrUpdate(user);
                redirectAttributes.addFlashAttribute("message", "Sửa tài khoản thành công !!");
                return "redirect:admin/edit{id}";
            } catch (Exception e) {
                logger.info(e);
                redirectAttributes.addFlashAttribute("message", "Sửa tài khoản thất bại !!");
                return "redirect:admin/edit{id}";
            }
        }
        return "admin/edit-user";
    }

    @GetMapping({"delete/{id:[\\d]+}", "delete/{id:[\\d]+}-{confirm}"})
    public String delete(@PathVariable int id, @PathVariable(required = false) String confirm, @ModelAttribute User user, ModelMap model) throws Exception {
        if (confirm != null && confirm.equals("yes")) {
            userService.delete(user, id);
            return "redirect:/admin/user/";
        }
        model.addAttribute("id", id);
        model.addAttribute("path", "user");
        return "admin/delete";
    }
}
