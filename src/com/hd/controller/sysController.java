package com.hd.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hd.model.bjtable;
import com.hd.model.combobox;
import com.hd.model.sysDict;
import com.hd.model.sysMenu;
import com.hd.model.sysRole;
import com.hd.model.sysUser;
import com.hd.model.xsb;
import com.hd.service.sysService;

@Controller
@RequestMapping("/sys")
public class sysController {
	@Resource
	private sysService sysser ; 
	@RequestMapping("queryMenu.do")
    @ResponseBody
	public Map queryMenu(){
		return sysser.queryMenu();
	}
	@RequestMapping("goToMenu.do")
	public String goToMenu(String menuaddress){
		return menuaddress;
	}
	/*@RequestMapping("syscenterTosysmenu.do")
	public String syscenter(){
		return "sys/sysmenu";
	}
	@RequestMapping("sysDataDictionary.do")
	public String sysDataDictionary(){
		return "sys/DataDictionary";
	}
	@RequestMapping("sysUserMenu.do")
	public String sysUserMenu(){
		return "sys/sysUserMenu";
	}
	@RequestMapping("sysRoleMenu.do")
	public String sysRoleMenu(){
		return "sys/sysRoleMenu";
	}*/
	

	/**
	 * 初始化菜单配置
	 * @return
	 */
	@RequestMapping("initMenu.do")
	@ResponseBody
	public Map<String ,Object> initMenu(){
		return sysser.initMenu();
	}
	/**
	 * 初始化数据字典配置
	 * @return
	 */
	@RequestMapping("initDataDictionary.do")
	@ResponseBody
	public Map<String ,Object> initDataDictionary(){
		return sysser.initDataDictionary();
	}
	/**
	 * 初始化数据字典配置
	 * @return
	 */
	@RequestMapping("initxuesheng.do")
	@ResponseBody
	public Map<String ,Object> initxuesheng(){
		return sysser.initxuesheng();
	}
	
	@RequestMapping("sysmenuList.do")
	@ResponseBody
	public List<sysMenu> sysmenuList(HttpServletRequest request,sysMenu menu){
		List<sysMenu> menuList= sysser.sysmenuList(request,menu);
		return menuList;
	}
	@RequestMapping("sysDataDictionaryList.do")
	@ResponseBody
	public List<sysDict> sysDataDictionaryList(HttpServletRequest request,sysDict dict){
		List<sysDict> DataDictionaryList= sysser.sysDataDictionaryList(request,dict);
		return DataDictionaryList;
	}
	@RequestMapping("sysUserList.do")
	@ResponseBody
	public List<sysUser> sysUserList(HttpServletRequest request,sysUser user){
		List<sysUser> userList= sysser.sysUserList(request,user);
		return userList;
	}
	@RequestMapping("sysRoleList.do")
	@ResponseBody
	public List<sysRole> sysRoleList(HttpServletRequest request,sysRole role){
		List<sysRole> RoleList = sysser.sysRoleList(request,role);
		return RoleList;
	}
	@RequestMapping("sysxuesheng.do")
	@ResponseBody
	public List<xsb> sysxuesheng(HttpServletRequest request,xsb xs ,bjtable bjb){
		List<xsb> RoleList = sysser.sysxuesheng(request,xs,bjb);
		return RoleList;
	}
	/**
	 * 
	 */
	@RequestMapping("savexuesheng.do")
	@ResponseBody
	public Map<String ,Object> savexuesheng(HttpServletRequest request,xsb xs ,bjtable bjb){
		return  sysser.savexuesheng(xs,bjb);
	}
	/**
	 * 
	 */
	@RequestMapping("queryxueshengOne.do")
	@ResponseBody
	public Map<String ,Object> queryxueshengOne(HttpServletRequest request,xsb xs ,bjtable bjb){
		return  sysser.queryxueshengOne(xs,bjb);
	}
	
