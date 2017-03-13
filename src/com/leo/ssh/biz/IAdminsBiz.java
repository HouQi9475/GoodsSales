package com.leo.ssh.biz;

import java.util.List;

import com.leo.ssh.domain.Admins;

public interface IAdminsBiz extends IBaseBiz{
   public abstract Admins add(final Admins admins);
   public abstract List<Admins> findAll();
   public abstract void delete(final Integer adminid);
   public abstract void update(final Admins admins);
   public abstract Admins findById(final Integer adminid);
   public abstract boolean usernameExists(final String adminacount);
}
