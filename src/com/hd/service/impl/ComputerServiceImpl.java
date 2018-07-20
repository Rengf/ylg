package com.hd.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.hd.dao.computerDao;
import com.hd.model.camera;
import com.hd.model.computer;
import com.hd.service.ComputerService;

@Service
public class ComputerServiceImpl implements ComputerService {
	@Resource
	private computerDao comdao;

	@Override
	public List<computer> getquery() {
		List<computer> list = comdao.getquery();
		return list;
	}
	@Override
	public List<computer> getquerybrand() {
		List<computer> Brand=comdao.getquerybrand();
		return Brand;
	}

	@Override
	public Map<String, Object> save(computer s) {
			Map<String, Object> map = new HashMap<String, Object>();
			if (!("null").equals(s.getCID())&&!"".equals(s.getCID())) {

				boolean flag = true;
				try{
					comdao.update(s);
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
				String id = UUID.randomUUID().toString();
				s.setCID(id);
				boolean flag = true;
				try {
					comdao.save(s);
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
	public Map<String, Object> delete(String ids) {
		Map<String, Object> map = new HashMap<String, Object>();
		String strs[] = ids.split(",");
		boolean flag = true;
		try {
			for (String str : strs) {
				if ("".equals(str)) {
					continue;
				}
				comdao.delete(str);
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
	public Map queryComputer(computer q) {
		computer tempcomputer = comdao.queryComputer(q);
		Map map = new HashMap();
		map.put("computer", tempcomputer);
		return map;
	}
	@Override
	public List<computer> getquerycomputerbrand(String computerbrand) {
		// TODO Auto-generated method stub
		List<computer>  CBrand = comdao.getquerycomputerbrand(computerbrand);
		 return CBrand;
	}

}

