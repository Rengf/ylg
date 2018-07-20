package com.hd.model;
/**
 * 菜单
 */
public class sysMenu {
	/**
	 * 主键
	 */
	private String id;
	/**
	 * 菜单名称
	 */
	private String menuname;
	/**
	 * 父菜单主键
	 */
	private String prendid;
	/**
	 * 菜单级别
	 */
	private Integer menurevel;
	/**
	 * 菜单地址
	 */
	private String menuaddress;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMenuname() {
		return menuname;
	}
	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}
	public String getPrendid() {
		return prendid;
	}
	public void setPrendid(String prendid) {
		this.prendid = prendid;
	}
	public int getMenurevel() {
		if(menurevel == null){
			menurevel = -1;
		}
		return menurevel;
	}
	public void setMenurevel(int menurevel) {
		this.menurevel = menurevel;
	}
	public String getMenuaddress() {
		return menuaddress;
	}
	public void setMenuaddress(String menuaddress) {
		this.menuaddress = menuaddress;
	}
	@Override
	public String toString() {
		return "sysMenu [id=" + id + ", menuname=" + menuname + ", prendid="
				+ prendid + ", menurevel=" + menurevel + ", menuaddress="
				+ menuaddress + "]";
	}

}
