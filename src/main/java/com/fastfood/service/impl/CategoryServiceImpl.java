/**
 *
 */
package com.fastfood.service.impl;

import com.fastfood.dao.CategoryDao;
import com.fastfood.model.Category;
import com.fastfood.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author TuanAnh
 */
@Service
public class CategoryServiceImpl extends GenericServiceImpl<Category, Integer> implements CategoryService {

    CategoryDao categoryDao;

    /**
     *
     */
    @Autowired
    public CategoryServiceImpl(CategoryDao categoryDao) {
        this.categoryDao = categoryDao;
    }


}
