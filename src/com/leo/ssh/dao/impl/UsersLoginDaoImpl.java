package com.leo.ssh.dao.impl;

import java.util.List;

import com.leo.ssh.base.dao.impl.HibernateGenericDao;
import com.leo.ssh.dao.IUsersLoginDao;
import com.leo.ssh.domain.Users;
import com.leo.ssh.tools.md5;

public class UsersLoginDaoImpl extends HibernateGenericDao<Users, String> implements IUsersLoginDao {

	@Override
	public Users login(String useracount, String userpasswork) {
		md5 m=new md5();
		try {
			String news=m.EncoderByMd5(userpasswork);
			userpasswork=news;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
