/**
 *
 */
package com.fastfood.service.impl;

import com.fastfood.dao.OrderDetailDao;
import com.fastfood.model.OrderDetail;
import com.fastfood.model.Product;
import com.fastfood.service.OrderDetailService;
import org.springframework.stereotype.Service;

/**
 * @author TuanAnh
 */
@Service
public class OrderDetailServiceImpl extends GenericServiceImpl<OrderDetail, Integer> implements OrderDetailService {
    OrderDetailDao orderDetailDao;

    /**
     *
     */
    public OrderDetailServiceImpl(OrderDetailDao orderDetailDao) {
        this.orderDetailDao = orderDetailDao;
    }

    @Override
    public Long getDataPointAllMonth(Product product) {
        return orderDetailDao.getDataPointAllMonth(product);
    }
}
