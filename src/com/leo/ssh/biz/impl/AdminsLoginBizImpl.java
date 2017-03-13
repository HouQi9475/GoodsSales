package com.leo.ssh.biz.impl;

import com.leo.ssh.biz.IAdminsLoginBiz;
import com.leo.ssh.dao.IAdminsLoginDao;
import com.leo.ssh.domain.Admins;

public class AdminsLoginBizImpl implements IAdminsLoginBiz{
   private IAdminsLoginDao adminsLoginDao;

public void setAdminsLoginDao(IAdminsLoginDao adminsLoginDao) {
	this.adminsLoginDao = adminsLoginDao;
}

@Override
public Admins adminlogin(String adminacount, String adminpassword) {
	// TODO Auto-generated method stub
	return this.adminsLoginDao.login(adminacount, adminpassword);
}


}