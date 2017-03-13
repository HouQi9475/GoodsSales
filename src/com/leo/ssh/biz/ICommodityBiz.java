package com.leo.ssh.biz;

import java.util.List;

import com.leo.ssh.domain.Commodity;

public interface ICommodityBiz extends IBaseBiz {
   public abstract List<Commodity> findAll();
   public abstract void delete(final Integer commodityId);
   public abstract boolean add(final Commodity commodity);
   public abstract Commodity findById(final Integer commodityId);
   public void update(final Commodity commodity);
}
