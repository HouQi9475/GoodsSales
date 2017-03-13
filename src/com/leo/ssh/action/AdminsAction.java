package com.leo.ssh.action;

import java.util.List;

import com.leo.ssh.biz.IAdminRolesBiz;
import com.leo.ssh.biz.IAdminsBiz;
import com.leo.ssh.domain.Adminroles;
import com.leo.ssh.domain.Admins;
import com.leo.ssh.page.PageBean;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class AdminsAction extends BaseAction implements ModelDriven<Admins> {

	private Admins admins;
	private IAdminsBiz adminsBiz;
	private IAdminRolesBiz adminRolesBiz;
	private int currentPage;
	private String adminids;

	public String getAdminids() {
		return adminids;
	}

	public void setAdminids(String adminids) {
		this.adminids = adminids;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setAdminRolesBiz(IAdminRolesBiz adminRolesBiz) {
		this.adminRolesBiz = adminRolesBiz;
	}

	public void setAdmins(Admins admins) {
		this.admins = admins;
	}

	public void setAdminsBiz(IAdminsBiz adminsBiz) {
		this.adminsBiz = adminsBiz;
	}

	@Override
	public Admins getModel() {
		// TODO Auto-generated method stub
		return this.admins;
	}
	public String preupdate() throws Exception{
		int adminsid=this.admins.getAdminid();
		Admins admins=this.adminsBiz.findById(adminsid);
		this.getRequest().setAttribute("admins", admins);
		List<Adminroles> lstAdminroles=this.adminRolesBiz.findAll();
		this.getRequest().setAttribute("lstAdminroles", lstAdminroles);
		return Action.SUCCESS;
	}
	public String update() throws Exception{
		this.adminsBiz.update(admins);
		return Action.SUCCESS;
	}
	public String delete() throws Exception{
		int adminid=this.admins.getAdminid();
		this.adminsBiz.delete(adminid);
		return Action.SUCCESS;
	}
	public String delBatchClass() throws Exception{
		String[] aids = this.adminids.split(",");
		for (int i = 0; i < aids.length; i++) {
			this.admins.setAdminid(Integer.parseInt(aids[i]));
			this.adminsBiz.delete(this.admins.getAdminid());
		}
		return Action.SUCCESS;
	}
	public String preadd() throws Exception{
		List<Adminroles> lstAdminroles=this.adminRolesBiz.findAll();
		this.getRequest().setAttribute("lstAdminroles", lstAdminroles);
		return Action.SUCCESS;
	}
	public String add() throws Exception{
		this.adminsBiz.add(admins);
		this.admins.setAdminacount(null);
		this.admins.setAdminname(null);
		return Action.SUCCESS;
	}
	public boolean usernameExists(String adminacount){
		boolean flag=this.adminsBiz.usernameExists(adminacount);
		return flag;
	}
	public String findAll() throws Exception{
		List<Admins> lstAdmins=this.adminsBiz.findAll();
		this.getRequest().setAttribute("lstAdmins", lstAdmins);
		return Action.SUCCESS;
	}
	public String findByPages() throws Exception{
		String strHQL="select c from Admins as c";
		List<Admins> lstAdmins=this.adminsBiz.findAll();
		this.getRequest().setAttribute("lstAdmins", lstAdmins);
		Object[] params=new Object[]{};
		if(currentPage==0){
			currentPage=1;
		}
//		List<Adminroles> lstRoles=this.adminRolesBiz.findAll();
//		this.getRequest().setAttribute("lstRoles", lstRoles);
		PageBean pageBean=this.adminsBiz.findByPage(strHQL, currentPage, 5, params);
		this.getRequest().setAttribute("adminsPage", pageBean);
		return Action.SUCCESS;
	}

}
