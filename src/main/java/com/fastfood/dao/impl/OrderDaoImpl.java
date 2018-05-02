/**
 *
 */
package com.fastfood.dao.impl;

import com.fastfood.dao.OrderDao;
import com.fastfood.model.Order;
import com.fastfood.model.User;
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
        String hql = "from Order where day(orderDate) = day(curdate()) and month(orderDate) = month(curdate()) order by orderDate";
        Query query = getSession().createQuery(hql);
        return  query.list();
    }

    @Override
    public List<Order> getOrderByUser(User user) {
        Criteria criteria = getSession().createCriteria(Order.class);
        try {
            criteria.add(Restrictions.eq("user",user));
            criteria.addOrder(org.hibernate.criterion.Order.asc("status"));
        }catch (Exception e){
            e.printStackTrace();
        }
        return criteria.list();
    }

    @Override
    public List<Order> getOrderFilterd() {
        Criteria criteria = getSession().createCriteria(Order.class);
        try {
            criteria.addOrder(org.hibernate.criterion.Order.desc("orderDate"));
        }catch (Exception e){
            e.printStackTrace();
        }
        return criteria.list();
    }

    @Override
    public Long countOrderByStatus() {
        Criteria criteria = getSession().createCriteria(Order.class);
        try {
            criteria.add(Restrictions.eq("status",1));
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

    @Override
    public Double sumDaily(Date date) {
        String hql = "select sum(amount)as amount from Order where day(orderDate) = :day and month(orderDate) = :month and status = 3";
        Query query = getSession().createQuery(hql);
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        query.setInteger("day",cal.get(Calendar.DATE));
        query.setInteger("month",cal.get(Calendar.MONTH)+1);

        return  (Double) query.uniqueResult();
    }

}
