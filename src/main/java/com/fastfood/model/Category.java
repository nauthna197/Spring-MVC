package com.fastfood.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * The persistent class for the category database table.
 */
@Entity
@NamedQuery(name = "Category.findAll", query = "SELECT c FROM Category c")
public class Category implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "category_id")
    private int categoryId;

    private String name;

    // bi-directional many-to-one association to Product
    @OneToMany(mappedBy = "categoryBean")
    private List<Product> products;

    public Category() {
    }

    public int getCategoryId() {
        return this.categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Product> getProducts() {
        return this.products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public Product addProduct(Product product) {
        getProducts().add(product);
        product.setCategoryBean(this);

        return product;
    }

    public Product removeProduct(Product product) {
        getProducts().remove(product);
        product.setCategoryBean(null);

        return product;
    }

}