package com.hd.dao;

import java.util.List;
import java.util.Map;

import com.hd.model.combobox;
import com.hd.model.sysDict;
import com.hd.model.sysMenu;
import com.hd.model.sysRole;
import com.hd.model.sysUser;
import com.hd.model.xsb;

public interface sysDao {
	public List<sysMenu> queryMenu(int a);

	public List<sysMenu> sysmenuList(sysMenu menu);

	public List<combobox> initMenu(String string);

	public List<combobox> sysmenuListAll(String string);

	public void saveMenu(sysMenu menu);

	public sysMenu queryMenuOne(sysMenu menu);

	public void updateMenu(sysMenu menu);

	public void deleteMenu(String str);

	public List<sysDict> sysDataDictionaryList(sysDict dict);

	public void updateDataDictionary(sysDict dict);

	public void saveDataDictionary(sysDict dict);

	public void deleteDataDictionary(String str);

	public sysDict  queryDataDictionaryOne(sysDict dict);

	public List<sysUser> sysUserList(sysUser user);

	public void saveUser(sysUser user);

	public sysUser queryUserOne(sysUser user);

	public void deleteUser(String str);

	public void updateUser(sysUser user);

	public List<sysRole> sysRoleList(sysRole role);

	public List<sysUser> getUserToRoleOne(sysUser user);

	public sysUser queryToRole(sysUser user);

	public void ToRole(sysUser user);

	public void restToRole(sysUser user);

	public void updateRole(sysRole role);

	public void saveRole(sysRole role);

	public void deleteRole(String str);

	public sysRole queryRoleOne(sysRole role);

	public List<sysRole> getRoleToMenuOne(sysRole role);

	public void restToMenu(sysRole role);

	public sysRole queryToMenu(sysRole role);

	public void ToMenu(sysRole role);

	public List<xsb> sysxuesheng();

	public void updatexuesheng(xsb xs);

	public void savexuesheng(xsb xs);

	public List<combobox> initxuesheng();

	public List<xsb>  queryxueshengOne(xsb xs);

	public void deletexuesheng(String str);
}
