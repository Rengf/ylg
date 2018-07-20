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
	 * ��ѯ���ǵ�student�����������
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
	            //��¼�ɹ�����user�������õ�HttpSession���÷�Χ����
	            session.setAttribute("user", user);
	            System.out.println(user);
	            return user;
	        }else {
	            //��¼ʧ�ܣ�����ʧ����Ϣ������ת����¼ҳ��
	          return null;
	        }
	    }
}
