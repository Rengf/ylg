package com.hd.dao;

import java.util.List;

import com.hd.model.phone;

public interface phoneDao {
	public List<phone> getquery();
	public void save(phone o);
	public List<phone> getquerybrand();
	public List<phone> getqueryphonebrand(String phonebrand);
	public void delete(String id);
	public phone update(phone q);
	public phone queryphone(phone q);
}
