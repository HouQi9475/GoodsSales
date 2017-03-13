package com.leo.ssh.biz;

import java.util.List;

import com.leo.ssh.domain.Order;

public interface IOrderBiz extends IBaseBiz{
    public abstract Order saveOrder(final Order order);
    public abstract List<Order> findAll();
    public abstract Order findById(final int userid);
}
