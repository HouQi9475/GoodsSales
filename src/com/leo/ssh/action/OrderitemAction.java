package com.leo.ssh.action;

import java.util.List;
import java.util.Map;

import com.leo.ssh.biz.IOrderBiz;
import com.leo.ssh.biz.IOrderitemBiz;
import com.leo.ssh.domain.Admins;
import com.leo.ssh.domain.Orders;
import com.leo.ssh.domain.Orderitem;
import com.leo.ssh.domain.Users;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

public class OrderitemAction extends BaseAction implements ModelDriven<Orderitem> {

	private Orderitem orderitem;
	private IOrderitemBiz orderitemBiz;
	private IOrderBiz orderBiz;
	private int orderid;
	


	

	public int getOrderid() {
		return orderid;
	}


	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}


	public void setOrderBiz(IOrderBiz orderBiz) {
		this.orderBiz = orderBiz;
	}


	public void setOrderitem(Orderitem orderitem) {
		this.orderitem = orderitem;
	}


	public void setOrderitemBiz(IOrderitemBiz orderitemBiz) {
		this.orderitemBiz = orderitemBiz;
	}


	@Override
	public Orderitem getModel() {
		// TODO Auto-generated method stub
		return this.orderitem;
	}
 
	public String findById() throws Exception{
		Map session=(Map)ActionContext.getContext().getSession();
		Users users=(Users) session.get("users");
		System.out.println(users.getUseracount());
		Orders order=(Orders) session.get("order");
		System.out.println(order.getOrderid());
		order.setUsers(users);
		Orderitem orderitem=new Orderitem();
		orderitem.setOrders(order);
		System.out.println(orderitem.getOrderitemid());
		session.put("orderitem", orderitem);
		return Action.SUCCESS;
	}
	public String adminFindAll() throws Exception{
		String sql1="select o from Orderitem as o where o.orders.orderid=?";
		List<Orderitem> orderitems=orderitemBiz.findByHQL(sql1, orderid);
		System.out.println("orderid="+orderid);
		System.out.println(orderitems.size());
		this.getRequest().setAttribute("orderitems", orderitems);
		return Action.SUCCESS;
	}
	public String findAll() throws Exception{
		Map session=(Map)ActionContext.getContext().getSession();
		Users users=(Users) session.get("users");
		if(users==null){
			return Action.ERROR;
		}
			String sql1="select o from Orderitem as o where o.orders.orderid=?";
			List<Orderitem> orderitems=orderitemBiz.findByHQL(sql1, orderid);
			System.out.println("orderid="+orderid);
			System.out.println(orderitems.size());
			this.getRequest().setAttribute("orderitems", orderitems);
			return Action.SUCCESS;
		
		
	}
}
