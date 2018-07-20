package com.hd.service;

import java.util.List;
import java.util.Map;

import com.hd.model.user_infoModel;

public interface user_infoservice {
	public List<user_infoModel> getquery();
 
	public List<user_infoModel> checkLogin(String user_name,String user_pwd);
	public Map<String, Object> save(user_infoModel s);
	
	public Map<String, Object> deleteuser_info(String user_id);
	
}
