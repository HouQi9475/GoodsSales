package com.leo.ssh.biz.impl;

import java.util.List;

import com.leo.ssh.biz.IUsersBiz;
import com.leo.ssh.dao.IUsersDao;
import com.leo.ssh.domain.Users;
import com.leo.ssh.page.PageBean;

public class UsersBizImpl implements IUsersBiz {

	private IUsersDao usersDao;
	
	public void setUsersDao(IUsersDao usersDao) {
		this.usersDao = usersDao;
	}

	@Override
	public List findByHQL(String strHQL, Object... params) {
		// TODO Auto-generated method stub
		return this.usersDao.selectByHQL(strHQL, params);
	}

	@Override
	public PageBean findByPage(String strHQL, int currentPage, int pageSizes, Object... params) {
		// TODO Auto-generated method stub
		return this.usersDao.selsectByPage(strHQL, currentPage, pageSizes, params);
	}

	@Override
	public Users add(Users users) {
		// TODO Auto-generated method stub
		return this.usersDao.insert(users);
	}

	@Override
	public List<Users> findAll() {
		// TODO Auto-generated method stub
		return this.usersDao.selectAll();
	}

	@Override
	public void delete(Integer userid) {
		// TODO Auto-generated method stub
		this.usersDao.delete(userid);
	}

	@Override
	public void update(Users users) {
		// TODO Auto-generated method stub
		this.usersDao.update(users);
	}

	@Override
	public Users findById(Integer userid) {
		// TODO Auto-generated method stub
		return this.usersDao.selectById(userid);
	}

	@Override
	public boolean usernameExists(String useracount) {
		// TODO Auto-generated method stub
		return this.usersDao.usernameExists(useracount);
	}

}
