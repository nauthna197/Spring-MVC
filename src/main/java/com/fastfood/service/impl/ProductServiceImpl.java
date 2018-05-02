/**
 *
 */
package com.fastfood.service.impl;

import com.fastfood.dao.ProductDao;
import com.fastfood.model.Product;
import com.fastfood.model.ProductInfo;
import com.fastfood.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

/**
 * @author TuanAnh
 */
@Service
public class ProductServiceImpl extends GenericServiceImpl<Product, Integer> implements ProductService {
    ProductDao productDao;

    /**
     *
     */
    @Autowired
    public ProductServiceImpl(ProductDao productDao) {
        this.productDao = productDao;
    }

    @Override
    public List<Product> findAll(Integer offset, Integer maxResult) {
        return productDao.findAll(offset,maxResult);
    }

    @Override
    public Long count() {
        return productDao.count();
    }

    @Override
    public List<Product> getComboProduct() {
        return productDao.getComboProduct();
    }

    @Override
    public List<Product> getProductWithoutCombo() {
        return  productDao.getProductWithoutCombo();
    }

    @Override
    public boolean saveProduct(ProductInfo productInfo) throws IOException {
        return productDao.saveProduct(productInfo);
    }
}
