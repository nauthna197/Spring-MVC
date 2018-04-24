/**
 *
 */
package com.fastfood.dao.impl;

import com.fastfood.dao.EmployeeDao;
import com.fastfood.model.Employee;
import org.springframework.stereotype.Repository;

/**
 * @author TuanAnh
 */
@Repository
public class EmployeeDaoImpl extends GenericDaoImpl<Employee, Integer> implements EmployeeDao {

}
