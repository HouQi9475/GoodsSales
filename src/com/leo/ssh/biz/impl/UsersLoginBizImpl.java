package com.leo.ssh.biz.impl;

import com.leo.ssh.biz.IUsersLoginBiz;
import com.leo.ssh.dao.IUsersLoginDao;
import com.leo.ssh.domain.Users;

public class UsersLoginBizImpl implements IUsersLoginBiz {
    private IUsersLoginDao usersLoginDao;
    
	public void setUsersLoginDao(IUsersLoginDao usersLoginDao) {
		this.usersLoginDao = usersLoginDao;
	}

	@Override
	public Users usersLogin(String useracount, String userpasswork) {
		// TODO Auto-generated method stub
		return this.usersLoginDao.login(useracount, userpasswork);
	}

}
