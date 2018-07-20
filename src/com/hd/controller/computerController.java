package com.hd.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hd.model.camera;
import com.hd.model.computer;
import com.hd.service.ComputerService;
@Controller
@RequestMapping("computer")
public class computerController {
	@Resource
	private ComputerService comser;

	@RequestMapping("/list.do")
	@ResponseBody
	public List<computer> getquery() {
		List<computer> list = comser.getquery();
		return list;
	}
	@RequestMapping("/querybrand.do")
	@ResponseBody
       public List<computer> getquerybrand() {
    	   List<computer> brand = comser.getquerybrand();
		return brand;
	}
	@RequestMapping("/querycomputerbrand.do")
	@ResponseBody
	public List<computer> getquerycomputerbrand(String computerbrand) {
		List<computer>  BrandList = comser.getquerycomputerbrand(computerbrand);
		return BrandList;		
		}
	@RequestMapping("/save.do")
	@ResponseBody
	public Map<String, Object> save(computer s) {
		return comser.save(s);
	
	}
	@RequestMapping("/delete.do")
	@ResponseBody
	public Map<String, Object> delete(String ids) {
		return comser.delete(ids);
	}
	@RequestMapping("/querycomputer.do")
	@ResponseBody
	public Map queryComputer(computer q) {
		Map queryComputer = comser.queryComputer(q);
		return queryComputer;
	}}
