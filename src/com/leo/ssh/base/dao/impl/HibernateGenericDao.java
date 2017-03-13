package com.leo.ssh.base.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.leo.ssh.page.PageBean;
import com.leo.ssh.base.dao.IGenericDao;
import com.leo.ssh.domain.Admins;

public class HibernateGenericDao<T extends Serializable,ID extends Serializable>
       implements IGenericDao<T, ID> {

	private Class<T> persisterClass; //存放传过来的类型，不是对象
	private SessionFactory sessionFactory; //声明一个SessionFactory对象

	
	//使用spring框架的依赖注入模式将spring框架中的LocalSessionFactoryBean对象注入到该类中
	
	//通过反射技术来获取到泛型中的类型并且赋给该属性
	@SuppressWarnings("unchecked")
	public HibernateGenericDao(){
		this.persisterClass=(Class<T>) ((ParameterizedType)this.getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public T insert(T entity) {
		// TODO Auto-generated method stub
		Session session=this.sessionFactory.getCurrentSession();
			session.save(entity);
			return entity;
	}

	@SuppressWarnings("unchecked")
	@Override
	//读操作不要关闭连接，在外围关
	public T selectById(ID id) {
		// TODO Auto-generated method stub
		Session session=this.sessionFactory.getCurrentSession();
		try{
			T entity=(T) session.get(this.persisterClass, id);
			return entity;
		}catch(RuntimeException e){
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public void update(T entity) {
		// TODO Auto-generated method stub
		Session session=this.sessionFactory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public void delete(ID id) {
		// TODO Auto-generated method stub
		Session session=this.sessionFactory.getCurrentSession();
			T entity=this.selectById(id);
			session.delete(entity);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> selectAll() {
		// TODO Auto-generated method stub
		    Session session=this.sessionFactory.getCurrentSession();
			Criteria criteria=session.createCriteria(persisterClass);
			return criteria.list();
	}
	@Override
	public PageBean selsectByPage(String strHQL, int currentPage,
			int pageSizes, Object... params) {
		// TODO Auto-generated method stub
		Session session=this.sessionFactory.openSession();
		PageBean pageBean=new PageBean();
		pageBean.setCurrentPage(currentPage);
		pageBean.setPageSizes(pageSizes);
		//Query 接口 hibernate查询检索
		//HQL 面向对象的查询语句
		//select *　from emp;  SQL
		//select e from EMP as e;  HQL  from后紧跟 实体类的名称   as产生一个对象  根据实体类产生一个对象e
		//SQL>select ename,job from emp where empno=888;
		//HQL>select e.ename,e.job from Emp as e where e.empno=888;
		//指定条件指定参数的查询检索
		Query query=session.createQuery(strHQL);
		for(int i=0;i<params.length;i++){
			query.setParameter(i, params[i]);
		}
		List lstObjects=query.list();
		pageBean.setTotalRows(lstObjects.size());
		query.setMaxResults(pageSizes);
		query.setFirstResult((currentPage-1)*pageSizes);
		List lstPageObjects=query.list();
		pageBean.setList(lstPageObjects);
		return pageBean;
	}
	@Override
	public List selectByHQL(String strHQL, Object... params) {
		// TODO Auto-generated method stub
		Session session=this.sessionFactory.getCurrentSession();
		Query query=session.createQuery(strHQL);
		for (int i = 0; i < params.length; i++) {
			query.setParameter(i, params[i]);
		}
		return query.list();
	}
	

}
