package com.leo.ssh.biz;

import java.util.List;

import com.leo.ssh.domain.Bigcommodityclass;

public interface IBigcommodityclassBiz extends IBaseBiz {
	public abstract List<Bigcommodityclass> findAll();
	   public abstract boolean add(final Bigcommodityclass bigcommodityclass);
	   public abstract void delete(final Integer bigclassid);
	   public abstract Bigcommodityclass findById(final Integer bigclassid);
	   public abstract void update(final Bigcommodityclass bigcommodityclass);
}
