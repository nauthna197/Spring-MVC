package com.fastfood.model;

import javax.persistence.*;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the orders database table.
 */
@Entity
@Table(name = "orders")
@NamedQuery(name = "Order.findAll", query = "SELECT o FROM Order o")
public class Order implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private double amount;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "order_date")
    private Date orderDate;


    @Column(name = "order_num")
    private int orderNum;

    private int status;


    //bi-directional many-to-one association to OrderDetail
    @OneToMany(mappedBy = "order")
    private List<OrderDetail> orderDetails;


    //bi-directional many-to-one association to User
    @ManyToOne
    @JoinColumn(name = "id_user")
    private User user;


    public Order() {
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

    public String getOrderDate() {
        DateFormat df = new SimpleDateFormat("dd/MM HH:mm");
        return df.format(this.orderDate);
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getOrderNum() {
        return this.orderDetails.size();
    }

    public void setOrderNum(int orderNum) {
        this.orderNum = orderNum;
    }

    public List<OrderDetail> getOrderDetails() {
        return this.orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public OrderDetail addOrderDetail(OrderDetail orderDetail) {
        getOrderDetails().add(orderDetail);
        orderDetail.setOrder(this);

        return orderDetail;
    }

    public OrderDetail removeOrderDetail(OrderDetail orderDetail) {
        getOrderDetails().remove(orderDetail);
        orderDetail.setOrder(null);

        return orderDetail;
    }

    public User getUser() {
        return this.user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }


}