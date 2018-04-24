/**
 *
 */
package com.fastfood.controller;

import com.fastfood.model.Employee;
import com.fastfood.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * @author TuanAnh
 */
@Controller
@RequestMapping("/admin/emp")
public class EmpController {
    @Autowired
    EmployeeService employeeServices;

    @RequestMapping("/")
    public String emp(ModelMap model) throws Exception {
        model.addAttribute("emp", employeeServices.findAll());
        return "admin/emp";
    }

    @RequestMapping("/add")
    public String addEmp(ModelMap model) {
        model.put("emp", new Employee());
        return "admin/add-emp";
    }

    @PostMapping("/add")
    public String addEmp(@Validated @ModelAttribute("emp") Employee emp, BindingResult result, RedirectAttributes redirect) {
        if (!result.hasErrors()) {
            try {
                redirect.addFlashAttribute("message", "Thêm dữ liệu thành công!!!");
                employeeServices.persist(emp);
            } catch (Exception e) {
                e.printStackTrace();
                redirect.addFlashAttribute("message", "Thêm dữ liệu thất bại!!!");
            }
            return "redirect:/admin/emp/add";
        }
        return "admin/add-emp";
    }

    @RequestMapping("/edit/{id}")
    public String editEmp(@PathVariable int id, ModelMap model) throws Exception {
        model.addAttribute("emp", employeeServices.findById(id));
        return "admin/edit-emp";
    }

    @PostMapping("/edit/{id}")
    public String editEmp(@Validated @ModelAttribute("emp") Employee emp, BindingResult result, RedirectAttributes redirect) {
        if (!result.hasErrors()) {
            try {
                redirect.addFlashAttribute("message", "Sửa dữ liệu thành công!!!");
                employeeServices.saveOrUpdate(emp);
            } catch (Exception e) {
                e.printStackTrace();
                redirect.addFlashAttribute("message", "Sửa dữ liệu thất bại!!!");
            }
            return "redirect:/admin/emp/edit/{id}";
        }
        return "admin/edit-emp";
    }

    @GetMapping({"delete/{id:[\\d]+}", "delete/{id:[\\d]+}-{confirm}"})
    public String delete(@PathVariable int id, @PathVariable(required = false) String confirm, @ModelAttribute Employee emp, ModelMap model) throws Exception {
        if (confirm != null && confirm.equals("yes")) {
            employeeServices.delete(emp, id);
            return "redirect:/admin/emp/";
        }
        model.addAttribute("id", id);
        model.addAttribute("path", "emp");
        return "admin/delete";
    }


}
