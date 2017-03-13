package com.leo.ssh.action;

import com.leo.ssh.biz.IUsersLoginBiz;
import com.leo.ssh.domain.Users;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class UsersLoginAction extends BaseAction implements ModelDriven<Users> {

	private Users users;
	private IUsersLoginBiz usersLoginBiz;
	
	
	public void setUsers(Users users) {
		this.users = users;
	}

	public void setUsersLoginBiz(IUsersLoginBiz usersLoginBiz) {
		this.usersLoginBiz = usersLoginBiz;
	}

	@Override
	public Users getModel() {
		// TODO Auto-generated method stub
		return this.users;
	}

	public String login() throws Exception{
		Users users=this.usersLoginBiz.usersLogin(this.users.getUseracount(), this.users.getUserpasswork());
		if(users!=null){
			this.getSession().put("users", users);
			System.out.println(users.getOrders());
			return "usersLogin";
		}else
			return "usersNotLogin";
	}
	// 退出登录的方法
		public String logout() {
			// 获取session对象
			//Map<String, Object> session = ActionContext.getContext().getSession();
			// 从session中移除用户信息
			if(this.getSession().containsKey("users")){
				this.getSession().remove("users");
			}
			return SUCCESS;
		}
}
