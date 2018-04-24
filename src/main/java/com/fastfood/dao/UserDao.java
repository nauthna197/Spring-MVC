/**
 *
 */
package com.fastfood.dao;

import com.fastfood.model.User;

/**
 * @author TuanAnh
 */
public interface UserDao extends GenericDao<User, Integer> {
    User checkLogin(String username, String password);
}
