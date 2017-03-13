package com.leo.ssh.biz.impl;

import java.util.List;

import com.leo.ssh.biz.ICommodityBiz;
import com.leo.ssh.dao.ICommodityDao;
import com.leo.ssh.dao.ICommodityclassDao;
import com.leo.ssh.domain.Commodity;
import com.leo.ssh.page.PageBean;

public class CommodityBizImpl implements ICommodityBiz {

	private ICommodityDao commodityDao;
	
	public void setCommodityDao(ICommodityDao commodityDao) {
		this.commodityDao = commodityDao;
	}
	@Override
	public List<Commodity> findAll() {
		// TODO Auto-generated method stub
		return this.commodityDao.selectAll();
	}
	@Override
	public List findByHQL(String strHQL, Object... params) {
		// TODO Auto-generated method stub
		return this.commodityDao.selectByHQL(strHQL, params);
	}
	@Override
	public PageBean findByPage(String strHQL, int currentPage, int pageSizes, Object... params) {
		// TODO Auto-generated method stub
		return this.commodityDao.selsectByPage(strHQL, currentPage, pageSizes, params);
	}
	@Override
	public void delete(Integer commodityId) {
		// TODO Auto-generated method stub
		this.commodityDao.delete(commodityId);
	}
	@Override
	public boolean add(Commodity commodity) {
		// TODO Auto-generated method stub
		return this.commodityDao.insert(commodity)!=null?true:false;
	}
	@Override
	public Commodity findById(Integer commodityId) {
		// TODO Auto-generated method stub
		return this.commodityDao.selectById(commodityId);
	}
	@Override
	public void update(Commodity commodity) {
		// TODO Auto-generated method stub
		this.commodityDao.update(commodity);
	}
	

}
