package com.leo.ssh.action;

import com.leo.ssh.biz.IAdminsLoginBiz;
import com.leo.ssh.domain.Admins;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class AdminsLoginAction extends BaseAction implements ModelDriven<Admins> {

	private Admins admins;
	private IAdminsLoginBiz adminsLoginBiz;
	
	public void setAdmins(Admins admins) {
		this.admins = admins;
	}

	public void setAdminsLoginBiz(IAdminsLoginBiz adminsLoginBiz) {
		this.adminsLoginBiz = adminsLoginBiz;
	}

	@Override
	public Admins getModel() {
		// TODO Auto-generated method stub
		return this.admins;
	}

	public String login() throws Exception{
		Admins admins=this.adminsLoginBiz.adminlogin(this.admins.getAdminacount(), this.admins.getAdminpassword());
		int rid=admins.getAdminroles().getRolesid();
		this.getSession().put("rid", rid);
		if(admins!=null){
			this.getSession().put("admins", admins);
			return Action.SUCCESS;
		}else
			return Action.ERROR;
	}
	// 退出登录的方法
		public String logout() {
			// 获取session对象
			//Map<String, Object> session = ActionContext.getContext().getSession();
			// 从session中移除用户信息
			if(this.getSession().containsKey("admins")){
				this.getSession().remove("admins");
			}
			return SUCCESS;
		}
}
