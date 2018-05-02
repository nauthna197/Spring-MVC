package com.fastfood.controller;

import com.fastfood.model.Customer;
import com.fastfood.model.TypeCustomer;
import com.fastfood.service.CustomerService;
import com.fastfood.service.TypeCustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/admin/")
public class CustomerController {

    @Autowired
    TypeCustomerService typeCustomerService;

    @Autowired
    CustomerService customerService;

    @RequestMapping("customer")
    public String getIntoCustomer(ModelMap modelMap) throws Exception {
        modelMap.addAttribute("customer",customerService.findAll());
        return "admin/customer";
    }


    @ModelAttribute("lstTypeCustomer")
    public List<TypeCustomer> setListCategory() throws Exception {
        return typeCustomerService.findAll();
    }


    @RequestMapping("customer/add")
    public String insertCustomer(ModelMap modelMap){
        modelMap.addAttribute("customer",new Customer());
        return "admin/add-customer";
    }



    @PostMapping("customer/add")
    public String addProduct(@Validated @ModelAttribute Customer customer, BindingResult result, RedirectAttributes redirectAttributes) throws Exception {
        if (!result.hasErrors()) {
            if (customer!=null) {
                customerService.saveOrUpdate(customer);
                redirectAttributes.addFlashAttribute("message", "thành công");
                return "redirect:/admin/customer/add";
            } else {
                redirectAttributes.addFlashAttribute("message", "Thêm khách hàng thất bại !!!");
                return "redirect:/admin/customer/add";
            }

        }
        return "admin/add-customer";
    }


    @RequestMapping("customer/edit/{id}")
    public String editCustomer(@PathVariable Integer id, ModelMap modelMap) throws Exception {
        modelMap.addAttribute("customer",customerService.findById(id));
        return "admin/add-customer";
    }


    @GetMapping({"customer/delete/{id:[\\d]+}", "customer/delete/{id:[\\d]+}-{confirm}"})
    public String delete(@PathVariable int id, @PathVariable(required = false) String confirm, @ModelAttribute Customer customer, ModelMap model) throws Exception {
        if (confirm != null && confirm.equals("yes")) {
            customerService.delete(customer, id);
            return "redirect:/admin/customer/";
        }
        model.addAttribute("id", id);
        model.addAttribute("path", "customer");
        return "admin/delete";
    }




}
