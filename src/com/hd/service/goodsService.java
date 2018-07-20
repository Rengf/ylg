package com.hd.service;

import java.util.List;
import java.util.Map;

import com.hd.model.goods;

public interface goodsService {
	public List<goods> getquery();
	public Map<String, Object> save(goods s);
	public Map<String, Object> delete(String ids);
	public Map queryGoods(goods q);
}
