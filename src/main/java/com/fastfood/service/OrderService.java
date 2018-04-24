/**
 *
 */
package com.fastfood.service;

import com.fastfood.model.Order;

import java.util.List;

/**
 * @author TuanAnh
 */
public interface OrderService extends GenericService<Order, Integer> {
    List<Order> getListOrder();

    Long countOrderByStatus();

    List<Order> getListOrderByTime();
}
