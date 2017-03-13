package com.leo.ssh.dao;

import com.leo.ssh.base.dao.IGenericDao;
import com.leo.ssh.domain.Users;

public interface IUsersLoginDao extends IGenericDao<Users, String> {
    public abstract Users login(String useracount,String userpasswork);
}
