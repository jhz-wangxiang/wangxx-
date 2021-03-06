package com.efrobot.robotstore.manager.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.efrobot.robotstore.baseapi.manager.AddressMapper;
import com.efrobot.robotstore.baseapi.manager.pojo.Address;
import com.efrobot.robotstore.baseapi.manager.pojo.Order;
import com.efrobot.robotstore.baseapi.manager.pojo.User;
import com.efrobot.robotstore.manager.service.AddressService;
import com.efrobot.robotstore.util.PageInfo;
import com.github.pagehelper.PageHelper;

@Service
public class AddressServiceImpl implements AddressService {
	@Resource
	private AddressMapper addressMapper;
	@Override
	public int insertSelective(Address record) {
		return addressMapper.insertSelective(record);
	}
	@Override
	public  List<Address> getAddress(Address record){
		List<Address> list=addressMapper.getAddress(record);
		 return list;
	}
	@Override
	public int updateByPrimaryKey(Address record) {
		return addressMapper.updateByPrimaryKey(record);
	}
	@Override
	public int updateByPrimaryKeySelective(Address record) {
		return addressMapper.updateByPrimaryKeySelective(record);
	}
	@Override
	public int updateAddressStatus(Address record) {
		return addressMapper.updateAddressStatus(record);
	}
	@Override
	public int deleteByPrimaryKey(Integer id) {
		return addressMapper.deleteByPrimaryKey(id);
	}
	@Override
	public Address selectByPrimaryKey(Integer id){
		return addressMapper.selectByPrimaryKey(id);
	}
	
	@Override
	public PageInfo<Address> getAddressListPage(Address record, Integer pageNum, Integer pageSize)
			throws Exception {
		PageHelper.startPage(pageNum, pageSize);
		List<Address> list = addressMapper.getAddress(record);
		PageInfo<Address> page = new PageInfo<Address>(list);
		return page;
	}
}
