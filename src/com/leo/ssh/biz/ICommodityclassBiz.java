package com.leo.ssh.biz;

import java.util.List;

import com.leo.ssh.domain.Commodityclass;

public interface ICommodityclassBiz extends IBaseBiz {
   public abstract List<Commodityclass> findAll();
   public abstract boolean add(final Commodityclass commodityclass);
   public abstract void delete(final Integer commodityClassId);
   public abstract Commodityclass findById(final Integer commodityClassId);
   public abstract void update(final Commodityclass commodityclass);
}
