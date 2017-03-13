package com.leo.ssh.action;

import java.util.List;
import java.util.Map;

import com.leo.ssh.biz.IBigcommodityclassBiz;
import com.leo.ssh.domain.Bigcommodityclass;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

public class BigcommodityclassAction extends BaseAction implements ModelDriven<Bigcommodityclass> {

	private Bigcommodityclass bigcommodityclass;
	private IBigcommodityclassBiz bigcommodityclassBiz;
	
	
	public void setBigcommodityclass(Bigcommodityclass bigcommodityclass) {
		this.bigcommodityclass = bigcommodityclass;
	}


	public void setBigcommodityclassBiz(IBigcommodityclassBiz bigcommodityclassBiz) {
		this.bigcommodityclassBiz = bigcommodityclassBiz;
	}


	@Override
	public Bigcommodityclass getModel() {
		// TODO Auto-generated method stub
		return this.bigcommodityclass;
	}

	public String findAll() throws Exception{
		Map session=(Map)ActionContext.getContext().getSession();
		List<Bigcommodityclass> lstBigclass=this.bigcommodityclassBiz.findAll();
		this.getRequest().setAttribute("lstBigclass", lstBigclass);
		session.put("lstBigclass", lstBigclass);
		return Action.SUCCESS;
	}
}
