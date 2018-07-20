package com.hd.service;

import java.util.List;
import java.util.Map;

import com.hd.model.camera;
import com.hd.model.phone;

public interface cameraService {
	public List<camera> getquery();
	public Map<String, Object> save(camera s);
	public List<camera> getquerybrand();
	public List<camera> getquerycamerabrand(String camerabrand);
	public Map<String, Object> delete(String ids);
	public Map querycamera(camera q);
}
