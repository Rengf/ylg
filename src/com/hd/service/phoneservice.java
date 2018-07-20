package com.hd.service;

import java.util.List;
import java.util.Map;

import com.hd.model.phone;

public interface phoneservice {
	public List<phone> getquery();
	public Map<String, Object> save(phone s);
	public List<phone> getquerybrand();
	public Map<String, Object> delete(String ids);
	public Map queryphone(phone q);
	public List<phone> getqueryphonebrand(String phonebrand);
}
