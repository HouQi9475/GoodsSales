package com.leo.ssh.action;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.leo.ssh.biz.IOrderBiz;
import com.leo.ssh.domain.Orders;
import com.leo.ssh.domain.Orderitem;
import com.leo.ssh.domain.Users;
import com.leo.ssh.page.PageBean;
import com.leo.ssh.tools.Cart;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

public class OrderAction extends BaseAction implements ModelDriven<Orders> {

	private Orders order;
	private IOrderBiz orderBiz;
	private final int status=0;
	private final int setstatus=1;
	private int currentPage;
	private int newtotal;
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public void setOrder(Orders order) {
		this.order = order;
	}
	public void setOrderBiz(IOrderBiz orderBiz) {
		this.orderBiz = orderBiz;
	}
	@Override
	public Orders getModel() {
		// TODO Auto-generated method stub
		return this.order;
	}
	
	//提交订单
	public String checkOut() throws Exception{
		Map session=(Map)ActionContext.getContext().getSession();
		Cart cart=(Cart) session.get("cart");
		if(cart==null){
			this.addActionError("空订单别乱提交！");
			return "index";
		}
		Users users=(Users) session.get("users");
		int total=(int) session.get("n");
		if(users==null){
			return Action.ERROR;
		}
		Orders order=new Orders();
		order.setOrderdate(new Timestamp(new Date().getTime()));
		order.setUsers(users);
		order.setName(this.order.getName());
		order.setPhone(this.order.getPhone());
		order.setAddress(this.order.getAddress());
		order.setTotalPrice(total);
		order.setStatus(status);
		for(Iterator iter=cart.getItems().values().iterator();iter.hasNext();){
			Orderitem orderitem=(Orderitem) iter.next();
			orderitem.getCommodity().setCommodityLeaveNum(orderitem.getCommodity().getCommodityLeaveNum()-orderitem.getQuantity());
			order.getOrderitems().add(orderitem);
			orderitem.setOrders(order);;
		}
		orderBiz.saveOrder(order);
		Map request=(Map) ActionContext.getContext().get("request");
		request.put("order", order);
		session.put("order", order);
		session.remove("cart");
		session.remove("n");
		session.remove("y");
		return Action.SUCCESS;
	}
	public String findAll() throws Exception{
		Map session=(Map)ActionContext.getContext().getSession();
		Users users=(Users) session.get("users");
		if(users==null){
			return Action.ERROR;
		}
		String sql1="select o from Orders as o where o.users.userid=?";
		int userid=users.getUserid();
		System.out.println("用户ID"+userid);
		List<Orders> orders=orderBiz.findByHQL(sql1, userid);
		String a=this.getRequest().getParameter("orderid");
		System.out.println("订单ID："+a);
		this.getRequest().setAttribute("orders", orders);
		return Action.SUCCESS;
	}
	public String ordersfindByStatus() throws Exception{
		String strHQL="select o from Orders as o where o.status=0";
		System.out.println("查询未发货订单SQL："+strHQL);
		Object[] params = new Object[] {};
		if (currentPage == 0) {
			currentPage = 1;
		}
		PageBean pageBean = this.orderBiz.findByPage(strHQL, currentPage, 5, params);
		if(pageBean.getTotalRows()==0){
			return Action.ERROR+"sum0";
		}
		this.getRequest().setAttribute("orderstatus", pageBean);
		return Action.SUCCESS;
	}
	public String findAllOrders() throws Exception{
		String strHQL="select o from Orders as o where";
		strHQL=strHQL.substring(0, strHQL.length()-5);
		System.out.println("查询订单SQL："+strHQL);
		Object[] params = new Object[] {};
		if (currentPage == 0) {
			currentPage = 1;
		}
		PageBean pageBean = this.orderBiz.findByPage(strHQL, currentPage, 5, params);
		
		this.getRequest().setAttribute("orders", pageBean);
		/*List<Order> orders=this.orderBiz.findAll();
		this.getRequest().setAttribute("orders", orders);*/
		return Action.SUCCESS;
	}
	public String setStatus() throws Exception{
		Orders orders=orderBiz.findById(this.order.getOrderid());
		orders.setStatus(this.setstatus);
		orderBiz.saveOrder(orders);
		this.getRequest().setAttribute("orders", orders);
		return Action.SUCCESS;
	}
	public String findById() throws Exception{
		Map session=(Map)ActionContext.getContext().getSession();
		Users users=(Users) session.get("users");
		int userid=users.getUserid();
		System.out.println(userid);
		Orders order= this.orderBiz.findById(userid);
		this.getRequest().setAttribute("lstOrder", order);
		return Action.SUCCESS;
	}
	

}
