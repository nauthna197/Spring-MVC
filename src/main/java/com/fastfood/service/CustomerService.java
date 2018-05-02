/**
 *
 */
package com.fastfood.service;

import com.fastfood.model.Customer;

/**
 * @author TuanAnh
 */
public interface CustomerService extends GenericService<Customer, Integer> {


    Customer getCustomerbyNumber(String number);
}
