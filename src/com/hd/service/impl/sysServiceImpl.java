package com.hd.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.hd.dao.sysDao;
import com.hd.model.bjtable;
import com.hd.model.combobox;
import com.hd.model.sysDict;
import com.hd.model.sysMenu;
import com.hd.model.sysRole;
import com.hd.model.sysUser;
import com.hd.model.xsb;
import com.hd.service.sysService;
@Service
public class sysServiceImpl implements sysService {
	@Resource
	private sysDao sysdao ;
	@Override
	public Map queryMenu() {
		List <sysMenu> menuListOne = sysdao.queryMenu(1);
		List <sysMenu> menuListTwo = sysdao.queryMenu(2);
		Map<String ,List <sysMenu>> map = new HashMap<String ,List <sysMenu>>();
		map.put("menuOne", menuListOne);
		map.put("menuTwo", menuListTwo);
		return map;
	}
	@Override
	public List<sysMenu> sysmenuList(HttpServletRequest request,sysMenu menu) {
		
		return sysdao.sysmenuList(menu);
	}
	@Override
	public Map<String, Object> initMenu() {
		List<combobox> list = sysdao.initMenu("sysmenulevel");//�˵�����
		List<combobox> sysMenulist = sysdao.sysmenuListAll("01");//�˵�����
		Map map = new HashMap();
		map.put("combobox", list);
		map.put("sysMenulist", sysMenulist);
		return map;
	}
	@Override
	public Map<String ,Object> saveMenu(sysMenu menu) {
		int level = menu.getMenurevel();
		if(level == 1){//һ���˵�ȥ�� �����˵�
			menu.setPrendid("0");
		}
		Map<String ,Object> map = new HashMap<String ,Object>();
		if(!"".equals(menu.getId())){
			
			boolean flag = true;
			try{
				sysdao.updateMenu(menu);
			}catch(Exception e){
				e.printStackTrace();
				flag = false;
			}
			if(!flag){
				map.put("flag", false);
				map.put("msg", "���ݱ���ʧ�ܣ�����ϵ����Ա");
			}else{
				map.put("flag", true);
				map.put("msg", "���ݱ���ɹ�");
			}
		}else{
			String uuid = UUID.randomUUID().toString();
			menu.setId(uuid);
			boolean flag = true;
			try{
				sysdao.saveMenu(menu);
			}catch(Exception e){
				e.printStackTrace();
				flag = false;
			}
			if(!flag){
				map.put("flag", false);
				map.put("msg", "���ݱ���ʧ�ܣ�����ϵ����Ա");
			}else{
				map.put("flag", true);
				map.put("msg", "���ݱ���ɹ�");
			}
		}
		
		return map;
	}
	@Override
	public Map queryMenuOne(sysMenu menu) {
		sysMenu tempmenu = sysdao.queryMenuOne(menu);
		Map map = new HashMap();
		map.put("menu", tempmenu);
		return map;
	}
	@Override
	public Map<String, Object> deleteMenu(String ids) {
		Map<String ,Object> map = new HashMap<String ,Object>();
		String strs [] = ids.split(",");
		boolean flag = true;
		try{
			for(String str : strs){
				if("".equals(str)){
					continue;
				}
				sysdao.deleteMenu(str);
			}
		}catch(Exception e){
			e.printStackTrace();
			flag = false;
		}
		if(!flag){
			map.put("flag", false);
			map.put("msg", "����ɾ��ʧ�ܣ�����ϵ����Ա");
		}else{
			map.put("flag", true);
			map.put("msg", "����ɾ���ɹ�");
		}
		return map;
	}
	/**
	 * ��ʼ�������ֵ�
	 */
	@Override
	public Map<String, Object> initDataDictionary() {
		
		return null;
	}
	@Override
	public List<sysDict> sysDataDictionaryList(HttpServletRequest request,
			sysDict dict) {
		
		return  sysdao.sysDataDictionaryList(dict) ;
	}
	@Override
	public Map<String, Object> saveDataDictionary(sysDict dict) {
		
		Map<String ,Object> map = new HashMap<String ,Object>();
		if(!"".equals(dict.getId())){
			
			boolean flag = true;
			try{    
				sysdao.updateDataDictionary(dict);
			}catch(Exception e){
				e.printStackTrace();
				flag = false;
			}
			if(!flag){
				map.put("flag", false);
				map.put("msg", "���ݱ���ʧ�ܣ�����ϵ����Ա");
			}else{
				map.put("flag", true);
				map.put("msg", "���ݱ���ɹ�");
			}
		}else{
			String uuid = UUID.randomUUID().toString();
			dict.setId(uuid);
			boolean flag = true;
			try{
				sysdao.saveDataDictionary(dict);
			}catch(Exception e){
				e.printStackTrace();
				flag = false;
			}
			if(!flag){
				map.put("flag", false);
				map.put("msg", "���ݱ���ʧ�ܣ�����ϵ����Ա");
			}else{
				map.put("flag", true);
				map.put("msg", "���ݱ���ɹ�");
			}
		}
		
		return map;
	}
	@Override
	public Map<String, Object> deleteDataDictionary(String ids) {
		Map<String ,Object> map = new HashMap<String ,Object>();
		String strs [] = ids.split(",");
		boolean flag = true;
		try{
			for(String str : strs){
				if("".equals(str)){
					continue;
				}
				sysdao.deleteDataDictionary(str);
			}
		}catch(Exception e){
			e.printStackTrace();
			flag = false;
		}
		if(!flag){
			map.put("flag", false);
			map.put("msg", "����ɾ��ʧ�ܣ�����ϵ����Ա");
		}else{
			map.put("flag", true);
			map.put("msg", "����ɾ���ɹ�");
		}
		return map;
	}
	@Override
	public Map queryDataDictionaryOne(sysDict dict) {
		sysDict DataDictionary = sysdao.queryDataDictionaryOne(dict);
		Map map = new HashMap();
		map.put("DataDictionary", DataDictionary);
		return map;
	}
	@Override
	public List<sysUser> sysUserList(HttpServletRequest request, sysUser user) {
		
		return sysdao.sysUserList(user);
	}
	@Override
	public Map<String, Object> saveUser(sysUser user) {
		
		Map<String ,Object> map = new HashMap<String ,Object>();
		if(!"".equals(user.getId())){
			
			boolean flag = true;
			try{    
				sysdao.updateUser(user);
			}catch(Exception e){
				e.printStackTrace();
				flag = false;
			}
			if(!flag){
				map.put("flag", false);
				map.put("msg", "���ݱ���ʧ�ܣ�����ϵ����Ա");
			}else{
				map.put("flag", true);
				map.put("msg", "���ݱ���ɹ�");
			}
		}else{
			String uuid = UUID.randomUUID().toString();
			user.setId(uuid);
			boolean flag = true;
			try{
				sysdao.saveUser(user);
			}catch(Exception e){
				e.printStackTrace();
				flag = false;
			}
			if(!flag){
				map.put("flag", false);
				map.put("msg", "���ݱ���ʧ�ܣ�����ϵ����Ա");
			}else{
				map.put("flag", true);
				map.put("msg", "���ݱ���ɹ�");
			}
		}
		
		return map;
	}
	@Override
	public Map queryUserOne(sysUser user) {
		sysUser tempuser = sysdao.queryUserOne(user);
		Map map = new HashMap();
		map.put("User", tempuser);
		return map;
	}
	@Override
	public Map<String, Object> deleteUser(String ids) {
		Map<String ,Object> map = new HashMap<String ,Object>();
		String strs [] = ids.split(",");
		boolean flag = true;
		try{
			for(String str : strs){
				if("".equals(str)){
					continue;
				}
				sysdao.deleteUser(str);
			}
		}catch(Exception e){
			e.printStackTrace();
			flag = false;
		}
		if(!flag){
			map.put("flag", false);
			map.put("msg", "����ɾ��ʧ�ܣ�����ϵ����Ա");
		}else{
			map.put("flag", true);
			map.put("msg", "����ɾ���ɹ�");
		}
		return map;
	}
	@Override
	public List<sysRole> sysRoleList(HttpServletRequest request, sysRole role) {
		// TODO Auto-generated method stub
		return sysdao.sysRoleList(role);
	}
	@Override
	public Map getUserToRoleOne(sysUser user) {
		// TODO Auto-generated method stub
		List<sysUser> userList = sysdao.getUserToRoleOne(user);
		Map map = new HashMap();
		map.put("userList", userList.get(0));
		return map;
	}
	@Override
	public Map ToRole(String userId, String roleId) {
		Map<String ,Object> map = new HashMap<String ,Object>();
		sysUser user = new sysUser();
		user.setId(userId);
		sysRole role = new sysRole();
		role.setId(roleId);
		user.setSysrole(role);
		sysUser tempUser = sysdao.queryToRole(user);
		if(tempUser == null ){
			boolean flag = true;
			try{    
				sysdao.ToRole(user);
			}catch(Exception e){
				e.printStackTrace();
				flag = false;
			}
			if(!flag){
				map.put("flag", false);
				map.put("msg", "��ɫ����ʧ�ܣ�����ϵ����Ա");
			}else{
				map.put("flag", true);
				map.put("msg", "��ɫ����ɹ�");
			}
			
		}else{
			map.put("flag", false);
			map.put("msg", "��ɫ�Ѿ�����");
		}
		return map;
	}
	@Override
	public Map restToRole(String userId, String roleId) {
		Map<String ,Object> map = new HashMap<String ,Object>();
		sysUser user = new sysUser();
		user.setId(userId);
		sysRole role = new sysRole();
		role.setId(roleId);
		user.setSysrole(role);
			boolean flag = true;
			try{    
				sysdao.restToRole(user);
			}catch(Exception e){
				e.printStackTrace();
				flag = false;
			}
			if(!flag){
				map.put("flag", false);
				map.put("msg", "��ɫ����ʧ�ܣ�����ϵ����Ա");
			}else{
				map.put("flag", true);
				map.put("msg", "��ɫ���سɹ�");
			}
		return map;
	}
	@Override
	public Map<String, Object> saveRole(sysRole role) {
		
		Map<String ,Object> map = new HashMap<String ,Object>();
		if(!"".equals(role.getId())){
			
			boolean flag = true;
			try{
				sysdao.updateRole(role);
			}catch(Exception e){
				e.printStackTrace();
				flag = false;
			}
			if(!flag){
				map.put("flag", false);
				map.put("msg", "���ݱ���ʧ�ܣ�����ϵ����Ա");
			}else{
				map.put("flag", true);
				map.put("msg", "���ݱ���ɹ�");
			}
		}else{
			String uuid = UUID.randomUUID().toString();
			role.setId(uuid);
			boolean flag = true;
			try{
				sysdao.saveRole(role);
			}catch(Exception e){
				e.printStackTrace();
				flag = false;
			}
			if(!flag){
				map.put("flag", false);
				map.put("msg", "���ݱ���ʧ�ܣ�����ϵ����Ա");
			}else{
				map.put("flag", true);
				map.put("msg", "���ݱ���ɹ�");
			}
		}
		
		return map;
	}
	@Override
	public Map<String, Object> deleteRole(String ids) {
		Map<String ,Object> map = new HashMap<String ,Object>();
		String strs [] = ids.split(",");
		boolean flag = true;
		try{
			for(String str : strs){
				if("".equals(str)){
					continue;
				}
				sysdao.deleteRole(str);
			}
		}catch(Exception e){
			e.printStackTrace();
			flag = false;
		}
		if(!flag){
			map.put("flag", false);
			map.put("msg", "����ɾ��ʧ�ܣ�����ϵ����Ա");
		}else{
			map.put("flag", true);
			map.put("msg", "����ɾ���ɹ�");
		}
		return map;
	}
	@Override
	public Map queryRoleOne(sysRole role) {
		sysRole tempRole = sysdao.queryRoleOne(role);
		Map map = new HashMap();
		map.put("Role", tempRole);
		return map;
	}
	@Override
	public Map getRoleToMenuOne(sysRole role) {
		// TODO Auto-generated method stub
		List<sysRole> roleList = sysdao.getRoleToMenuOne(role);
		Map map = new HashMap();
		map.put("roleList", roleList.get(0));
		return map;
	}
	@Override
	public Map restToMenu(String roleId, String menuId) {
		Map<String ,Object> map = new HashMap<String ,Object>();
		sysRole role = new sysRole();
		role.setId(roleId);
		sysMenu menu = new sysMenu();
		menu.setId(menuId);
		role.setSysmenu(menu);
			boolean flag = true;
			try{    
				sysdao.restToMenu(role);
			}catch(Exception e){
				e.printStackTrace();
				flag = false;
			}
			if(!flag){
				map.put("flag", false);
				map.put("msg", "�˵�����ʧ�ܣ�����ϵ����Ա");
			}else{
				map.put("flag", true);
				map.put("msg", "�˵����سɹ�");
			}
		return map;
	}
	@Override
	public Map ToMenu(String roleId, String menuId) {
		Map<String ,Object> map = new HashMap<String ,Object>();
		sysRole role = new sysRole();
		role.setId(roleId);
		sysMenu menu = new sysMenu();
		menu.setId(menuId);
		role.setSysmenu(menu);
		sysRole tempRole = sysdao.queryToMenu(role);
		if(tempRole == null ){
			boolean flag = true;
			try{    
				sysdao.ToMenu(role);
			}catch(Exception e){
				e.printStackTrace();
				flag = false;
			}
			if(!flag){
				map.put("flag", false);
				map.put("msg", "��ɫ����ʧ�ܣ�����ϵ����Ա");
			}else{
				map.put("flag", true);
				map.put("msg", "��ɫ����ɹ�");
			}
			
		}else{
			map.put("flag", false);
			map.put("msg", "��ɫ�Ѿ�����");
		}
		return map;
	}
	@Override
	public List<xsb> sysxuesheng(HttpServletRequest request, xsb xs,bjtable bjb) {
		
		return sysdao.sysxuesheng();
	}
	@Override
	public Map<String, Object> savexuesheng(xsb xs, bjtable bjb) {
		xs.setBjid(bjb.getBjmc());
		Map<String ,Object> map = new HashMap<String ,Object>();
		if(!"".equals(xs.getXsid())){
			
			boolean flag = true;
			try{    
				sysdao.updatexuesheng(xs);
			}catch(Exception e){
				e.printStackTrace();
				flag = false;
			}
			if(!flag){
				map.put("flag", false);
				map.put("msg", "���ݱ���ʧ�ܣ�����ϵ����Ա");
			}else{
				map.put("flag", true);
				map.put("msg", "���ݱ���ɹ�");
			}
		}else{
			String uuid = UUID.randomUUID().toString();
			xs.setXsid(uuid);
			boolean flag = true;
			try{
				sysdao.savexuesheng(xs);
			}catch(Exception e){
				e.printStackTrace();
				flag = false;
			}
			if(!flag){
				map.put("flag", false);
				map.put("msg", "���ݱ���ʧ�ܣ�����ϵ����Ա");
			}else{
				map.put("flag", true);
				map.put("msg", "���ݱ���ɹ�");
			}
		}
		
		return map;
	}
	@Override
	public Map<String, Object> initxuesheng() {
		List<combobox> list = sysdao.initxuesheng();//�˵�����
		Map map = new HashMap();
		map.put("bjmc", list);
		return map;
	}
	@Override
	public Map<String, Object> queryxueshengOne(xsb xs, bjtable bjb) {
		// TODO Auto-generated method stub
		List<xsb> list = sysdao.queryxueshengOne(xs);
		Map map = new HashMap();
		map.put("list", list.get(0));
		return map;
	}
	@Override
	public Map<String, Object> deletexuesheng(String ids) {
		Map<String ,Object> map = new HashMap<String ,Object>();
		String strs [] = ids.split(",");
		boolean flag = true;
		try{
			for(String str : strs){
				if("".equals(str)){
					continue;
				}
				sysdao.deletexuesheng(str);
			}
		}catch(Exception e){
			e.printStackTrace();
			flag = false;
		}
		if(!flag){
			map.put("flag", false);
			map.put("msg", "����ɾ��ʧ�ܣ�����ϵ����Ա");
		}else{
			map.put("flag", true);
			map.put("msg", "����ɾ���ɹ�");
		}
		return map;
	}
}
