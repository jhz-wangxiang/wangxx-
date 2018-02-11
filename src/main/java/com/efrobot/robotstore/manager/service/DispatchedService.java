package com.efrobot.robotstore.manager.service;

import com.efrobot.robotstore.baseapi.manager.pojo.Dispatched;
import com.efrobot.robotstore.util.PageInfo;

public interface DispatchedService {
	
	public PageInfo<Dispatched> getDispatchedListPage(Dispatched channel, Integer pageNum, Integer pageSize)
			throws Exception;

	public int insertSelective(Dispatched record);
//	
	public int updateByPrimaryKeySelective(Dispatched record);
	
	public int deleteByPrimaryKey(Integer id);
//	
}