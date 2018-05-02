/**
 *
 */
package com.fastfood.dao;

import com.fastfood.model.Category;
import com.fastfood.model.Customer;

/**
 * @author TuanAnh
 */
public interface CustomerDao extends GenericDao<Customer, Integer> {

    Customer getCustomerbyNumber(String number);

}
