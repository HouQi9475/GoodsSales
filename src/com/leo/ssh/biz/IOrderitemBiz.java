package com.leo.ssh.biz;

import com.leo.ssh.domain.Orderitem;

public interface IOrderitemBiz extends IBaseBiz {
	public abstract Orderitem findById(final int orderid);
}
