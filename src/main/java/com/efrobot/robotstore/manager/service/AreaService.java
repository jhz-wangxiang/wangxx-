package com.efrobot.robotstore.manager.service;

import java.util.List;

import com.efrobot.robotstore.baseapi.manager.pojo.Area;
import com.efrobot.robotstore.util.PageInfo;

public interface AreaService {
	
	public PageInfo<Area> getAreaListPage(Area order, Integer pageNum, Integer pageSize)
			throws Exception;
//
	public int insertSelective(Area record);
//	
	public int updateByPrimaryKeySelective(Area record);
//	
	public int deleteByPrimaryKey(Integer id);
	
	public List<Area> selectByParms(Area record);
}