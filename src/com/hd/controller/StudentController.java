package com.hd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.hd.model.Student;
import com.hd.service.StudentService;

@Controller
@RequestMapping("student")
public class StudentController {
	@Resource
	private StudentService stdser ; 
	/**
	 * 查询我们的student表里面的数据
	 */
	@RequestMapping("/list.do")
	@ResponseBody
	public List<Student> getquery(){
		List<Student> list = stdser.getquery();
		return list;
	}
	@RequestMapping("/save.do")
	@ResponseBody
	public Map<String,Object> save(Student s){
		Map<String,Object> map = new HashMap<String,Object>();
		try{
			stdser.save(s);
			map.put("msg", "保存成功");
		}catch(Exception e){
			e.printStackTrace();
			map.put("msg", "操作失败");

		}
		return map;	
	}
}
