/**
 *
 */
package com.fastfood.dao;

import com.fastfood.model.OrderDetail;
import com.fastfood.model.Product;

/**
 * @author TuanAnh
 */
public interface OrderDetailDao extends GenericDao<OrderDetail, Integer> {

    Long getDataPointAllMonth(Product product);

}
