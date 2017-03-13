package com.leo.ssh.biz.impl;

import java.util.List;

import com.leo.ssh.biz.IOrderBiz;
import com.leo.ssh.dao.IOrderDao;
import com.leo.ssh.domain.Order;
import com.leo.ssh.page.PageBean;

public class OrderBizImpl implements IOrderBiz {

	private IOrderDao orderDao;
	
	public void setOrderDao(IOrderDao orderDao) {
		this.orderDao = orderDao;
	}

	@Override
	public List findByHQL(String strHQL, Object... params) {
		// TODO Auto-generated method stub
		return this.orderDao.selectByHQL(strHQL, params);
	}

	@Override
	public PageBean findByPage(String strHQL, int currentPage, int pageSizes, Object... params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Order saveOrder(Order order) {
		// TODO Auto-generated method stub
		return this.orderDao.insert(order);
	}

	@Override
	public List<Order> findAll() {
		// TODO Auto-generated method stub
		return this.orderDao.selectAll();
	}

	@Override
	public Order findById(int userid) {
		// TODO Auto-generated method stub
		return this.orderDao.selectById(userid);
	}

}
