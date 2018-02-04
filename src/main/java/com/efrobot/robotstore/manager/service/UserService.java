package com.efrobot.robotstore.manager.service;

import java.util.List;

import com.efrobot.robotstore.baseapi.manager.pojo.Address;
import com.efrobot.robotstore.baseapi.manager.pojo.Order;
import com.efrobot.robotstore.baseapi.manager.pojo.User;
import com.efrobot.robotstore.util.PageInfo;

public interface UserService {
	public  List<User> selectByUser(User record);	
	
	public int insertSelective(User record);

	public int updateByPrimaryKeySelective(User record);
	
	public PageInfo<User> getUserListPage(User order, Integer pageNum, Integer pageSize)
			throws Exception;
}