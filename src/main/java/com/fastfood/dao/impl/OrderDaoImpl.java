/**
 *
 */
package com.fastfood.dao.impl;

import com.fastfood.dao.OrderDao;
import com.fastfood.model.Order;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
    public Long countByDaily(Date date) {
        String hql = "select count(id)as id from Order where day(orderDate) = :day and month(orderDate) = :month";
        Query query = getSession().createQuery(hql);
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        query.setInteger("day",cal.get(Calendar.DATE));
        query.setInteger("month",cal.get(Calendar.MONTH)+1);

        return  (Long) query.uniqueResult();
    }

}
