package com.efrobot.robotstore.manager.service;

import java.util.List;

import com.efrobot.robotstore.baseapi.manager.pojo.Address;
import com.efrobot.robotstore.baseapi.manager.pojo.Order;

public interface AddressService {
	 public int insertSelective(Address record);
	 public  List<Address> getAddress(Address record);
	 
	 public int updateByPrimaryKey(Address record);
	 
	 public int updateByPrimaryKeySelective(Address record);
	 
	 public int updateAddressStatus(Address record);
	 
	 public int deleteByPrimaryKey(Integer id);
	 
	 public Address selectByPrimaryKey(Integer id);
	
}