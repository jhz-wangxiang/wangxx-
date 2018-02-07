package com.efrobot.robotstore.manager.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.efrobot.robotstore.baseapi.manager.FlightNumMapper;
import com.efrobot.robotstore.baseapi.manager.SysRoleMapper;
import com.efrobot.robotstore.baseapi.manager.SysUserMapper;
import com.efrobot.robotstore.baseapi.manager.pojo.FlightNum;
import com.efrobot.robotstore.baseapi.manager.pojo.Order;
import com.efrobot.robotstore.baseapi.manager.pojo.SysRole;
import com.efrobot.robotstore.baseapi.manager.pojo.SysUser;
import com.efrobot.robotstore.manager.service.FlightNumService;
import com.efrobot.robotstore.manager.service.SysRoleService;
import com.efrobot.robotstore.util.PageInfo;
import com.github.pagehelper.PageHelper;

@Service
public class FlightNumServiceImpl implements FlightNumService {

	@Resource
	private FlightNumMapper flightNumMapper;
	@Override
	public PageInfo<FlightNum> getFlightNumListPage(FlightNum role, Integer pageNum, Integer pageSize)
			throws Exception {
		PageHelper.startPage(pageNum, pageSize);
		List<FlightNum> list = flightNumMapper.selectByParms(role);
		PageInfo<FlightNum> page = new PageInfo<FlightNum>(list);
		return page;
	}
	
	@Override
	public int insertSelective(FlightNum record){
		return flightNumMapper.insertSelective(record);
	}
	@Override
	public int updateByPrimaryKeySelective(FlightNum record){
		return flightNumMapper.updateByPrimaryKeySelective(record);
	}
	
	@Override
	public int deleteByPrimaryKey(Integer id){
		return flightNumMapper.deleteByPrimaryKey(id);
	}
	
}
