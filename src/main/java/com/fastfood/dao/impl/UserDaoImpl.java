/**
 *
 */
package com.fastfood.dao.impl;

import com.fastfood.dao.UserDao;
import com.fastfood.model.User;
import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;


/**
 * @author TuanAnh
 */
@Repository
public class UserDaoImpl extends GenericDaoImpl<User, Integer> implements UserDao {
    private static final Logger logger = Logger.getLogger(User.class);

    @Override
    public User checkLogin(String username, String password) {
        Criteria criteria = getSession().createCriteria(User.class);
        try {
            criteria.add(Restrictions.eq("username", username).ignoreCase());
            criteria.add(Restrictions.eq("password", password).ignoreCase());
            return (User)criteria.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }




}

