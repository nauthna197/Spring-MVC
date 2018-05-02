/**
 *
 */
package com.fastfood.service.impl;

import com.fastfood.dao.CategoryDao;
import com.fastfood.dao.CustomerDao;
import com.fastfood.model.Customer;
import com.fastfood.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author TuanAnh
 */
@Service
public class CustomerServiceImpl extends GenericServiceImpl<Customer, Integer> implements CustomerService {

    CustomerDao customerDao;

    /**
     *
     */
    @Autowired
    public CustomerServiceImpl(CustomerDao customerDao){this.customerDao = customerDao;}


    @Override
    public Customer getCustomerbyNumber(String number) {
        return customerDao.getCustomerbyNumber(number);
    }
}
