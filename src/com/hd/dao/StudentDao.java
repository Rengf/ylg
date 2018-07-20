package com.hd.dao;

import java.util.List;

import com.hd.model.Student;

public interface StudentDao {
	public List<Student> getquery();

	public void save(Student s);
}
