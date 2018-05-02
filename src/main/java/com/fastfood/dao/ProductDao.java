/**
 *
 */
package com.fastfood.dao;

import com.fastfood.model.Product;
import com.fastfood.model.ProductInfo;

import java.io.IOException;
import java.util.List;

/**
 * @author TuanAnh
 */
public interface ProductDao extends GenericDao<Product, Integer> {
    public List<Product> findAll(Integer offset, Integer maxResult);
    public Long count();

    public List<Product> getComboProduct();

    public List<Product> getProductWithoutCombo();

    boolean saveProduct(ProductInfo productInfo) throws IOException;
}
