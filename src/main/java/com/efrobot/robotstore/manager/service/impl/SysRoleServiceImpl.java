package com.efrobot.robotstore.manager.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.efrobot.robotstore.baseapi.manager.SysRoleMapper;
import com.efrobot.robotstore.baseapi.manager.SysUserMapper;
import com.efrobot.robotstore.baseapi.manager.pojo.Order;
import com.efrobot.robotstore.baseapi.manager.pojo.SysRole;
import com.efrobot.robotstore.baseapi.manager.pojo.SysUser;
import com.efrobot.robotstore.manager.service.SysRoleService;
import com.efrobot.robotstore.util.PageInfo;
import com.github.pagehelper.PageHelper;

@Service
public class SysRoleServiceImpl implements SysRoleService {

	@Resource
	private SysRoleMapper sysRoleMapper;
	@Resource
	private SysUserMapper sysUserMapper;
	@Override
	public PageInfo<SysRole> getRoleListPage(SysRole role, Integer pageNum, Integer pageSize)
			throws Exception {
		PageHelper.startPage(pageNum, pageSize);
		List<SysRole> list = sysRoleMapper.selectByParms(role);
		for(SysRole r:list){
			SysUser record=new SysUser();
			record.setRoleId(r.getId());
			 List<SysUser> list2=sysUserMapper.selectByParms(record);
			r.setName(StringUtils.join(list2.toArray(), ","));
		} 
		PageInfo<SysRole> page = new PageInfo<SysRole>(list);
		return page;
	}
	
	@Override
	public int insertSelective(SysRole record){
		return sysRoleMapper.insertSelective(record);
	}
	@Override
	public int updateByPrimaryKeySelective(SysRole record){
		return sysRoleMapper.updateByPrimaryKeySelective(record);
	}
	
	@Override
	public int deleteByPrimaryKey(Integer id){
		return sysRoleMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	public List<SysRole> getRoleAll(SysRole record){
		List<SysRole> list= sysRoleMapper.selectByParms(record);
		return list;
	}
	
}
