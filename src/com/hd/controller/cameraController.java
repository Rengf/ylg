package com.hd.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hd.model.camera;
import com.hd.model.phone;
import com.hd.service.cameraService;
@Controller
@RequestMapping("camera")
public class cameraController {
		@Resource
		private cameraService camestd;

		@RequestMapping("/list.do")
		@ResponseBody
		public List<camera> getquery() {
			List<camera> list = camestd.getquery();
			return list;
		}

		@RequestMapping("/querybrand.do")
		@ResponseBody
		public List<camera> getquerybrand() {
			
			List<camera> cbrand= camestd.getquerybrand();
			return  cbrand;
		}
		@RequestMapping("/querycamerabrand.do")
		@ResponseBody
		public List<camera> getquerycamerabrand(String camerabrand) {
			List<camera>  BrandList = camestd.getquerycamerabrand(camerabrand);
			return BrandList;		
		}
		@RequestMapping("/save.do")
		@ResponseBody
		public Map<String, Object> save(camera s) {
			return camestd.save(s);
		}
		@RequestMapping("/delete1.do")
		@ResponseBody
		public Map<String, Object> delete(String ids) {
			return camestd.delete(ids);
		}
		@RequestMapping("/querycamera.do")
		@ResponseBody
		public Map querycamera(camera q) {
			Map querycamera = camestd.querycamera(q);
			return querycamera;
		}	
   }
