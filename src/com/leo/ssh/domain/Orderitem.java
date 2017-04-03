package com.leo.ssh.domain;
// Generated 2017-4-3 19:26:36 by Hibernate Tools 4.0.1.Final

/**
 * Orderitem generated by hbm2java
 */
public class Orderitem implements java.io.Serializable {

	private Integer orderitemid;
	private Commodity commodity;
	private Orders orders;
	private Integer quantity;

	public Orderitem() {
	}

	public Orderitem(Commodity commodity, Orders orders) {
		this.commodity = commodity;
		this.orders = orders;
	}

	public Orderitem(Commodity commodity, Orders orders, Integer quantity) {
		this.commodity = commodity;
		this.orders = orders;
		this.quantity = quantity;
	}

	public Integer getOrderitemid() {
		return this.orderitemid;
	}

	public void setOrderitemid(Integer orderitemid) {
		this.orderitemid = orderitemid;
	}

	public Commodity getCommodity() {
		return this.commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	public Orders getOrders() {
		return this.orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public Integer getQuantity() {
		return this.quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

}
