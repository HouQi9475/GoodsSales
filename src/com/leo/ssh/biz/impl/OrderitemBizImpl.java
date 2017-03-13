package com.leo.ssh.biz.impl;

import java.util.List;

import com.leo.ssh.biz.IOrderitemBiz;
import com.leo.ssh.dao.IOrderDao;
import com.leo.ssh.dao.IOrderitemDao;
import com.leo.ssh.domain.Orderitem;
import com.leo.ssh.page.PageBean;

public class OrderitemBizImpl implements IOrderitemBiz {

	private IOrderitemDao orderitemDao;
	
	
	

	public void setOrderitemDao(IOrderitemDao orderitemDao) {
		this.orderitemDao = orderitemDao;
	}

	@Override
	public PageBean findByPage(String strHQL, int currentPage, int pageSizes, Object... params) {
		// TODO Auto-generated method stub
		return this.orderitemDao.selsectByPage(strHQL, currentPage, pageSizes, params);
	}

	@Override
	public Orderitem findById(int orderid) {
		// TODO Auto-generated method stub
		return this.orderitemDao.selectById(orderid);
	}

	@Override
	public List findByHQL(String strHQL, Object... params) {
		// TODO Auto-generated method stub
		return this.orderitemDao.selectByHQL(strHQL, params);
	}

}
