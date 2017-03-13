package com.leo.ssh.base.dao;

import java.io.Serializable;
import java.util.List;

import com.leo.ssh.page.PageBean;

public interface IGenericDao<T extends Serializable, ID extends Serializable> {
    
	//添加
	public abstract T insert(final T entity);
	//按照ID主键查询检索
	public abstract T selectById(ID id);
	//更新
	public abstract void update(final T entity);
	//删除
	public abstract void delete(final ID id);
	//查询全部数据集合
	public abstract List<T> selectAll();
	//执行通用HQL语句
	public abstract List selectByHQL(final String strHQL,final Object...params);
	//分页显示
	public abstract PageBean selsectByPage(final String strHQL,int currentPage,int pageSizes,final Object...params);
	
}
