package com.fastfood.model;

import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;


/**
 * The persistent class for the products database table.
 */

public class ProductInfo implements Serializable {
    private static final long serialVersionUID = 1L;


    private MultipartFile fileData;
    private String name;
    private double price;
    private int id;
    private Category categoryBean;

    public ProductInfo() {
    }

    public static long getSerialVersionUID() {

        return serialVersionUID;
    }

    public MultipartFile getFileData() {
        return fileData;
    }

    public void setFileData(MultipartFile fileData) {
        this.fileData = fileData;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return this.price;
    }

    public void setPrice(double price) {
        this.price = price;
    }


    public Category getCategoryBean() {
        return this.categoryBean;
    }

    public void setCategoryBean(Category categoryBean) {
        this.categoryBean = categoryBean;
    }

}