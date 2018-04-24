/**
 *
 */
package com.fastfood.dao.impl;

import com.fastfood.dao.OrderDetailDao;
import com.fastfood.model.OrderDetail;
import com.fastfood.model.Product;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

/**
 * @author TuanAnh
 */
@Repository
public class OrderDetailDaoImpl extends GenericDaoImpl<OrderDetail, Integer> implements OrderDetailDao {

    @Override
    public Long getDataPointAllMonth(Product product) {
        Query query = getSession().createQuery("select count(product_id) from OrderDetail where product_id = :id");
        query.setParameter("id",product.getId());
        return (Long) query.uniqueResult();

    }


}

