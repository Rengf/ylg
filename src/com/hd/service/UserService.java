package com.hd.service;

import java.util.List;

import com.hd.model.cjw_user;


public interface UserService {
    
	List<cjw_user> query();

	void delete(cjw_user cu);

	cjw_user findbyID(cjw_user cu);

	void update(cjw_user cu);

	void add(cjw_user cu);

}
