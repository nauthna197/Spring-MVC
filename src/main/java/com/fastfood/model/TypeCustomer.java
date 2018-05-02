package com.fastfood.model;

import org.hibernate.validator.constraints.NotBlank;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.util.List;


/**
 * The persistent class for the type_customer database table.
 * 
 */
@Entity
@Table(name="type_customer")
@NamedQuery(name="TypeCustomer.findAll", query="SELECT t FROM TypeCustomer t")
public class TypeCustomer implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;


	@NotNull
	@Min(value = 10,message = "Bạn phải chọn ít nhất một mức giảm giá")
	private int discount;

	@NotBlank(message = "Trường này là bắt buộc")
	private String name;

	//bi-directional many-to-one association to Customer
	@OneToMany(mappedBy="typeCustomerBean")
	private List<Customer> customers;

	public TypeCustomer() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDiscount() {
		return this.discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Customer> getCustomers() {
		return this.customers;
	}

	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}

	public Customer addCustomer(Customer customer) {
		getCustomers().add(customer);
		customer.setTypeCustomerBean(this);

		return customer;
	}

	public Customer removeCustomer(Customer customer) {
		getCustomers().remove(customer);
		customer.setTypeCustomerBean(null);

		return customer;
	}

}