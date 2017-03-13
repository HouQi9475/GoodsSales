package com.leo.ssh.dao;

import com.leo.ssh.base.dao.IGenericDao;
import com.leo.ssh.domain.Users;

public interface IUsersDao extends IGenericDao<Users, Integer> {
	//检测用户名是否存在
			public boolean usernameExists(String useracount);
}
