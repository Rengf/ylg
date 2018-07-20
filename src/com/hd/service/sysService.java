package com.hd.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hd.model.bjtable;
import com.hd.model.combobox;
import com.hd.model.sysDict;
import com.hd.model.sysMenu;
import com.hd.model.sysRole;
import com.hd.model.sysUser;
import com.hd.model.xsb;

public interface sysService {
	public Map queryMenu();

	public List<sysMenu> sysmenuList(HttpServletRequest request, sysMenu menu);

	public Map<String, Object> initMenu();

	public Map<String ,Object> saveMenu(sysMenu menu);

	public Map queryMenuOne(sysMenu menu);

	public Map<String, Object> deleteMenu(String ids);

	public Map<String, Object> initDataDictionary();

	public List<sysDict> sysDataDictionaryList(HttpServletRequest request,
			sysDict dict);

	public Map<String, Object> saveDataDictionary(sysDict dict);

	public Map<String, Object> deleteDataDictionary(String ids);

	public Map queryDataDictionaryOne(sysDict dict);

	public List<sysUser> sysUserList(HttpServletRequest request, sysUser user);

	public Map<String, Object> saveUser(sysUser user);

	public Map queryUserOne(sysUser user);

	public Map<String, Object> deleteUser(String ids);

	public List<sysRole> sysRoleList(HttpServletRequest request, sysRole role);

	public Map getUserToRoleOne(sysUser user);

	public Map ToRole(String userId, String roleId);

	public Map restToRole(String userId, String roleId);

	public Map<String, Object> saveRole(sysRole role);

	public Map<String, Object> deleteRole(String ids);

	public Map queryRoleOne(sysRole role);

	public Map getRoleToMenuOne(sysRole role);

	public Map restToMenu(String roleId, String menuId);

	public Map ToMenu(String roleId, String menuId);

	public List<xsb> sysxuesheng(HttpServletRequest request, xsb xs, bjtable bjb);

	public Map<String, Object> savexuesheng(xsb xs, bjtable bjb);

	public Map<String, Object> initxuesheng();

	public Map<String, Object> queryxueshengOne(xsb xs, bjtable bjb);

	public Map<String, Object> deletexuesheng(String ids);
}
