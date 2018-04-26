/**
 *
 */
package com.fastfood.service.impl;

import com.fastfood.dao.OrderDao;
import com.fastfood.model.Order;
import com.fastfood.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author TuanAnh
 */
@Service
public class OrderServiceImpl extends GenericServiceImpl<Order, Integer> implements OrderService {
    OrderDao orderDao;

    /**
     *
     */
    @Autowired
    public OrderServiceImpl(OrderDao orderDao) {
        this.orderDao = orderDao;
    }

    @Override
    public List<Order> getListOrder() {
        return  orderDao.getListOrder();
    }

    @Override
    public Long countOrderByStatus() {
        return orderDao.countOrderByStatus();
    }

    @Override
    public Long countByDaily(Date date) {
        return orderDao.countByDaily(date);
    }

}
