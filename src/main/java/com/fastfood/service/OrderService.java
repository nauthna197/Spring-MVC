/**
 *
 */
package com.fastfood.service;

import com.fastfood.model.Order;
import com.fastfood.model.User;

import java.util.Date;
import java.util.List;

/**
 * @author TuanAnh
 */
public interface OrderService extends GenericService<Order, Integer> {
    List<Order> getListOrder();

    List<Order> getOrderByUser(User user);

    Long countOrderByStatus();

    Long countByDaily(Date date);

    List<Order> getOrderFilterd();

    Double sumDaily(Date date);

}
