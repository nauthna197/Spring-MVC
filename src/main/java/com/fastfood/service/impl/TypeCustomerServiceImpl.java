/**
 *
 */
package com.fastfood.service.impl;

import com.fastfood.dao.TypeCustomerDao;
import com.fastfood.model.TypeCustomer;
import com.fastfood.service.TypeCustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author TuanAnh
 */
@Service
public class TypeCustomerServiceImpl extends GenericServiceImpl<TypeCustomer, Integer> implements TypeCustomerService {

    TypeCustomerDao typeCustomerDao;

    /**
     *
     */
    @Autowired
    public TypeCustomerServiceImpl(TypeCustomerDao typeCustomerDao){this.typeCustomerDao = typeCustomerDao;}


}
