package com.hd.service;

import java.util.List;
import java.util.Map;

import com.hd.model.camera;
import com.hd.model.computer;

public interface ComputerService {
	public List<computer> getquery();
	public List<computer> getquerybrand();
	public List<computer> getquerycomputerbrand(String computerbrand);
	public Map<String, Object> save(computer s);
	public Map<String, Object> delete(String ids);
	public Map queryComputer(computer q);
}
