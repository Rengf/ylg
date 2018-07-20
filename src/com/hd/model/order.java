package com.hd.model;

public class order {
	private  String order_id;
	private int user_id;
	private String order_user_name;
	private int order_user_address_id;
	private String order_good_sent_type;
	private String order_good_pay_type;
	private String order_status;

	public  String getOrder_id() {
		return order_id;
	}

	
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}


	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getOrder_user_name() {
		return order_user_name;
	}

	public void setOrder_user_name(String order_user_name) {
		this.order_user_name = order_user_name;
	}

	public int getOrder_user_address_id() {
		return order_user_address_id;
	}

	public void setOrder_user_address_id(int order_user_address_id) {
		this.order_user_address_id = order_user_address_id;
	}

	public String getOrder_good_sent_type() {
		return order_good_sent_type;
	}

	public void setOrder_good_sent_type(String order_good_sent_type) {
		this.order_good_sent_type = order_good_sent_type;
	}

	public String getOrder_good_pay_type() {
		return order_good_pay_type;
	}

	public void setOrder_good_pay_type(String order_good_pay_type) {
		this.order_good_pay_type = order_good_pay_type;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
}
