package com.hd.dao;

import java.util.List;

import com.hd.model.cjw_user;


public interface UserDao {
    public List<cjw_user> query();

	public void delete(cjw_user cu);

	public cjw_user findbyID(cjw_user cu);

	public void update(cjw_user cu);

	public void add(cjw_user cu);
}
