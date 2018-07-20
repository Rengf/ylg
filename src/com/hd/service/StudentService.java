package com.hd.service;

import java.util.List;

import com.hd.model.Student;

public interface StudentService {
	public List<Student> getquery();

	public void save(Student s);
}
