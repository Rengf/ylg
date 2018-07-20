package com.hd.dao;

import java.util.List;

import com.hd.model.order;

public interface orderDao {
	public List<order> getquery();
	public void save(order o);
	public void delete(String id);
	public order update(order q);
	public order queryOrder(order q);
}
