package com.hd.dao;

import java.util.List;

import com.hd.model.goods;
public interface goodsDao {
	public List<goods> getquery();
	public void save(goods s);
	public void delete(String id);
	public goods update(goods q);
	public goods queryGoods(goods q);
}