	/**
	 * 保存菜单
	 */
	@RequestMapping("saveMenu.do")
	@ResponseBody
	public Map<String ,Object> saveMenu(sysMenu menu){
		return  sysser.saveMenu(menu);
	}
	/**
	 * 保存数据字典
	 */
	@RequestMapping("saveDataDictionary.do")
	@ResponseBody
	public Map<String ,Object> saveDataDictionary(sysDict dict){
		return  sysser.saveDataDictionary(dict);
	}
	/**
	 * 保存用户
	 */
	@RequestMapping("saveUser.do")
	@ResponseBody
	public Map<String ,Object> saveUser(sysUser user){
		return  sysser.saveUser(user);
	}
	/**
	 * 保存角色
	 */
	@RequestMapping("saveRole.do")
	@ResponseBody
	public Map<String ,Object> saveRole(sysRole role){
		return  sysser.saveRole(role);
	}
	/**
	 * 删除菜单
	 */
	@RequestMapping("deleteMenu.do")
	@ResponseBody
	public Map<String ,Object> deleteMenu(String ids){
		return  sysser.deleteMenu(ids);
	}
	/**
	 * 删除菜单
	 */
	@RequestMapping("deletexuesheng.do")
	@ResponseBody
	public Map<String ,Object> deletexuesheng(String ids){
		return  sysser.deletexuesheng(ids);
	}
	
	/**
	 * 删除数据字典
	 */
	@RequestMapping("deleteDataDictionary.do")
	@ResponseBody
	public Map<String ,Object> deleteDataDictionary(String ids){
		return  sysser.deleteDataDictionary(ids);
	}
	/**
	 * 删除用户
	 */
	@RequestMapping("deleteUser.do")
	@ResponseBody
	public Map<String ,Object> deleteUser(String ids){
		return  sysser.deleteUser(ids);
	}
	/**
	 * 删除角色
	 */
	@RequestMapping("deleteRole.do")
	@ResponseBody
	public Map<String ,Object> deleteRole(String ids){
		return  sysser.deleteRole(ids);
	}
	
	/**
	 * 查询单个菜单
	 */
	@RequestMapping("queryMenuOne.do")
	@ResponseBody
	public Map queryMenuOne(sysMenu menu){
		return sysser.queryMenuOne(menu);
	}
	/**
	 * 查询单个字典
	 */
	@RequestMapping("queryDataDictionaryOne.do")
	@ResponseBody
	public Map queryDataDictionaryOne(sysDict dict){
		return sysser.queryDataDictionaryOne(dict);
	}
	/**
	 * 查询单个用户
	 */
	@RequestMapping("queryUserOne.do")
	@ResponseBody
	public Map queryUserOne(sysUser user){
		return sysser.queryUserOne(user);
	}
	/**
	 * 查询单个用户所拥有的角色
	 */
	@RequestMapping("getUserToRoleOne.do")
	@ResponseBody
	public Map getUserToRoleOne(sysUser user){
		return sysser.getUserToRoleOne(user);
	}
	/**
	 * 查询单个角色所拥有的菜单
	 */
	@RequestMapping("getRoleToMenuOne.do")
	@ResponseBody
	public Map getRoleToMenuOne(sysRole role){
		return sysser.getRoleToMenuOne(role);
	}
	/**
	 * 查询单个角色
	 */
	@RequestMapping("queryRoleOne.do")
	@ResponseBody
	public Map queryRoleOne(sysRole role){
		return sysser.queryRoleOne(role);
	}
	
	/**
	 * 用户拥有或撤回角色
	 */
	@RequestMapping("ToRole.do")
	@ResponseBody
	public Map ToRole(String UserId, String RoleId,boolean flag){
		if(!flag){
			return sysser.restToRole(UserId,RoleId);
		}else{
			return sysser.ToRole(UserId,RoleId);
		}
		
	}
	/**
	 * 用户拥有或撤回角色
	 */
	@RequestMapping("ToMenu.do")
	@ResponseBody
	public Map ToMenu(String RoleId, String MenuId,boolean flag){
		if(!flag){
			return sysser.restToMenu(RoleId,MenuId);
		}else{
			return sysser.ToMenu(RoleId,MenuId);
		}
		
	}
	
}
