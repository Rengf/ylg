package com.hd.model;
/**
 * �˵�
 */
public class sysMenu {
	/**
	 * ����
	 */
	private String id;
	/**
	 * �˵�����
	 */
	private String menuname;
	/**
	 * ���˵�����
	 */
	private String prendid;
	/**
	 * �˵�����
	 */
	private Integer menurevel;
	/**
	 * �˵���ַ
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
