package com.hd.model;

import java.util.List;

public class sysUser {
	private String id;
	private String username;
	private String password;
	private List<sysRole> role;
	private sysRole sysrole;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "sysUser [id=" + id + ", username=" + username + ", password="
				+ password + "]";
	}
	public List<sysRole> getRole() {
		return role;
	}
	public void setRole(List<sysRole> role) {
		this.role = role;
	}
	public sysRole getSysrole() {
		return sysrole;
	}
	public void setSysrole(sysRole sysrole) {
		this.sysrole = sysrole;
	}
	
	
}
