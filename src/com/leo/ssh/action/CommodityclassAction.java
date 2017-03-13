package com.leo.ssh.action;

import java.util.List;

import com.leo.ssh.page.PageBean;
import com.leo.ssh.biz.IBigcommodityclassBiz;
import com.leo.ssh.biz.ICommodityclassBiz;
import com.leo.ssh.domain.Bigcommodityclass;
import com.leo.ssh.domain.Commodityclass;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class CommodityclassAction extends BaseAction implements ModelDriven<Commodityclass> {

	private Commodityclass commodityclass;
	private ICommodityclassBiz commodityclassBiz;
	private IBigcommodityclassBiz bigcommodityclassBiz;
	private int code;
	private int currentPage;
	private String commodityClassIds;
	
	
	public void setBigcommodityclassBiz(IBigcommodityclassBiz bigcommodityclassBiz) {
		this.bigcommodityclassBiz = bigcommodityclassBiz;
	}

	public String getCommodityClassIds() {
		return commodityClassIds;
	}

	public void setCommodityClassIds(String commodityClassIds) {
		this.commodityClassIds = commodityClassIds;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setCommodityclass(Commodityclass commodityclass) {
		this.commodityclass = commodityclass;
	}

	public void setCommodityclassBiz(ICommodityclassBiz commodityclassBiz) {
		this.commodityclassBiz = commodityclassBiz;
	}

	@Override
	public Commodityclass getModel() {
		// TODO Auto-generated method stub
		return this.commodityclass;
	}

	public String findAll() throws Exception{
		List<Commodityclass> lstCommodityclass=this.commodityclassBiz.findAll();
		this.getRequest().setAttribute("lstCommodityclass", lstCommodityclass);
		return Action.SUCCESS;
	}
	public String add() throws Exception{
		boolean flag=this.commodityclassBiz.add(commodityclass);
		return flag?Action.SUCCESS:Action.ERROR;
	}
	public String delete() throws Exception{
		int commodityClassId=this.commodityclass.getCommodityClassId();
		this.commodityclassBiz.delete(commodityClassId);
		return Action.SUCCESS;
	}
	public String preadd() throws Exception{
		List<Bigcommodityclass> lstBigclass=this.bigcommodityclassBiz.findAll();
		this.getRequest().setAttribute("lstBigclass", lstBigclass);
		return Action.SUCCESS;
	}
	public String preupdate() throws Exception{
		int commodityClassId=this.commodityclass.getCommodityClassId();
		Commodityclass commodityclass=this.commodityclassBiz.findById(commodityClassId);
		this.getRequest().setAttribute("commodityclass", commodityclass);
		List<Bigcommodityclass> lstBigclass=this.bigcommodityclassBiz.findAll();
		this.getRequest().setAttribute("lstBigclass", lstBigclass);
		return Action.SUCCESS;
	}
	public String update() throws Exception{
		this.commodityclassBiz.update(commodityclass);
		return Action.SUCCESS;
	}
	public String delBatchClass() throws Exception{
		String[] cids = this.commodityClassIds.split(",");
		for (int i = 0; i < cids.length; i++) {
			this.commodityclass.setCommodityClassId(Integer.parseInt(cids[i]));
			this.commodityclassBiz.delete(this.commodityclass.getCommodityClassId());
		}
		return Action.SUCCESS;
	}
	public String findByPages() throws Exception{
		String strHQL="select c from Commodityclass as c";
		List<Commodityclass> lstClass=this.commodityclassBiz.findAll();
		this.getRequest().setAttribute("lstClass", lstClass);
		Object[] params=new Object[]{};
		if(currentPage==0){
			currentPage=1;
		}
		PageBean pageBean=this.commodityclassBiz.findByPage(strHQL, currentPage, 5, params);
		this.getRequest().setAttribute("classPage", pageBean);
		return Action.SUCCESS;
	}
}
