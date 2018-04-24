/**
 *
 */
package com.fastfood.controller;

import com.fastfood.model.Category;
import com.fastfood.service.CategoryService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * @author TuanAnh
 */
@Controller
@RequestMapping("/admin/category")
public class CategoryController {
    private static final Logger logger = Logger.getLogger(Category.class);

    @Autowired
    CategoryService categoryService;

    @RequestMapping("/")
    public String category(ModelMap model) throws Exception {
        model.addAttribute("category", categoryService.findAll());
        return "admin/category";
    }

    @RequestMapping("/add")
    public String formAddCategory(ModelMap model) {
        model.put("category", new Category());
        return "admin/add-category";
    }

    @PostMapping("/add")
    public String addCategory(@ModelAttribute Category category, RedirectAttributes redirectAttributes) throws Exception {
        if (category.getName().isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Name cannot is empty");
        } else if (!category.getName().isEmpty() && category.getCategoryId() != 0) {
            categoryService.persist(category);
            redirectAttributes.addFlashAttribute("message", "Insert success!!");
        } else {
            redirectAttributes.addFlashAttribute("message", "Insert Fail!!!");
        }
        return "redirect:/admin/category/add";
    }

    @RequestMapping("/edit/{id}")
    public String formEdit(ModelMap model, @PathVariable int id) throws Exception {
        model.addAttribute("category", categoryService.findById(id));
        return "admin/edit-category";
    }

    @PostMapping("/edit/{id}")
    public String editCategory(@ModelAttribute Category category, RedirectAttributes redirectAttributes) throws Exception {
        if (category.getName().isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Name cannot is empty");
        } else if (!category.getName().isEmpty()) {
            categoryService.saveOrUpdate(category);
            redirectAttributes.addFlashAttribute("message", "Update success!!!");
        }
        return "redirect:/admin/category/edit/{id}";
    }

    @GetMapping({"delete/{id:[\\d]+}", "delete/{id:[\\d]+}-{confirm}"})
    public String delete(@PathVariable Integer id, @PathVariable(required = false) String confirm, @ModelAttribute Category category, ModelMap model) throws Exception {
        logger.info("ID :" + category.getCategoryId());
        if (confirm != null && confirm.equals("yes")) {
            categoryService.delete(category, id);
            return "redirect:/admin/category/";
        }
        model.addAttribute("id", id);
        model.addAttribute("path", "category");
        return "admin/delete";
    }
}
