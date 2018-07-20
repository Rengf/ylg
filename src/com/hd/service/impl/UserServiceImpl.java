package com.hd.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hd.dao.UserDao;
import com.hd.model.cjw_user;
import com.hd.service.UserService;
@Service
public class UserServiceImpl implements  UserService{

	@Resource
	UserDao ud;
	@Override
	public List<cjw_user> query() {
		// TODO Auto-generated method stub
		return ud.query();
	}
	@Override
	public void delete(cjw_user cu) {
		ud.delete(cu);
	}
	@Override
	public cjw_user findbyID(cjw_user cu) {
		// TODO Auto-generated method stub
		return ud.findbyID(cu);
	}
	@Override
	public void update(cjw_user cu) {
		ud.update(cu);
	}
	@Override
	public void add(cjw_user cu) {
		ud.add(cu);
	}

}
