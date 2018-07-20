package com.hd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.hd.model.goods;
import com.hd.service.goodsService;
@Controller
@RequestMapping("goods")
public class goodsController {
	@Resource
	private goodsService goodser;

	@RequestMapping("/list.do")
	@ResponseBody
	public List<goods> getquery() {
		List<goods> list = goodser.getquery();
		return list;
	}

	@RequestMapping("/save.do")
	@ResponseBody
	public Map<String, Object> save(goods s) {
		return goodser.save(s);
	}
	@RequestMapping("/delete1.do")
	@ResponseBody
	public Map<String, Object> delete(String ids) {
		return goodser.delete(ids);
	}
	@RequestMapping("/queryGoods.do")
	@ResponseBody
	public Map queryGoods(goods q) {
		Map queryGoods = goodser.queryGoods(q);
		return queryGoods;
	}
	

}
