/**
 *
 */
package com.fastfood.service;

import com.fastfood.model.User;

/**
 * @author TuanAnh
 */
public interface UserService extends GenericService<User, Integer> {
    User checkLogin(String username, String password);
}
