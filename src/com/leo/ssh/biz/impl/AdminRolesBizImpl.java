package com.leo.ssh.biz.impl;

import java.util.List;

import com.leo.ssh.biz.IAdminRolesBiz;
import com.leo.ssh.dao.IAdminRolesDao;
import com.leo.ssh.domain.Adminroles;

public class AdminRolesBizImpl implements IAdminRolesBiz {

	private IAdminRolesDao adminRolesDao;
	
	public void setAdminRolesDao(IAdminRolesDao adminRolesDao) {
		this.adminRolesDao = adminRolesDao;
	}

	@Override
	public List<Adminroles> findAll() {
		// TODO Auto-generated method stub
		return this.adminRolesDao.selectAll();
	}

}
