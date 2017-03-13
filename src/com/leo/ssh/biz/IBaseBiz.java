package com.leo.ssh.biz;

import java.util.List;

import com.leo.ssh.page.PageBean;

public interface IBaseBiz {
	public abstract List findByHQL(final String strHQL,final Object...params);
    public abstract PageBean findByPage(final String strHQL,final int currentPage,final int pageSizes,final Object...params);
}
