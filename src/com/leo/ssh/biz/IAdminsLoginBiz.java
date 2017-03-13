package com.leo.ssh.biz;

import com.leo.ssh.domain.Admins;

public interface IAdminsLoginBiz {
   public abstract Admins adminlogin(String adminacount,String adminpassword );
   
}
