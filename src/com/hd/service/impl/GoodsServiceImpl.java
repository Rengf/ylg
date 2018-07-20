package com.hd.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hd.dao.goodsDao;
import com.hd.model.goods;
import com.hd.service.goodsService;
	@Service
	public class GoodsServiceImpl implements goodsService {
		@Resource
		private goodsDao goodsdao;

		@Override
		public List<goods> getquery() {
			List<goods> list = goodsdao.getquery();
			return list;
		}
		@Override
		public Map<String, Object> save(goods s) {

			Map<String, Object> map = new HashMap<String, Object>();
			if (!("null").equals(s.getGoods_id())&&!"".equals(s.getGoods_id())) {

				boolean flag = true;
				try{
					goodsdao.update(s);
				} catch (Exception e) {
				e.printStackTrace();
					flag = false;
				}
				if (!flag) {
					map.put("flag", false);
					map.put("msg", "更新失败");
				} else {
					map.put("flag", true);
					map.put("msg", "更新成功");
				}
			} else {
				//String id = UUID.randomUUID().toString();
				//s.setGoods_id(id);
				boolean flag = true;
				try {
					goodsdao.save(s);
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
					goodsdao.delete(str);
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
		public Map queryGoods(goods q) {
			goods temp = goodsdao.queryGoods(q);
			Map map = new HashMap();
			map.put("goods", temp);
			return map;
		}
}
