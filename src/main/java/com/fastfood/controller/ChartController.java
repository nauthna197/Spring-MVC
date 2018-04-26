package com.fastfood.controller;


import ch.qos.logback.core.util.DatePatternToRegexUtil;
import com.fastfood.model.*;
import com.fastfood.service.OrderDetailService;
import com.fastfood.service.OrderService;
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

    @Autowired
    OrderService orderService;

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
    public List<DataPointDaily> getListChart15() throws Exception {
        Calendar cal = Calendar.getInstance();
        Date date = new Date();
        List<Date> listDate = new ArrayList<Date>();
        List<DataPointDaily> dataPointDailies = new ArrayList<DataPointDaily>();

        for (int i =0;i<7;i++){
            cal.add(Calendar.DATE,-1);
            Date dateAgo = cal.getTime();
            listDate.add(dateAgo);
        }

        for(Date date2: listDate){
            Long count2 = orderService.countByDaily(date2);
            DataPointDaily dataPointDaily = new DataPointDaily(date2,count2);
            dataPointDailies.add(dataPointDaily);
        }

        return dataPointDailies;
    }



}
