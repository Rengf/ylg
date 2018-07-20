package com.hd.controller;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.hd.model.order;
import com.hd.service.OrderService;

@Controller
@RequestMapping("order")
public class orderController {
	@Resource
	private OrderService stdser;

	@RequestMapping("/list.do")
	@ResponseBody
	public List<order> getquery() {
		List<order> list = stdser.getquery();
		return list;
	}

	@RequestMapping("/save.do")
	@ResponseBody
	public Map<String, Object> save(order s) {
		return stdser.save(s);
	}
	@RequestMapping("/delete1.do")
	@ResponseBody
	public Map<String, Object> delete(String ids) {
		return stdser.delete(ids);
	}
	@RequestMapping("/queryOrder.do")
	@ResponseBody
	public Map queryOrder(order q) {
		Map queryOrder = stdser.queryOrder(q);
		return queryOrder;
	}	
}
