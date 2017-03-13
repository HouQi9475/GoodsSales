package com.leo.ssh.biz.impl;

import java.util.List;

import com.leo.ssh.biz.ICommodityclassBiz;
import com.leo.ssh.dao.ICommodityclassDao;
import com.leo.ssh.domain.Commodityclass;
import com.leo.ssh.page.PageBean;

public class CommodityclassBizImpl implements ICommodityclassBiz {
    private ICommodityclassDao commodityclassDao;
    
	public void setCommodityclassDao(ICommodityclassDao commodityclassDao) {
		this.commodityclassDao = commodityclassDao;
	}
	@Override
	public List<Commodityclass> findAll() {
		// TODO Auto-generated method stub
		return this.commodityclassDao.selectAll();
	}
	@Override
	public boolean add(Commodityclass commodityclass) {
		// TODO Auto-generated method stub
		return this.commodityclassDao.insert(commodityclass)!=null?true:false;
	}



	@Override
	public List findByHQL(String strHQL, Object... params) {
		// TODO Auto-generated method stub
		return this.commodityclassDao.selectByHQL(strHQL, params);
	}



	@Override
	public PageBean findByPage(String strHQL, int currentPage, int pageSizes, Object... params) {
		// TODO Auto-generated method stub
		return this.commodityclassDao.selsectByPage(strHQL, currentPage, pageSizes, params);
	}



	@Override
	public void delete(Integer commodityClassId) {
		// TODO Auto-generated method stub
		this.commodityclassDao.delete(commodityClassId);
	}



	@Override
	public Commodityclass findById(Integer commodityClassId) {
		// TODO Auto-generated method stub
		return this.commodityclassDao.selectById(commodityClassId);
	}



	@Override
	public void update(Commodityclass commodityclass) {
		// TODO Auto-generated method stub
		this.commodityclassDao.update(commodityclass);
	}

}
