package com.efrobot.robotstore.manager.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.efrobot.robotstore.baseapi.manager.ChannelMapper;
import com.efrobot.robotstore.baseapi.manager.SysRoleMapper;
import com.efrobot.robotstore.baseapi.manager.SysUserMapper;
import com.efrobot.robotstore.baseapi.manager.pojo.Channel;
import com.efrobot.robotstore.baseapi.manager.pojo.Order;
import com.efrobot.robotstore.baseapi.manager.pojo.SysRole;
import com.efrobot.robotstore.baseapi.manager.pojo.SysUser;
import com.efrobot.robotstore.manager.service.ChannelService;
import com.efrobot.robotstore.manager.service.SysRoleService;
import com.efrobot.robotstore.util.PageInfo;
import com.github.pagehelper.PageHelper;

@Service
public class ChannelServiceImpl implements ChannelService {

	@Resource
	private ChannelMapper channelMapper;

	@Override
	public PageInfo<Channel> getChannelListPage(Channel channel, Integer pageNum, Integer pageSize)
			throws Exception {
		PageHelper.startPage(pageNum, pageSize);
		List<Channel> list = channelMapper.getChannel(channel);
		PageInfo<Channel> page = new PageInfo<Channel>(list);
		return page;
	}
	
	@Override
	public int insertSelective(Channel record){
		return channelMapper.insertSelective(record);
	}
	@Override
	public int updateByPrimaryKeySelective(Channel record){
		return channelMapper.updateByPrimaryKeySelective(record);
	}
	
	@Override
	public int deleteByPrimaryKey(Integer id){
		return channelMapper.deleteByPrimaryKey(id);
	}
//	
//	@Override
//	public List<SysRole> getRoleAll(SysRole record){
//		List<SysRole> list= sysRoleMapper.selectByParms(record);
//		return list;
//	}
	
}
