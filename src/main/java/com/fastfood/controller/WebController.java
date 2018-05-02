package com.fastfood.controller;

import com.fastfood.message.BaseRespone;
import com.fastfood.model.*;
import com.fastfood.service.CustomerService;
import com.fastfood.service.OrderService;
import com.fastfood.service.ProductService;
import com.fastfood.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * @Author TuanAnh
 */
@Controller
@RequestMapping("/")
public class WebController {

    private static final int ROLE_USER = 3;

    @Autowired
    ProductService productService;

    @Autowired
    UserService userService;

    @Autowired
    OrderService orderService;

    @Autowired
    CustomerService customerService;


    @RequestMapping(value = {"productImage"}, method = RequestMethod.GET)
    public void productImage(HttpServletRequest request, HttpServletResponse response, Model model,
                             @RequestParam("id") int id) throws Exception {
        Product product = null;
        if (id > 0) {
            product = productService.findById(id);
        }
        if (product != null && product.getImage() != null) {
            response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
            response.getOutputStream().write(product.getImage());
        }
        response.getOutputStream().close();
    }


    @RequestMapping("index")
    ModelAndView home(ModelAndView modelAndView, ModelMap modelMap) throws Exception {
        modelMap.addAttribute("listCombo",productService.getProductWithoutCombo());
        modelMap.addAttribute("listProduct", productService.getComboProduct());
        modelAndView.setViewName("user/index");
        return modelAndView;
    }

    //set Index admin
    @RequestMapping("admin/index")
    ModelAndView index(ModelAndView modelAndView, ModelMap modelMap) throws Exception {
        modelAndView.setViewName("admin/index");
        return modelAndView;
    }


    //Action user login
    @RequestMapping("login")
    public String userLogin(ModelMap modelMap) {
        modelMap.put("user", new User());
        return "user/user-login";
    }


    @PostMapping("login")
    public String login(@ModelAttribute User user, RedirectAttributes redirectAttributes, HttpSession session) {
        User user1 = userService.checkLogin(user.getUsername(), user.getPassword());
        if (user1!=null && user1.getRole()==ROLE_USER) {
            session.setAttribute("USER",user1);

            Customer customer = customerService.getCustomerbyNumber(user1.getNumber());
            if(customer!=null){
                session.setAttribute("discount",customer.getTypeCustomerBean().getDiscount());
            }


            return "redirect:/index";
        }
        else {
            redirectAttributes.addFlashAttribute("message", "Sai tài khoản hoặc mật khẩu ");
            return "redirect:/login";
        }
    }


    //logout
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("USER");
        return "redirect:/index";
    }





    //Cart Action
    @RequestMapping("cart")
    public String showCart() {
        return "user/cart";
    }

    @RequestMapping("ordernow/{id:[\\d]+}")
    public String orderNow(@PathVariable(value = "id") Integer id, HttpSession httpSession, ModelMap modelMap) throws Exception {

        Cart cart = (Cart) httpSession.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }

        Product product = productService.findById(id);

        if (product == null) {
            return "redirect:/index";
        } else {
            cart.add(product);
            httpSession.setAttribute("cart", cart);
            return "redirect:/cart";
        }

    }

    @RequestMapping("getorder")
    @ResponseBody
    public BaseRespone orderNowJson(HttpSession httpSession, ModelMap modelMap) throws Exception {

        Cart cart = (Cart) httpSession.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        httpSession.setAttribute("cart", cart);
        return new BaseRespone(cart, "successs");


    }


    @RequestMapping("reduceorder/{id:[\\d]+}")
    @ResponseBody
    public BaseRespone reduceOrder(@PathVariable(value = "id") Integer id, HttpSession httpSession, ModelMap modelMap) throws Exception {
        Cart cart = (Cart) httpSession.getAttribute("cart");
        Product product = productService.findById(id);
        if (product == null) {
            return new BaseRespone("Fail!!! product is null");
        } else  {
            cart.update(product);
            httpSession.setAttribute("cart", cart);
            return new BaseRespone(cart,"successs");
        }
    }


    @RequestMapping("getTotal")
    @ResponseBody
    public BaseRespone getTotal(HttpSession session){
        Cart cart = (Cart) session.getAttribute("cart");

        if(cart!=null){
            return new BaseRespone(cart.getTotal(),"successs");
        }else{
            return new BaseRespone("Fail");
        }
    }


    @RequestMapping("cartplus/{id:[\\d]+}")
    @ResponseBody
    public BaseRespone plusOrder(@PathVariable(value = "id") Integer id, HttpSession httpSession, ModelMap modelMap) throws Exception {
        Cart cart = (Cart) httpSession.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        Product product = productService.findById(id);

        if (product == null) {
            return new BaseRespone("Fail!!! product is null");
        } else {
            cart.add(product);
            httpSession.setAttribute("cart", cart);
            return new BaseRespone(cart, "successs");
        }

    }


    @RequestMapping("deleteorder/{id}")
    @ResponseBody
    public BaseRespone deleteOrder(@PathVariable(value = "id") Integer id, HttpSession httpSession ) throws Exception {
        Cart cart = (Cart) httpSession.getAttribute("cart");
        Product product = productService.findById(id);

        if (product == null) {
            return new BaseRespone("Fail!!");
        }
        if (product != null) {
            cart.remove(id);
            return new BaseRespone(cart,"Delete success");
        }
        return new BaseRespone("Fail!!");
    }



    //Register Action
    @PostMapping("register")
    @ResponseBody
    public BaseRespone addUser(@RequestBody User user) {
        if(user!=null){
            try {
                userService.persist(user);
                return new BaseRespone("Success");
            } catch (Exception e) {
                e.printStackTrace();
                return new BaseRespone("Fail");
            }
        }
        return new BaseRespone("Fail");

    }

}