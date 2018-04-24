/**
 *
 */
package com.fastfood.service.impl;

import com.fastfood.dao.UserDao;
import com.fastfood.model.User;
import com.fastfood.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author TuanAnh
 */
@Service
public class UsersServiceImpl extends GenericServiceImpl<User, Integer> implements UserService {
    UserDao userDao;

    /**
     *
     */
    @Autowired
    public UsersServiceImpl(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public User checkLogin(String username, String password) {
        return userDao.checkLogin(username, password);
    }


}
