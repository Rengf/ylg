package com.hd.dao;

import java.util.List;

import com.hd.model.camera;
import com.hd.model.computer;
import com.hd.model.order;

public interface computerDao {
		public List<computer> getquery();
		public void save(computer s);
		public List<computer> getquerybrand();
		public List<computer> getquerycomputerbrand(String computerbrand);
		public void delete(String str);
		public computer queryComputer(computer q);
		public void update(computer u);
	}

