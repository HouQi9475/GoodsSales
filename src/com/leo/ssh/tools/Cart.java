package com.leo.ssh.tools;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.leo.ssh.domain.Commodity;
import com.leo.ssh.domain.Orderitem;

public class Cart {
	private Map items;

	public Map getItems() {
		return items;
	}

	public void setItems(Map items) {
		this.items = items;
	}

	public Cart() {
		// TODO Auto-generated constructor stub
		if (items == null) {
			items = new HashMap<Integer, Orderitem>();
		}
	}

	public void addCart(int commodityId, Orderitem orderitem) {
		if (items.containsKey(commodityId)) {
			Orderitem _orderitem = (Orderitem) items.get(commodityId);
			orderitem.setQuantity(_orderitem.getQuantity() + orderitem.getQuantity());
			items.put(commodityId, orderitem);
		} else {
			items.put(commodityId, orderitem);
		}
	}

	public void updateCart(int commodityId, int quantity) {
		Orderitem orderitem = new Orderitem();
		orderitem = (Orderitem) items.get(commodityId);
		System.out.println("update:" + quantity);

		orderitem.setQuantity(quantity);
		items.put(commodityId, orderitem);
	}

	public void deleteCart(int commodityId) {
		if (items.containsKey(commodityId)) {
			items.remove(commodityId);
		}

	}

	// 商品打折后价格
	public int getTotalPrice() {
		int totalPrice = 0;
		for (Iterator it = items.values().iterator(); it.hasNext();) {
			Orderitem orderitem = (Orderitem) it.next();
			Commodity commodity = orderitem.getCommodity();
			Integer quantity = orderitem.getQuantity();
			// totalPrice+=commodity.getFcPrice()*quantity;
			if (quantity >= 10 && quantity <= 99) {
				totalPrice += commodity.getFcPrice() * quantity * 0.9;
			} else if (quantity >= 100 && quantity <= 199) {
				totalPrice += commodity.getFcPrice() * quantity * 0.8;
			} else if (quantity >= 200) {
				totalPrice += commodity.getFcPrice() * quantity * 0.7;
			} else {
				totalPrice += commodity.getFcPrice() * quantity;
			}
		}
		return totalPrice;
	}

	// 商品原价
	public int yuanjia() {
		int price = 0;
		for (Iterator it = items.values().iterator(); it.hasNext();) {
			Orderitem orderitem = (Orderitem) it.next();
			Commodity commodity = orderitem.getCommodity();
			Integer quantity = orderitem.getQuantity();
			price += commodity.getFcPrice() * quantity;
		}
		return price;
	}
}
