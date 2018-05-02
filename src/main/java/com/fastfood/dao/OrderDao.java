/**
 *
 */
package com.fastfood.dao;

import com.fastfood.model.Order;
import com.fastfood.model.User;

import java.util.Date;
import java.util.List;

/**
 * @author TuanAnh
 */
public interface OrderDao extends GenericDao<Order, Integer> {
    List<Order> getListOrder();

    List<Order> getOrderByUser(User user);

    List<Order> getOrderFilterd();

    Long countOrderByStatus();

    Long countByDaily(Date date);

    Double sumDaily(Date date);
}
