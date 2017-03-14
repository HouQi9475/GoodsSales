package com.leo.ssh.action;

import java.util.List;
import java.util.Map;

import com.leo.ssh.biz.IUsersBiz;
import com.leo.ssh.domain.Users;
import com.leo.ssh.page.PageBean;
import com.leo.ssh.tools.md5;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

public class UsersAction extends BaseAction implements ModelDriven<Users> {

	private Users users;
	private IUsersBiz usersBiz;
	private int currentPage;
	private String usersids;
    private String olduserpasswork;
    private String newuserpasswork;
    
	
	public String getOlduserpasswork() {
		return olduserpasswork;
	}
	public void setOlduserpasswork(String olduserpasswork) {
		this.olduserpasswork = olduserpasswork;
	}
	public String getNewuserpasswork() {
		return newuserpasswork;
	}
	public void setNewuserpasswork(String newuserpasswork) {
		this.newuserpasswork = newuserpasswork;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public String getUsersids() {
		return usersids;
	}
	public void setUsersids(String usersids) {
		this.usersids = usersids;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public void setUsersBiz(IUsersBiz usersBiz) {
		this.usersBiz = usersBiz;
	}
	@Override
	public Users getModel() {
		// TODO Auto-generated method stub
		return this.users;
	}
	public String preupdate() throws Exception{
		Map session=(Map)ActionContext.getContext().getSession();
		Users users=(Users) session.get("users");
		if(users==null){
			return Action.ERROR;
		}
		int usersid=this.users.getUserid();
		 users=this.usersBiz.findById(usersid);
		this.getRequest().setAttribute("users", users);
		return Action.SUCCESS;
	}
	public String update() throws Exception{
		String old=this.users.getUserpasswork();
		md5 md=new md5();
		String news=md.EncoderByMd5(old);
		this.users.setUserpasswork(news);
		this.usersBiz.update(users);
		return Action.SUCCESS;
	}
	public String updatePassword() throws Exception{
		Map session=(Map)ActionContext.getContext().getSession();
		Users users=(Users) session.get("users");
		md5 m=new md5();
		String olds=m.EncoderByMd5(olduserpasswork);
		String news=m.EncoderByMd5(newuserpasswork);
		if(olds.equals(users.getUserpasswork())){
			users.setUserpasswork(news);
			this.usersBiz.update(users);
			return Action.SUCCESS;
		}else{
			return Action.ERROR;
		}
		
	}
	public String delete() throws Exception{
		int usersid=this.users.getUserid();
		this.usersBiz.delete(usersid);
		return Action.SUCCESS;
	}
	public String delBatchClass() throws Exception{
		String[] aids = this.usersids.split(",");
		for (int i = 0; i < aids.length; i++) {
			this.users.setUserid(Integer.parseInt(aids[i]));
			this.usersBiz.delete(this.users.getUserid());
		}
		return Action.SUCCESS;
	}
//	public String preadd() throws Exception{
//		List<Adminroles> lstAdminroles=this.adminRolesBiz.findAll();
//		this.getRequest().setAttribute("lstAdminroles", lstAdminroles);
//		return Action.SUCCESS;
//	}
	public String add() throws Exception{
		String old=this.users.getUserpasswork();
		md5 md=new md5();
		String news=md.EncoderByMd5(old);
		this.users.setUserpasswork(news);
		this.usersBiz.add(users);
		this.users.setUseracount(null);
		this.users.setUsername(null);
		return "usersLogin";
	}
	public boolean usernameExists(String useracount){
		boolean flag=this.usersBiz.usernameExists(useracount);
		return flag;
	}
	public String findAll() throws Exception{
		List<Users> lstUsers=this.usersBiz.findAll();
		this.getRequest().setAttribute("lstUsers", lstUsers);
		return Action.SUCCESS;
	}
	public String findByPages() throws Exception{
		String strHQL="select c from Users as c";
		List<Users> lstUsers=this.usersBiz.findAll();
		this.getRequest().setAttribute("lstUsers", lstUsers);
		Object[] params=new Object[]{};
		if(currentPage==0){
			currentPage=1;
		}
//		List<Adminroles> lstRoles=this.adminRolesBiz.findAll();
//		this.getRequest().setAttribute("lstRoles", lstRoles);
		PageBean pageBean=this.usersBiz.findByPage(strHQL, currentPage, 5, params);
		this.getRequest().setAttribute("usersPage", pageBean);
		return Action.SUCCESS;
	}

}
