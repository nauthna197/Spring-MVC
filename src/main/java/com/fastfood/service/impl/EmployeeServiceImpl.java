/**
 *
 */
package com.fastfood.service.impl;

import com.fastfood.dao.EmployeeDao;
import com.fastfood.model.Employee;
import com.fastfood.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author TuanAnh
 */
@Service
public class EmployeeServiceImpl extends GenericServiceImpl<Employee, Integer> implements EmployeeService {

    EmployeeDao employeeDao;

    /**
     *
     */
    @Autowired
    public EmployeeServiceImpl(EmployeeDao employeeDao) {
        this.employeeDao = employeeDao;
    }


}
