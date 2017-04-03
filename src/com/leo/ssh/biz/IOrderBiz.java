package com.leo.ssh.biz;

import java.util.List;

import com.leo.ssh.domain.Orders;

public interface IOrderBiz extends IBaseBiz{
    public abstract Orders saveOrder(final Orders order);
    public abstract List<Orders> findAll();
    public abstract Orders findById(final int userid);
}
