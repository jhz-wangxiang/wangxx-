package com.efrobot.robotstore.manager.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.efrobot.robotstore.baseapi.manager.AreaMapper;
import com.efrobot.robotstore.baseapi.manager.pojo.Area;
import com.efrobot.robotstore.manager.service.AreaService;
import com.efrobot.robotstore.util.PageInfo;
import com.github.pagehelper.PageHelper;

@Service
public class AreaServiceImpl implements AreaService {

	@Resource
	private AreaMapper areaMapper;
	@Override
	public PageInfo<Area> getAreaListPage(Area role, Integer pageNum, Integer pageSize)
			throws Exception {
		PageHelper.startPage(pageNum, pageSize);
		List<Area> list = areaMapper.selectByParms(role);
		PageInfo<Area> page = new PageInfo<Area>(list);
		return page;
	}
	
	@Override
	public int insertSelective(Area record){
		return areaMapper.insertSelective(record);
	}
	@Override
	public int updateByPrimaryKeySelective(Area record){
		return areaMapper.updateByPrimaryKeySelective(record);
	}
	
	@Override
	public int deleteByPrimaryKey(Integer id){
		return areaMapper.deleteByPrimaryKey(id);
	}
	
}
