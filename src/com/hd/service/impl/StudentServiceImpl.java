package com.hd.service.impl;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hd.dao.StudentDao;
import com.hd.model.Student;
import com.hd.service.StudentService;
@Service
public class StudentServiceImpl implements StudentService {
	@Resource
	private StudentDao sysdao ;
	@Override
	public List<Student> getquery() {
		List<Student> list = sysdao.getquery();
		return list;
	}
	@Override
	public void save(Student s) {
		String id = UUID.randomUUID().toString();
		s.setId(id);
		sysdao.save( s);
	}

}
