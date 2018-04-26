package com.fastfood.controller;

import com.fastfood.message.BaseRespone;
import com.fastfood.model.*;
import com.fastfood.service.OrderDetailService;
import com.fastfood.service.OrderService;
import com.fastfood.service.ProductService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/")
public class OrderController {

    private static final int NEW_ORDER = 1;

    @Autowired
    ProductService productService;

    @Autowired
    OrderService orderService;

    @Autowired
    OrderDetailService orderDetailService;

    //Cart Cotnroller

    //Checkout Action
    @PostMapping("checkout")
    @ResponseBody
    public BaseRespone checkOut(HttpSession session){
        Cart cart = (Cart) session.getAttribute("cart");
        User user = (User) session.getAttribute("USER");

        if(cart == null || cart.getCount()==0){
            return new BaseRespone("Giỏ hàng của bạn chưa có sản phẩm nào");
        }else if(user == null){
            return new BaseRespone("Bạn phải đăng nhập mới có thể đặt món ăn");
        }else{
            Order order = new Order();
            order.setUser(user);
            order.setAmount(cart.getTotal());
            order.setOrderDate(new Date());
            order.setStatus(NEW_ORDER);
            //insert order
            try {
                orderService.persist(order);
                for(OrderDetail orderDetail :cart.getOrderDetails()){
                    orderDetail.setOrder(order);
                    orderDetailService.persist(orderDetail);
                }
                session.removeAttribute("cart");
                return new BaseRespone("Đặt sản phẩm thành công !! Chúng tôi sẽ liên lạc sớm với bạn");
            } catch (Exception e) {
                e.printStackTrace();
                return new BaseRespone("Có lỗi khi đặt sản phẩm");
            }
        }
    }
    //Get order to index Admin
    @PostMapping(value = "getOrder")
    @ResponseBody
    public BaseRespone getOrderAdminIndex(){
        List<Order> orders = orderService.getListOrder();
        if(orders==null){
            return new BaseRespone("Lấy thông tin order lỗi");
        }else{
            return new BaseRespone(orders,"success");
        }
    }

    @PostMapping(value = "admin/getroworder")
    @ResponseBody
    public BaseRespone getRowOrder(){
        Long row  = orderService.countOrderByStatus();
        if(row==0){
            return new BaseRespone("fail");
        }else{
            return new BaseRespone(row,"success");
        }
    }

    @PostMapping(value = "admin/getorderbytime")
    @ResponseBody
    public BaseRespone getOrderByTime() throws Exception {
        List<Order> lst = orderService.findAll();

        if(lst==null){
            return new BaseRespone("Fail");
        }else{
            return new BaseRespone(lst,"success");
        }
    }


    @RequestMapping(value="admin/getorderbyid/{id:[\\d]+}")
    public String getOrderById(@PathVariable Integer id,ModelMap modelMap) throws Exception {
            Order order = orderService.findById(id);
            List<OrderDetail> lst = order.getOrderDetails();
           modelMap.addAttribute("order",lst);
           modelMap.addAttribute("info",order);
           return "admin/order";
    }

}
