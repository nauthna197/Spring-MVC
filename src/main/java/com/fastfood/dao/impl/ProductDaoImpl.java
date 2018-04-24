/**
 *
 */
package com.fastfood.dao.impl;

import com.fastfood.dao.ProductDao;
import com.fastfood.model.Product;
import com.fastfood.model.ProductInfo;
import org.hibernate.criterion.Projections;
import org.springframework.stereotype.Repository;

import java.io.IOException;
import java.util.List;


/**
 * @author TuanAnh
 */
@Repository
public class ProductDaoImpl extends GenericDaoImpl<Product, Integer> implements ProductDao {

    @Override
    public List<Product> findAll(Integer offset, Integer maxResult) {
        return getSession().createCriteria(Product.class)
                .setFirstResult(offset != null ? offset : 0)
                .setMaxResults(maxResult!=null?maxResult:4)
                .list();
    }

    @Override
    public Long count() {
        return (Long)getSession().createCriteria(Product.class)
                .setProjection(Projections.rowCount())
                .uniqueResult();
    }

    @Override
    public boolean saveProduct(ProductInfo productInfo) throws IOException {
        Product product = new Product();
        if (productInfo.getFileData() != null) {
            byte[] image = productInfo.getFileData().getBytes();
            if (image != null && image.length > 0) {
                product.setImage(image);
            }
        }
        product.setName(productInfo.getName());
        product.setPrice(productInfo.getPrice());
        product.setCategoryBean(productInfo.getCategoryBean());
        try {
            getSession().persist(product);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

}
