/**
 *
 */
package com.fastfood.controller;

import com.fastfood.model.Category;
import com.fastfood.model.Product;
import com.fastfood.model.ProductInfo;
import com.fastfood.service.CategoryService;
import com.fastfood.service.ProductService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author TuanAnh
 */
@Controller
@RequestMapping("/admin/product")
public class ProductController {
    private static final Logger logger = Logger.getLogger(Product.class);

    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;

    @RequestMapping("/")
    public String product(ModelMap model) throws Exception {
        model.addAttribute("product", productService.findAll());
        return "admin/product";
    }


    @RequestMapping(value = {"/productImage"}, method = RequestMethod.GET)
    public void productImage(HttpServletRequest request, HttpServletResponse response, Model model,
                             @RequestParam("id") int id) throws Exception {
        Product product = null;
        if (id > 0) {
//	           product = this.productDAO.findProduct(code);
            product = productService.findById(id);
        }
        if (product != null && product.getImage() != null) {
            response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
            response.getOutputStream().write(product.getImage());
        }
        response.getOutputStream().close();
    }


    @ModelAttribute("lstCategory")
    public List<Category> setListCategory() throws Exception {
        return categoryService.findAll();
    }

    @RequestMapping("/add")
    public String formAdd(ModelMap model) throws Exception {
        model.put("productInfo", new ProductInfo());
        return "admin/add-product";
    }

    @PostMapping("/add")
    public String addProduct(@Validated @ModelAttribute ProductInfo productInfo, BindingResult result, RedirectAttributes redirectAttributes, @RequestParam("fileData") MultipartFile photo) throws Exception {
        if (!result.hasErrors()) {
            if (productService.saveProduct(productInfo)) {
                redirectAttributes.addFlashAttribute("message", "Insert Success");
                return "redirect:/admin/product/add";
            } else {
                redirectAttributes.addFlashAttribute("message", "insert Fail");
                return "redirect:/admin/product/add";
            }

        }
        return "admin/add-product";
    }

    @RequestMapping("/edit/{id}")
    public String formEdit(ModelMap model, @PathVariable int id) throws Exception {
        model.addAttribute("product", productService.findById(id));
        return "admin/edit-product";
    }

    @PostMapping("/edit/{id}")
    public String editProduct(@Validated @ModelAttribute Product product, BindingResult result, RedirectAttributes redirectAttributes) throws Exception {
        if (!result.hasErrors()) {
            productService.saveOrUpdate(product);
            redirectAttributes.addFlashAttribute("message", "Sửa sản phẩm thành công");
            return "redirect:/admin/product/edit/{id}";
        }

        return "admin/edit-product";
    }

    @GetMapping({"delete/{id:[\\d]+}", "delete/{id:[\\d]+}-{confirm}"})
    public String delete(@PathVariable int id, @PathVariable(required = false) String confirm, @ModelAttribute Product product, ModelMap model) throws Exception {
        if (confirm != null && confirm.equals("yes")) {
            productService.delete(product, id);
            return "redirect:/admin/product/";
        }
        model.addAttribute("id", id);
        model.addAttribute("path", "product");
        return "admin/delete";
    }


}
