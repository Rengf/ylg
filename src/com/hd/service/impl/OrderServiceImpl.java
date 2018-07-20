package com.hd.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hd.dao.orderDao;
import com.hd.model.order;
import com.hd.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	@Resource
	private orderDao sysdao;

	@Override
	public List<order> getquery() {
		List<order> list = sysdao.getquery();
		return list;
	}
	@Override
	public Map<String, Object> save(order s) {

		Map<String, Object> map = new HashMap<String, Object>();
		if (!("null").equals(s.getOrder_id())&&!"".equals(s.getOrder_id())) {

			boolean flag = true;
			try{
				sysdao.update(s);
			} catch (Exception e) {
			e.printStackTrace();
				flag = false;
			}
			if (!flag) {
				map.put("flag", false);
				map.put("msg", "失败");
			} else {
				map.put("flag", true);
				map.put("msg", "成功");
			}
		} else {
			String id = UUID.randomUUID().toString();
			s.setOrder_id(id);
			boolean flag = true;
			try {
				sysdao.save(s);
			} catch (Exception e) {
				e.printStackTrace();
				flag = false;
			}
			if (!flag) {
				map.put("flag", false);
				map.put("msg", "失败");
			} else {
				map.put("flag", true);
				map.put("msg", "成功");
			}
		}

		return map;
	}
	@Override
	public Map<String, Object> delete(String ids) {
		Map<String, Object> map = new HashMap<String, Object>();
		String strs[] = ids.split(",");
		boolean flag = true;
		try {
			for (String str : strs) {
				if ("".equals(str)) {
					continue;
				}
				sysdao.delete(str);
			}
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		if (!flag) {
			map.put("flag", false);
			map.put("msg", "失败");
		} else {
			map.put("flag", true);
			map.put("msg", "成功");
		}
		return map;
	
	}
	@Override
	public Map queryOrder(order q) {
		order temporder = sysdao.queryOrder(q);
		Map map = new HashMap();
		map.put("order", temporder);
		return map;
	}

}
