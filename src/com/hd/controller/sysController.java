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
	 * ��ʼ���˵�����
	 * @return
	 */
	@RequestMapping("initMenu.do")
	@ResponseBody
	public Map<String ,Object> initMenu(){
		return sysser.initMenu();
	}
	/**
	 * ��ʼ�������ֵ�����
	 * @return
	 */
	@RequestMapping("initDataDictionary.do")
	@ResponseBody
	public Map<String ,Object> initDataDictionary(){
		return sysser.initDataDictionary();
	}
	/**
	 * ��ʼ�������ֵ�����
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
	 * ����˵�
	 */
	@RequestMapping("saveMenu.do")
	@ResponseBody
	public Map<String ,Object> saveMenu(sysMenu menu){
		return  sysser.saveMenu(menu);
	}
	/**
	 * ���������ֵ�
	 */
	@RequestMapping("saveDataDictionary.do")
	@ResponseBody
	public Map<String ,Object> saveDataDictionary(sysDict dict){
		return  sysser.saveDataDictionary(dict);
	}
	/**
	 * �����û�
	 */
	@RequestMapping("saveUser.do")
	@ResponseBody
	public Map<String ,Object> saveUser(sysUser user){
		return  sysser.saveUser(user);
	}
	/**
	 * �����ɫ
	 */
	@RequestMapping("saveRole.do")
	@ResponseBody
	public Map<String ,Object> saveRole(sysRole role){
		return  sysser.saveRole(role);
	}
	/**
	 * ɾ���˵�
	 */
	@RequestMapping("deleteMenu.do")
	@ResponseBody
	public Map<String ,Object> deleteMenu(String ids){
		return  sysser.deleteMenu(ids);
	}
	/**
	 * ɾ���˵�
	 */
	@RequestMapping("deletexuesheng.do")
	@ResponseBody
	public Map<String ,Object> deletexuesheng(String ids){
		return  sysser.deletexuesheng(ids);
	}
	
	/**
	 * ɾ�������ֵ�
	 */
	@RequestMapping("deleteDataDictionary.do")
	@ResponseBody
	public Map<String ,Object> deleteDataDictionary(String ids){
		return  sysser.deleteDataDictionary(ids);
	}
	/**
	 * ɾ���û�
	 */
	@RequestMapping("deleteUser.do")
	@ResponseBody
	public Map<String ,Object> deleteUser(String ids){
		return  sysser.deleteUser(ids);
	}
	/**
	 * ɾ����ɫ
	 */
	@RequestMapping("deleteRole.do")
	@ResponseBody
	public Map<String ,Object> deleteRole(String ids){
		return  sysser.deleteRole(ids);
	}
	
	/**
	 * ��ѯ�����˵�
	 */
	@RequestMapping("queryMenuOne.do")
	@ResponseBody
	public Map queryMenuOne(sysMenu menu){
		return sysser.queryMenuOne(menu);
	}
	/**
	 * ��ѯ�����ֵ�
	 */
	@RequestMapping("queryDataDictionaryOne.do")
	@ResponseBody
	public Map queryDataDictionaryOne(sysDict dict){
		return sysser.queryDataDictionaryOne(dict);
	}
	/**
	 * ��ѯ�����û�
	 */
	@RequestMapping("queryUserOne.do")
	@ResponseBody
	public Map queryUserOne(sysUser user){
		return sysser.queryUserOne(user);
	}
	/**
	 * ��ѯ�����û���ӵ�еĽ�ɫ
	 */
	@RequestMapping("getUserToRoleOne.do")
	@ResponseBody
	public Map getUserToRoleOne(sysUser user){
		return sysser.getUserToRoleOne(user);
	}
	/**
	 * ��ѯ������ɫ��ӵ�еĲ˵�
	 */
	@RequestMapping("getRoleToMenuOne.do")
	@ResponseBody
	public Map getRoleToMenuOne(sysRole role){
		return sysser.getRoleToMenuOne(role);
	}
	/**
	 * ��ѯ������ɫ
	 */
	@RequestMapping("queryRoleOne.do")
	@ResponseBody
	public Map queryRoleOne(sysRole role){
		return sysser.queryRoleOne(role);
	}
	
	/**
	 * �û�ӵ�л򳷻ؽ�ɫ
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
	 * �û�ӵ�л򳷻ؽ�ɫ
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
