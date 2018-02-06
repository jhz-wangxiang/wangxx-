package com.efrobot.robotstore.manager.service;

import java.util.List;

import com.efrobot.robotstore.baseapi.manager.pojo.FlightNum;
import com.efrobot.robotstore.baseapi.manager.pojo.Order;
import com.efrobot.robotstore.baseapi.manager.pojo.SysRole;
import com.efrobot.robotstore.util.PageInfo;

public interface SysRoleService {
	
	public PageInfo<SysRole> getRoleListPage(SysRole order, Integer pageNum, Integer pageSize)
			throws Exception;

	public int insertSelective(SysRole record);
	
	public int updateByPrimaryKeySelective(SysRole record);
	
	public int deleteByPrimaryKey(Integer id);
	
	public List<SysRole> getRoleAll(SysRole record);
}