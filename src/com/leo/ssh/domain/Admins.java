package com.leo.ssh.domain;
// Generated 2017-4-3 19:26:36 by Hibernate Tools 4.0.1.Final

/**
 * Admins generated by hbm2java
 */
public class Admins implements java.io.Serializable {

	private Integer adminid;
	private Adminroles adminroles;
	private String adminacount;
	private String adminpassword;
	private String adminname;
	private Boolean adminstatus;

	public Admins() {
	}

	public Admins(Adminroles adminroles, String adminacount, String adminpassword, String adminname,
			Boolean adminstatus) {
		this.adminroles = adminroles;
		this.adminacount = adminacount;
		this.adminpassword = adminpassword;
		this.adminname = adminname;
		this.adminstatus = adminstatus;
	}

	public Integer getAdminid() {
		return this.adminid;
	}

	public void setAdminid(Integer adminid) {
		this.adminid = adminid;
	}

	public Adminroles getAdminroles() {
		return this.adminroles;
	}

	public void setAdminroles(Adminroles adminroles) {
		this.adminroles = adminroles;
	}

	public String getAdminacount() {
		return this.adminacount;
	}

	public void setAdminacount(String adminacount) {
		this.adminacount = adminacount;
	}

	public String getAdminpassword() {
		return this.adminpassword;
	}

	public void setAdminpassword(String adminpassword) {
		this.adminpassword = adminpassword;
	}

	public String getAdminname() {
		return this.adminname;
	}

	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}

	public Boolean getAdminstatus() {
		return this.adminstatus;
	}

	public void setAdminstatus(Boolean adminstatus) {
		this.adminstatus = adminstatus;
	}

}
