/**
 *
 */
package com.fastfood.dao.impl;

import com.fastfood.dao.OrderDao;
import com.fastfood.model.Order;
import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author TuanAnh
 */
@Repository
public class OrderDaoImpl extends GenericDaoImpl<Order, Integer> implements OrderDao {


    @Override
    public List<Order> getListOrder() {
        Criteria criteria = getSession().createCriteria(Order.class);
        try {
            criteria.add(Restrictions.eq("status", 1));
        }catch (Exception e){
            e.printStackTrace();
        }
        return criteria.list();
    }

    @Override
    public Long countOrderByStatus() {
        Criteria criteria = getSession().createCriteria(Order.class);
        try {
            criteria.setProjection(Projections.rowCount());
        }catch (Exception e){
            e.printStackTrace();
        }
        return  (Long) criteria.uniqueResult();
    }

    @Override
    public List<Order> getListOrderByTime() {
        Criteria criteria = getSession().createCriteria(Order.class);
        try {

        }catch (Exception e){
            e.printStackTrace();
        }
        return  criteria.list();
    }
}
