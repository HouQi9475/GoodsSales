package com.leo.ssh.action;

import java.util.List;

import com.leo.ssh.biz.IAdminRolesBiz;
import com.leo.ssh.domain.Adminroles;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class AdminRolesAction extends BaseAction implements ModelDriven<Adminroles> {

	private Adminroles adminroles;
	private IAdminRolesBiz adminRolesBiz;
	
	public void setAdminroles(Adminroles adminroles) {
		this.adminroles = adminroles;
	}

	public void setAdminRolesBiz(IAdminRolesBiz adminRolesBiz) {
		this.adminRolesBiz = adminRolesBiz;
	}

	@Override
	public Adminroles getModel() {
		// TODO Auto-generated method stub
		return this.adminroles;
	}

	public String findAll() throws Exception{
		List<Adminroles> lstAdminroles =this.adminRolesBiz.findAll();
		this.getRequest().setAttribute("lstAdminroles", lstAdminroles);
		return Action.SUCCESS;
	}
}
