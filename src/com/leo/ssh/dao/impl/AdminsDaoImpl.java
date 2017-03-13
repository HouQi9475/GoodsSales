package com.leo.ssh.dao.impl;

import java.util.List;

import com.leo.ssh.base.dao.impl.HibernateGenericDao;
import com.leo.ssh.dao.IAdminsDao;
import com.leo.ssh.domain.Admins;

public class AdminsDaoImpl extends HibernateGenericDao<Admins, Integer> implements IAdminsDao {

	@Override
	public boolean usernameExists(String adminacount) {
		// TODO Auto-generated method stub
		String strHQL="select a from Admins as a where a.adminacount=?";
		//Object[] queryParams = {adminacount};//设置参数对象数组
		List<Admins> list=selectByHQL(strHQL, adminacount);
		if(list != null && list.size() > 0){//如果list集合不为空
			return true;//返回List中的第一个存储对象
		}else{
		    return false;
		}
	}
}
