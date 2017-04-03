package com.leo.ssh.dao.impl;

import java.util.List;

import com.leo.ssh.base.dao.impl.HibernateGenericDao;
import com.leo.ssh.dao.IAdminsLoginDao;
import com.leo.ssh.domain.Admins;

public class AdminsLoginDaoImpl extends HibernateGenericDao<Admins, String> implements IAdminsLoginDao {

	@Override
	public Admins login(String adminacount, String adminpassword) {
		// TODO Auto-generated method stub
		if(adminacount!=null && adminpassword!=null){
			String hql = "select a from Admins as a where a.adminacount=? and a.adminpassword=?";//设置查询条件
			Object[] queryParams = {adminacount,adminpassword};//设置参数对象数组
			List<Admins> list=selectByHQL(hql, queryParams);
			if(list != null && list.size() > 0){//如果list集合不为空
				System.out.println("管理员类型id："+list.get(0).getAdminroles().getRolesid());
				return list.get(0);//返回List中的第一个存储对象
				
			}
			
		}
		return null;
	}

	

}
