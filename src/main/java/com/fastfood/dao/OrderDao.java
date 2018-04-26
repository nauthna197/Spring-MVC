/**
 *
 */
package com.fastfood.dao;

import com.fastfood.model.Order;

import java.util.Date;
import java.util.List;

/**
 * @author TuanAnh
 */
public interface OrderDao extends GenericDao<Order, Integer> {
    List<Order> getListOrder();

    Long countOrderByStatus();

    Long countByDaily(Date date);

}
