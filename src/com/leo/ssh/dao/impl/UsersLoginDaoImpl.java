package com.leo.ssh.dao.impl;

import java.util.List;

import com.leo.ssh.base.dao.impl.HibernateGenericDao;
import com.leo.ssh.dao.IUsersLoginDao;
import com.leo.ssh.domain.Users;

public class UsersLoginDaoImpl extends HibernateGenericDao<Users, String> implements IUsersLoginDao {

	@Override
	public Users login(String useracount, String userpasswork) {
		// TODO Auto-generated method stub
		if(useracount!=null && userpasswork!=null){
			String hql = "select a from Users as a where a.useracount=? and a.userpasswork=?";//设置查询条件
			Object[] queryParams = {useracount,userpasswork};//设置参数对象数组
			List<Users> list=selectByHQL(hql, queryParams);
			if(list != null && list.size() > 0){//如果list集合不为空
				return list.get(0);//返回List中的第一个存储对象
			}
			
		}
		return null;
	}

	

}
