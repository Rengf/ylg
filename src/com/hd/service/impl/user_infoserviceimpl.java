package com.hd.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicInterface2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hd.dao.user_infoDao;
import com.hd.model.user_infoModel;
import com.hd.service.user_infoservice;

@Service
public class user_infoserviceimpl implements user_infoservice{
	@Resource
	private user_infoDao user_infodao ;
	public List<user_infoModel> getquery() {
		List<user_infoModel> list = user_infodao.getquery();
		return list;
	}
	public Map<String, Object> save(user_infoModel s) {
		Map<String, Object> map = new HashMap<String,Object>();
		try {
             user_infodao.save(s);
          map.put("flag",true);
          map.put("msg","注册成功");
		}catch (Exception e) {
			e.printStackTrace();
			 map.put("flag",false);
	          map.put("msg","注册失败");
		}
		return map;
	}
	public Map<String, Object> deleteuser_info(String user_id) {
		Map<String ,Object> map = new HashMap<String ,Object>();
		String strs [] = user_id.split(",");
		boolean flag = true;
		try{
			for(String str : strs){
				if("".equals(str)){
					continue;
				}
				user_infodao.deleteuser_info(str);
			}
		}catch(Exception e){
			e.printStackTrace();
			flag = false;
		}
		if(!flag){
			map.put("flag", false);
			map.put("msg", "数据删除失败，请联系管理员");
		}else{
			map.put("flag", true);
			map.put("msg", "数据删除成功");
		}
		return map;
	}
	public boolean login(String user_name,String user_pwd) {
		user_infoModel user_infomodel = user_infodao.selectByname(user_name);
		if (user_infomodel!=null) {
			if(user_infomodel.getUser_name().equals(user_name)&&user_infomodel.getUser_pwd().equals(user_pwd))
				
				return true;
		}
		return false;
	}
	@Override
public List<user_infoModel> checkLogin(String user_name, String user_pwd) {
	
		return user_infodao.checkLogin(user_name, user_pwd);
	}
}
