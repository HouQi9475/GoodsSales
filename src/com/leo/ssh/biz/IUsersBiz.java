package com.leo.ssh.biz;

import java.util.List;

import com.leo.ssh.domain.Users;

public interface IUsersBiz extends IBaseBiz{
	   public abstract Users add(final Users users);
	   public abstract List<Users> findAll();
	   public abstract void delete(final Integer userid);
	   public abstract void update(final Users users);
	   public abstract Users findById(final Integer userid);
	   public abstract boolean usernameExists(final String useracount);
}
