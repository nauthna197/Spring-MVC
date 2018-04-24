/**
 *
 */
package com.fastfood.service;

import com.fastfood.model.OrderDetail;
import com.fastfood.model.Product;

/**
 * @author TuanAnh
 */
public interface OrderDetailService extends GenericService<OrderDetail, Integer> {
    Long getDataPointAllMonth(Product product);

}
