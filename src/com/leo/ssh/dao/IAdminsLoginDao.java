package com.leo.ssh.dao;

import com.leo.ssh.base.dao.IGenericDao;
import com.leo.ssh.domain.Admins;

public interface IAdminsLoginDao extends IGenericDao<Admins, String> {
    public abstract Admins login(String adminacount,String adminpassword);
}
