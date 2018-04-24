package com.fastfood.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.List;


/**
 * The persistent class for the users database table.
 */
@Entity
@Table(name = "users")
@NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
public class User implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;


    @Size(min = 6, max = 50, message = "Trên 6 ký tự và dưới 50 ký tự")
    @NotBlank(message = "Không được để trống !!!")
    private String address;


    @NotBlank(message = "Không được để trống !!!")
    @Email(message = "Không đúng định dạng email")
    private String email;

    @Size(min = 6, max = 50, message = "Trên 6 ký tự và dưới 50 ký tự")
    @NotBlank(message = "Không được để trống !!!")
    private String fullname;

    private String gender;

    @Size(min = 10, max = 12, message = "Số diện thoại chỉ có thể nhập được 10 số đến 12 số")
    @NotBlank(message = "Không được để trống !!!")
    private String number;

    @Size(min = 6, max = 50, message = "Trên 6 ký tự và dưới 50 ký tự")
    @NotBlank(message = "Không được để trống !!!")
    private String password;

    @NotNull(message = "Không được để trống !!!")
    private int role;

    @Size(min = 6, max = 50, message = "Trên 6 ký tự và dưới 50 ký tự")
    @NotBlank(message = "Không được để trống !!!")
    private String username;

    //bi-directional many-to-one association to Order
    @OneToMany(mappedBy = "user")
    @JsonIgnore
    private List<Order> orders;

    public User() {
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullname() {
        return this.fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getGender() {
        return this.gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getNumber() {
        return this.number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return this.role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public List<Order> getOrders() {
        return this.orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public Order addOrder(Order order) {
        getOrders().add(order);
        order.setUser(this);

        return order;
    }

    public Order removeOrder(Order order) {
        getOrders().remove(order);
        order.setUser(null);

        return order;
    }

}