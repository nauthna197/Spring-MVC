package com.fastfood.controller;

import com.fastfood.model.TypeCustomer;
import com.fastfood.service.TypeCustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/typecustomer")
public class TypeCustomerController {
    @Autowired
    TypeCustomerService typeCustomerService;

    @RequestMapping("/")
    public String typeCustomer(ModelMap modelMap) throws Exception {
        modelMap.addAttribute("typeCustomer",typeCustomerService.findAll());
        return "admin/typecustomer";
    }

    @RequestMapping("/add")
    public String add(ModelMap modelMap) throws Exception {
        modelMap.addAttribute("typeCustomer",new TypeCustomer());
        return "admin/add-typecustomer";
    }

    @PostMapping("/add")
    public String addProduct(@Validated @ModelAttribute TypeCustomer TypeCustomer, BindingResult result, RedirectAttributes redirectAttributes) throws Exception {
        if (!result.hasErrors()) {
            if (TypeCustomer!=null) {
                typeCustomerService.saveOrUpdate(TypeCustomer);
                redirectAttributes.addFlashAttribute("message", "Thành Công");
                return "redirect:/admin/typecustomer/add";
            } else {
                redirectAttributes.addFlashAttribute("message", "Thêm khách hàng thất bại !!!");
                return "redirect:/admin/typecustomer/add";
            }

        }
        return "admin/add-typecustomer";
    }

    @RequestMapping("/edit/{id}")
    public String editCustomer(@PathVariable Integer id, ModelMap modelMap) throws Exception {
        modelMap.addAttribute("typeCustomer",typeCustomerService.findById(id));
        return "admin/add-typecustomer";
    }


    @GetMapping({"/delete/{id:[\\d]+}", "/delete/{id:[\\d]+}-{confirm}"})
    public String delete(@PathVariable int id, @PathVariable(required = false) String confirm, @ModelAttribute TypeCustomer typeCustomer, ModelMap model) throws Exception {
        if (confirm != null && confirm.equals("yes")) {
            typeCustomerService.delete(typeCustomer, id);
            return "redirect:/admin/typecustomer/";
        }
        model.addAttribute("id", id);
        model.addAttribute("path", "typecustomer");
        return "admin/delete";
    }


}
