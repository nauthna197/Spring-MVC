package com.fastfood.controller;


import ch.qos.logback.core.util.DatePatternToRegexUtil;
import com.fastfood.model.DataPoint;
import com.fastfood.model.OrderDetail;
import com.fastfood.model.Product;
import com.fastfood.service.OrderDetailService;
import com.fastfood.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.DateTimeException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/")
public class ChartController {
    @Autowired
    ProductService productService;

    @Autowired
    OrderDetailService orderDetailService;

    @RequestMapping("chart")
    public String showChart(){
        return "admin/chart";
    }


    @RequestMapping(value = "chart/month",produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public List<DataPoint> getListChart() throws Exception {
        List<Product> lstProduct = productService.findAll();
        List<DataPoint> listDataPoint = new ArrayList<DataPoint>();
        for(Product product: lstProduct){
            Long x = orderDetailService.getDataPointAllMonth(product);
            DataPoint dataPoint = new DataPoint(x,product.getName());
            listDataPoint.add(dataPoint);
        }
        return listDataPoint;
    }

    @RequestMapping("date")
    @ResponseBody
    public List<DataPoint> getListChart15(){
        Calendar cal = Calendar.getInstance();
        Date date = new Date();
        List<Date> listDate = new ArrayList<Date>();
        List<DataPoint> listDataPoint = new ArrayList<DataPoint>();
        for (int i =0;i<7;i++){
            cal.add(Calendar.DATE,-i);
            Date dateAgo = cal.getTime();
            listDate.add(dateAgo);
        }






    }



}
