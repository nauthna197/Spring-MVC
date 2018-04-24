package com.fastfood.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;


/**
 * The persistent class for the order_detail database table.
 */
@Entity
@Table(name = "order_detail")
@NamedQuery(name = "OrderDetail.findAll", query = "SELECT o FROM OrderDetail o")
public class OrderDetail implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private double amount;

    private double price;

    private int quantity;

    //bi-directional many-to-one association to Order
    @ManyToOne
    @JsonIgnore
    private Order order;

    //bi-directional many-to-one association to Product
    @ManyToOne
    private Product product;

    public OrderDetail() {
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getAmount() {
        return this.amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public double getPrice() {
        return this.price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return this.quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Order getOrder() {
        return this.order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return this.product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

}