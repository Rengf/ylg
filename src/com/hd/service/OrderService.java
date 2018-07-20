package com.hd.service;

import java.util.List;
import java.util.Map;

import com.hd.model.order;
import com.hd.model.sysMenu;
import com.hd.model.sysRole;

public interface OrderService {
	public List<order> getquery();
	public Map<String, Object> save(order s);
	public Map<String, Object> delete(String ids);
	public Map queryOrder(order q);
}
