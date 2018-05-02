package com.fastfood.controller;

import com.fastfood.message.BaseRespone;
import com.fastfood.model.*;
import com.fastfood.service.CustomerService;
import com.fastfood.service.OrderDetailService;
import com.fastfood.service.OrderService;
import com.fastfood.service.ProductService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/")
public class OrderController {

    private static final int NEW_ORDER = 1;

    private static final int SHIPPED_ORDER = 2;

    private static final int SUCCESS_ORRDER = 3;

    private static final int CANCEL_ORDER = 4;

    @Autowired
    ProductService productService;

    @Autowired
    OrderService orderService;

    @Autowired
    OrderDetailService orderDetailService;

    @Autowired
    CustomerService customerService;

    //Cart Cotnroller

    //Checkout Action
    @PostMapping("checkout")
    @ResponseBody
    public BaseRespone checkOut(HttpSession session){
        Cart cart = (Cart) session.getAttribute("cart");
        User user = (User) session.getAttribute("USER");
        int discount = 0;
        if(session.getAttribute("discount")!=null){
            discount = (int) session.getAttribute("discount");
        }


        if(cart == null || cart.getCount()==0){
            return new BaseRespone("Giỏ hàng của bạn chưa có sản phẩm nào");
        }else if(user == null){
            return new BaseRespone("Bạn phải đăng nhập mới có thể đặt món ăn");
        }else{
            Order order = new Order();
            order.setUser(user);
            if(discount!=0){
                double total = cart.getTotal() - (discount*(cart.getTotal()/100));
                order.setAmount(total);
            }else{
                order.setAmount(cart.getTotal());
            }
            
            order.setOrderDate(new Date());
            order.setStatus(NEW_ORDER);
            //insert order
            int totalQuantity = 0;
            try {
                orderService.persist(order);
                for(OrderDetail orderDetail :cart.getOrderDetails()){
                    orderDetail.setOrder(order);
                    orderDetailService.persist(orderDetail);
                    totalQuantity +=orderDetail.getQuantity();
                }

                //Nếu mua hàng trên 10 sản phẩm cùng lúc thì sẽ tự động thêm vào thành khách hàng vip
                if(totalQuantity>=10){
                    Customer customer = new Customer();
                    TypeCustomer typeCustomer = new TypeCustomer();
                    typeCustomer.setId(1);
                    customer.setTypeCustomerBean(typeCustomer);
                    customer.setCountry(user.getAddress());
                    customer.setEmail(user.getEmail());
                    customer.setNumber(user.getNumber());
                    customer.setFullname(user.getFullname());
                    customerService.saveOrUpdate(customer);
                }


                session.removeAttribute("cart");
                return new BaseRespone("Đặt sản phẩm thành công !! Chúng tôi sẽ liên lạc sớm với bạn");
            } catch (Exception e) {
                e.printStackTrace();
                return new BaseRespone("Có lỗi khi đặt sản phẩm");
            }
        }
    }


    //Order history at user-index
    @RequestMapping("history")
    public String historyOrder(){
        return "user/history";
    }


    @PostMapping("gethistory")
    @ResponseBody
    public BaseRespone getListHistory(HttpSession session){
        User user = (User) session.getAttribute("USER");
        List<Order> lst = orderService.getOrderByUser(user);

        if(user==null){
            return new BaseRespone("fail");
        }else{
            return new BaseRespone(lst,"success");
        }

    }

    //Get order to index Admin
    @GetMapping(value = "admin/getordertoday")
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


    @RequestMapping(value="admin/getallorder")
    public String getOrderByID(ModelMap modelMap) throws Exception {
            List<Order> order = orderService.getOrderFilterd();
           modelMap.addAttribute("info",order);
           return "admin/order";
    }


    @PostMapping(value="/getorderbyid/{id}")
    @ResponseBody
    public BaseRespone getOrderById(@PathVariable Integer id,ModelMap modelMap) throws Exception {
        Order order = orderService.findById(id);
        List<OrderDetail> lst = order.getOrderDetails();
        return new BaseRespone(lst,"success");
    }

    @GetMapping(value="admin/setstatus/{id}/{status}")
    @ResponseBody
    public BaseRespone setStatusById(@PathVariable Integer id,@PathVariable Integer status) throws Exception {
        Order order = orderService.findById(id);
        order.setStatus(status);
        try {
            orderService.merge(order);
            return new BaseRespone("success");
        }catch (Exception e){
            e.printStackTrace();
            return  new BaseRespone("fail");
        }
    }


    @GetMapping(value="cancel/{id}")
    @ResponseBody
    public BaseRespone cancelOrder(@PathVariable Integer id) throws Exception {
        Order order = orderService.findById(id);
        order.setStatus(CANCEL_ORDER);
        try {
            orderService.merge(order);
            return new BaseRespone("success");
        }catch (Exception e){
            return  new BaseRespone("fail");
        }
    }


    @GetMapping(value = "getlstProduct")
    @ResponseBody
    public  BaseRespone getListProduct() throws Exception {
        List<Product> lst = productService.findAll();
        return new BaseRespone(lst,"success");
    }


}
