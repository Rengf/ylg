package com.hd.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hd.dao.cameraDao;
import com.hd.model.camera;
import com.hd.model.phone;
import com.hd.service.cameraService;
@Service
public class cameraServiceimpl implements cameraService{
	@Resource
	private cameraDao sysdao;

	@Override
	public List<camera> getquery() {
		List<camera> list = sysdao.getquery();
		return list;
	}
	
	@Override
	public List<camera> getquerybrand(){
		List<camera> cbrand =sysdao.getquerybrand();
		return cbrand;
	}

	@Override
	public Map<String, Object> save(camera  s) {

		Map<String, Object> map = new HashMap<String, Object>();
		if (!("null").equals(s.getCaID())&&!"".equals(s.getCaID())) {

			boolean flag = true;
			try{
				sysdao.update(s);
			} catch (Exception e) {
			e.printStackTrace();
				flag = false;
			}
			if (!flag) {
				map.put("flag", false);
				map.put("msg", "����ʧ��");
			} else {
				map.put("flag", true);
				map.put("msg", "���³ɹ�");
			}
		} else {
			String id = UUID.randomUUID().toString();
			s.setCaID(id);
			boolean flag = true;
			try {
				sysdao.save(s);
			} catch (Exception e) {
				e.printStackTrace();
				flag = false;
			}
			if (!flag) {
				map.put("flag", false);
				map.put("msg", "����ɹ�");
			} else {
				map.put("flag", true);
				map.put("msg", "����ʧ��");
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
	public Map querycamera(camera q) {
		camera tempcamera = sysdao.querycamera(q);
		Map map = new HashMap();
		map.put("camera", tempcamera);
		return map;
	}

	@Override
	public List<camera> getquerycamerabrand(String camerabrand) {
		// TODO Auto-generated method stub
		List<camera>  CaBrand = sysdao.getquerycamerabrand(camerabrand);
		 return CaBrand;

     }
}
