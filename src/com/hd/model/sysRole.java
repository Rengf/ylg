package com.hd.model;

import java.util.List;

public class sysRole {
	String id;
	String rolename;
	private List<sysMenu> menu;
	private sysMenu sysmenu;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	@Override
	public String toString() {
		return "sysRole [id=" + id + ", rolename=" + rolename + "]";
	}
	public List<sysMenu> getMenu() {
		return menu;
	}
	public void setMenu(List<sysMenu> menu) {
		this.menu = menu;
	}
	public sysMenu getSysmenu() {
		return sysmenu;
	}
	public void setSysmenu(sysMenu sysmenu) {
		this.sysmenu = sysmenu;
	}
	
}
