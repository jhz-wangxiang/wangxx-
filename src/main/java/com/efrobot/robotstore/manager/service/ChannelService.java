package com.efrobot.robotstore.manager.service;

import com.efrobot.robotstore.baseapi.manager.pojo.Channel;
import com.efrobot.robotstore.util.PageInfo;

public interface ChannelService {
	
	public PageInfo<Channel> getChannelListPage(Channel channel, Integer pageNum, Integer pageSize)
			throws Exception;

	public int insertSelective(Channel record);
//	
	public int updateByPrimaryKeySelective(Channel record);
	
	public int deleteByPrimaryKey(Integer id);
//	
}