package com.efrobot.robotstore.manager.service;

import java.util.List;

import com.efrobot.robotstore.baseapi.manager.pojo.Address;
import com.efrobot.robotstore.baseapi.manager.pojo.Order;
import com.efrobot.robotstore.baseapi.manager.pojo.User;

public interface UserService {
	public  List<User> selectByUser(User record);	
	
	public int insertSelective(User record);

	public int updateByPrimaryKeySelective(User record);
}