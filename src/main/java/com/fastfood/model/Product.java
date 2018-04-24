package com.fastfood.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.List;


/**
 * The persistent class for the products database table.
 */
@Entity
@Table(name = "products")
@NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p")
public class Product implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)

    private int id;

    private byte[] image;

    @NotBlank(message = "Không được để trốngl !!!")
    private String name;

    @NotNull(message = "Không được để trống!")
    @Min(value = 0, message = "Số tiền không hợp lệ!")
    private double price;

    //bi-directional many-to-one association to OrderDetail
    @OneToMany(mappedBy = "product")
    @JsonIgnore
    private List<OrderDetail> orderDetails;

    //bi-directional many-to-one association to Category
    @ManyToOne
    @JoinColumn(name = "category")
    @JsonIgnore
    private Category categoryBean;


    public Product() {
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public byte[] getImage() {
        return this.image;
    }

    public void setImage(byte[] image) {
        this.image = image;
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

    public List<OrderDetail> getOrderDetails() {
        return this.orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public OrderDetail addOrderDetail(OrderDetail orderDetail) {
        getOrderDetails().add(orderDetail);
        orderDetail.setProduct(this);

        return orderDetail;
    }

    public OrderDetail removeOrderDetail(OrderDetail orderDetail) {
        getOrderDetails().remove(orderDetail);
        orderDetail.setProduct(null);

        return orderDetail;
    }

    public Category getCategoryBean() {
        return this.categoryBean;
    }

    public void setCategoryBean(Category categoryBean) {
        this.categoryBean = categoryBean;
    }

}