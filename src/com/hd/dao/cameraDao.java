package com.hd.dao;

import java.util.List;

import com.hd.model.camera;
import com.hd.model.phone;

public interface cameraDao {
	public List<camera> getquery();
	public List<camera> getquerybrand();
	public void save(camera o);
	public void delete(String id);
	public camera update(camera q);
	public camera querycamera(camera q);
	public List<camera> getquerycamerabrand(String camerabrand);
}
