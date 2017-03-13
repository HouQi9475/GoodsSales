package com.leo.ssh.dao;

import com.leo.ssh.base.dao.IGenericDao;
import com.leo.ssh.domain.Admins;

public interface IAdminsDao extends IGenericDao<Admins, Integer> {
	//检测用户名是否存在
		public boolean usernameExists(String adminacount);
}
