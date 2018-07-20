package com.hd.model;

public class sysDict {
	private String id;
	private String dictid;
	private String dicttext;
	private String dicttype;
	private String dictremark;
	public String getDictid() {
		return dictid;
	}
	public void setDictid(String dictid) {
		this.dictid = dictid;
	}
	public String getDicttext() {
		return dicttext;
	}
	public void setDicttext(String dicttext) {
		this.dicttext = dicttext;
	}
	public String getDicttype() {
		return dicttype;
	}
	public void setDicttype(String dicttype) {
		this.dicttype = dicttype;
	}
	public String getDictremark() {
		return dictremark;
	}
	public void setDictremark(String dictremark) {
		this.dictremark = dictremark;
	}
	@Override
	public String toString() {
		return "sysDict [dictid=" + dictid + ", dicttext=" + dicttext
				+ ", dicttype=" + dicttype + ", dictremark=" + dictremark + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

}
