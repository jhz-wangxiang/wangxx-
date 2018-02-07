package com.efrobot.robotstore.manager.service;

import java.util.List;

import com.efrobot.robotstore.baseapi.manager.pojo.FlightNum;
import com.efrobot.robotstore.baseapi.manager.pojo.Order;
import com.efrobot.robotstore.baseapi.manager.pojo.SysRole;
import com.efrobot.robotstore.util.PageInfo;

public interface FlightNumService {
	
	public PageInfo<FlightNum> getFlightNumListPage(FlightNum order, Integer pageNum, Integer pageSize)
			throws Exception;

	public int insertSelective(FlightNum record);
	
	public int updateByPrimaryKeySelective(FlightNum record);
	
	public int deleteByPrimaryKey(Integer id);
}