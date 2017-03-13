package com.leo.ssh.biz.impl;

import java.util.List;

import com.leo.ssh.biz.IAdminsBiz;
import com.leo.ssh.dao.IAdminsDao;
import com.leo.ssh.domain.Admins;
import com.leo.ssh.page.PageBean;

public class AdminsBizImpl implements IAdminsBiz {

	private IAdminsDao adminsDao;
	
	public void setAdminsDao(IAdminsDao adminsDao) {
		this.adminsDao = adminsDao;
	}

	@Override
	public Admins add(Admins admins) {
		// TODO Auto-generated method stub
		return this.adminsDao.insert(admins);
	}

	@Override
	public List<Admins> findAll() {
		// TODO Auto-generated method stub
		return this.adminsDao.selectAll();
	}

	@Override
	public List findByHQL(String strHQL, Object... params) {
		// TODO Auto-generated method stub
		return this.adminsDao.selectByHQL(strHQL, params);
	}

	@Override
	public PageBean findByPage(String strHQL, int currentPage, int pageSizes, Object... params) {
		// TODO Auto-generated method stub
		return this.adminsDao.selsectByPage(strHQL, currentPage, pageSizes, params);
	}

	@Override
	public void delete(Integer adminid) {
		// TODO Auto-generated method stub
		this.adminsDao.delete(adminid);
	}

	@Override
	public void update(Admins admins) {
		// TODO Auto-generated method stub
		this.adminsDao.update(admins);
	}

	@Override
	public Admins findById(Integer adminid) {
		// TODO Auto-generated method stub
		return this.adminsDao.selectById(adminid);
	}

	@Override
	public boolean usernameExists(String adminacount) {
		// TODO Auto-generated method stub
		return this.adminsDao.usernameExists(adminacount);
	}

}
