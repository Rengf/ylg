package com.hd.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hd.model.phone;
import com.hd.service.phoneservice;
@Controller
@RequestMapping("phone")
public class phoneController {
	@Resource
	private phoneservice stdser;

	@RequestMapping("/list.do")
	@ResponseBody
	public List<phone> getquery() {
		List<phone> list = stdser.getquery();
		return list;
	}

	@RequestMapping("/querypbrand.do")
	@ResponseBody
	public List<phone> getquerybrand() {
		List<phone>  pbrand = stdser.getquerybrand();
		return pbrand;		
	}
	@RequestMapping("/queryphonebrand.do")
	@ResponseBody
	public List<phone> getqueryphonebrand(String phonebrand) {
		List<phone>  BrandList = stdser.getqueryphonebrand(phonebrand);
		System.out.println(BrandList);
		return BrandList;
		
	}
	@RequestMapping("/save.do")
	@ResponseBody
	public Map<String, Object> save(phone s) {
		System.out.println(s);
		return stdser.save(s);
	}
	@RequestMapping("/delete1.do")
	@ResponseBody
	public Map<String, Object> delete(String ids) {
		return stdser.delete(ids);
	}
	@RequestMapping("/queryphone.do")
	@ResponseBody
	public Map queryphone(phone q) {
		Map queryphone = stdser.queryphone(q);
		return queryphone;
	}
}
