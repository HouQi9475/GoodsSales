package com.leo.ssh.dao.impl;

import java.util.List;

import com.leo.ssh.base.dao.impl.HibernateGenericDao;
import com.leo.ssh.dao.IUsersDao;
import com.leo.ssh.domain.Admins;
import com.leo.ssh.domain.Users;

public class UsersDaoImpl extends HibernateGenericDao<Users, Integer> implements IUsersDao {

	@Override
	public boolean usernameExists(String useracount) {
		// TODO Auto-generated method stub
				String strHQL="select a from Users as a where a.useracount=?";
				//Object[] queryParams = {useracount};//设置参数对象数组
				List<Users> list=selectByHQL(strHQL, useracount);
				if(list != null && list.size() > 0){//如果list集合不为空
					return true;//返回List中的第一个存储对象
				}else{
				    return false;
				}
	}

}
