package com.hd.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.hd.dao.phoneDao;
import com.hd.model.phone;
import com.hd.service.phoneservice;

@Service
public class phoneserviceimpl implements phoneservice {
	@Resource
	private phoneDao sysdao;

	@Override
	public List<phone> getquery() {
		List<phone> list = sysdao.getquery();
		return list;
	}
	
	@Override
	public List<phone> getquerybrand() {
		List<phone>  PBrand = sysdao.getquerybrand();
	   return PBrand;
	}
	@Override
	public Map<String, Object> save(phone s) {

		Map<String, Object> map = new HashMap<String, Object>();
		if (!"null".equals(s.getPID())&&!"".equals(s.getPID())) {

			boolean flag = true;
			try{
				sysdao.update(s);
			} catch (Exception e) {
			e.printStackTrace();
				flag = false;
			}
			if (!flag) {
				map.put("flag", false);
				map.put("msg", "ʧ��");
			} else {
				map.put("flag", true);
				map.put("msg", "�ɹ�");
			}
		} else {
			String uuid = UUID.randomUUID().toString();
			s.setPID(uuid);
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
	public Map queryphone(phone q) {
		phone temporder = sysdao.queryphone(q);
		Map map = new HashMap();
		map.put("phone", temporder);
		return map;
	}

	@Override
	public List<phone> getqueryphonebrand(String phonebrand) {
		// TODO Auto-generated method stub
		List<phone>  PBrand = sysdao.getqueryphonebrand(phonebrand);
		 return PBrand;
	}

}
