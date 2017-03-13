package com.leo.ssh.biz.impl;

import java.util.List;

import com.leo.ssh.biz.IBigcommodityclassBiz;
import com.leo.ssh.dao.IBigcommodityclassDao;
import com.leo.ssh.domain.Bigcommodityclass;
import com.leo.ssh.page.PageBean;

public class BigcommodityclassBizImpl implements IBigcommodityclassBiz {
	
	private IBigcommodityclassDao bigcommodityclassDao;

	
	public void setBigcommodityclassDao(IBigcommodityclassDao bigcommodityclassDao) {
		this.bigcommodityclassDao = bigcommodityclassDao;
	}

	@Override
	public List findByHQL(String strHQL, Object... params) {
		// TODO Auto-generated method stub
		return this.bigcommodityclassDao.selectByHQL(strHQL, params);
	}

	@Override
	public PageBean findByPage(String strHQL, int currentPage, int pageSizes, Object... params) {
		// TODO Auto-generated method stub
		return this.bigcommodityclassDao.selsectByPage(strHQL, currentPage, pageSizes, params);
	}

	@Override
	public List<Bigcommodityclass> findAll() {
		// TODO Auto-generated method stub
		return this.bigcommodityclassDao.selectAll();
	}

	@Override
	public boolean add(Bigcommodityclass bigcommodityclass) {
		// TODO Auto-generated method stub
		return this.bigcommodityclassDao.insert(bigcommodityclass)!=null?true:false;
	}

	@Override
	public void delete(Integer bigclassid) {
		// TODO Auto-generated method stub
         this.bigcommodityclassDao.delete(bigclassid);
	}

	@Override
	public Bigcommodityclass findById(Integer bigclassid) {
		// TODO Auto-generated method stub
		return this.bigcommodityclassDao.selectById(bigclassid);
	}

	@Override
	public void update(Bigcommodityclass bigcommodityclass) {
		// TODO Auto-generated method stub
         this.bigcommodityclassDao.update(bigcommodityclass);
	}

}
