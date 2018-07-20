package com.hd.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.hd.model.user_infoModel;
import com.hd.service.user_infoservice;
@Controller
@RequestMapping("user_info")

//@SessionAttributes("user_info")

public class user_infoController {

	@Resource
	private user_infoservice stdser ; 
	/**
	 * 查询我们的student表里面的数据
	 */
	@RequestMapping("/list.do")
	@ResponseBody
	public List<user_infoModel> getquery(){
		List<user_infoModel> list = stdser.getquery();
		return list;
	}
	@RequestMapping("/save.do")
	@ResponseBody
	public Map<String,Object> save(HttpServletRequest request,user_infoModel s){
		//Map<String, Object> map =stdser.save(user_id);
		return stdser.save(s);
	}
	@RequestMapping("/deleteuser_info.do")
	@ResponseBody
	public Map<String ,Object> deleteuser_info(String user_id){
		return stdser.deleteuser_info(user_id);
	}

	    @RequestMapping("/login.do")
	    @ResponseBody
	    public List<user_infoModel> login(String user_name,String user_pwd,ModelAndView mv,HttpSession session){
	    	List<user_infoModel> user=stdser.checkLogin(user_name, user_pwd);
	        if(user!=null){
	            System.out.println("NBNBNBNB");
	            //登录成功，将user对象设置到HttpSession作用范围域中
	            session.setAttribute("user", user);
	            System.out.println(user);
	            return user;
	        }else {
	            //登录失败，设置失败信息，并调转到登录页面
	          return null;
	        }
	    }
}
