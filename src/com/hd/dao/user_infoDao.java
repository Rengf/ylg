package com.hd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hd.model.user_infoModel;

public interface user_infoDao {
	public List<user_infoModel> getquery();
	public List<user_infoModel> checkLogin(@Param("user_name")String user_name,@Param("user_pwd")String user_pwd);
	public void save(user_infoModel s);
	
	public void deleteuser_info(String str);
	public user_infoModel selectBytId(int user_id);
	public user_infoModel selectByname(String user_name);
}
