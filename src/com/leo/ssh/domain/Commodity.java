package com.leo.ssh.domain;
// Generated 2017-4-3 19:26:36 by Hibernate Tools 4.0.1.Final

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Commodity generated by hbm2java
 */
public class Commodity implements java.io.Serializable {

	private Integer commodityId;
	private Commodityclass commodityclass;
	private String commodityName;
	private String manufacturer;
	private String commodityDepict;
	private BigDecimal commodityPrice;
	private Integer fcPrice;
	private Integer commodityAmount;
	private Integer commodityLeaveNum;
	private Date regTime;
	private String image;
	private Set orderitems = new HashSet(0);

	public Commodity() {
	}

	public Commodity(Commodityclass commodityclass, String commodityName, String manufacturer, String commodityDepict,
			BigDecimal commodityPrice, Integer fcPrice, Integer commodityAmount, Integer commodityLeaveNum,
			Date regTime, String image, Set orderitems) {
		this.commodityclass = commodityclass;
		this.commodityName = commodityName;
		this.manufacturer = manufacturer;
		this.commodityDepict = commodityDepict;
		this.commodityPrice = commodityPrice;
		this.fcPrice = fcPrice;
		this.commodityAmount = commodityAmount;
		this.commodityLeaveNum = commodityLeaveNum;
		this.regTime = regTime;
		this.image = image;
		this.orderitems = orderitems;
	}

	public Integer getCommodityId() {
		return this.commodityId;
	}

	public void setCommodityId(Integer commodityId) {
		this.commodityId = commodityId;
	}

	public Commodityclass getCommodityclass() {
		return this.commodityclass;
	}

	public void setCommodityclass(Commodityclass commodityclass) {
		this.commodityclass = commodityclass;
	}

	public String getCommodityName() {
		return this.commodityName;
	}

	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}

	public String getManufacturer() {
		return this.manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCommodityDepict() {
		return this.commodityDepict;
	}

	public void setCommodityDepict(String commodityDepict) {
		this.commodityDepict = commodityDepict;
	}

	public BigDecimal getCommodityPrice() {
		return this.commodityPrice;
	}

	public void setCommodityPrice(BigDecimal commodityPrice) {
		this.commodityPrice = commodityPrice;
	}

	public Integer getFcPrice() {
		return this.fcPrice;
	}

	public void setFcPrice(Integer fcPrice) {
		this.fcPrice = fcPrice;
	}

	public Integer getCommodityAmount() {
		return this.commodityAmount;
	}

	public void setCommodityAmount(Integer commodityAmount) {
		this.commodityAmount = commodityAmount;
	}

	public Integer getCommodityLeaveNum() {
		return this.commodityLeaveNum;
	}

	public void setCommodityLeaveNum(Integer commodityLeaveNum) {
		this.commodityLeaveNum = commodityLeaveNum;
	}

	public Date getRegTime() {
		return this.regTime;
	}

	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Set getOrderitems() {
		return this.orderitems;
	}

	public void setOrderitems(Set orderitems) {
		this.orderitems = orderitems;
	}

}
