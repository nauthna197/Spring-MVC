/**
 *
 */
package com.fastfood.dao.impl;

import com.fastfood.dao.CategoryDao;
import com.fastfood.dao.CustomerDao;
import com.fastfood.model.Category;
import com.fastfood.model.Customer;
import com.fastfood.model.User;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 * @author TuanAnh
 */
@Repository
public class CustomerDaoImpl extends GenericDaoImpl<Customer, Integer> implements CustomerDao {

    @Override
    public Customer getCustomerbyNumber(String number) {
        Criteria criteria = getSession().createCriteria(Customer.class);
        try {
            criteria.add(Restrictions.eq("number",number).ignoreCase());
            return (Customer)criteria.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }
}
