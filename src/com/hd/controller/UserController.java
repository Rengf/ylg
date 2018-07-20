package com.hd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hd.model.cjw_user;
import com.hd.service.UserService;


@Controller

public class UserController {  //csafa/query.do
	@Resource
	UserService user;
	@RequestMapping("shouye.do")
	public String shouye(){
		System.out.println(123);
		return "index";
	}
	@RequestMapping("query.do")
    @ResponseBody
	public Map query(){
		List<cjw_user> hh = user.query();
		Map map = new HashMap();
		map.put("gg",hh);
		map.put("gg2",5);
		map.put("gg3",10);
		return map;
	}
	@RequestMapping("tijiao.do")
	@ResponseBody
	public Map update(cjw_user cu){
		System.out.println(cu);
		user.update(cu);
		Map map = new HashMap();
		map.put("msg",true);
		
		return  map;
	}
	 
}
