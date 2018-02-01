package com.efrobot.robotstore.manager.service;

import java.util.List;

import com.efrobot.robotstore.baseapi.manager.pojo.Area;
import com.efrobot.robotstore.baseapi.manager.pojo.Channel;
import com.efrobot.robotstore.baseapi.manager.pojo.FlightNum;
import com.efrobot.robotstore.baseapi.manager.pojo.Order;
import com.efrobot.robotstore.baseapi.manager.pojo.OrderStatus;
import com.github.pagehelper.PageInfo;

public interface OrderService {
	public PageInfo<Order> getOrderListPage(Order order, Integer pageNum, Integer pageSize)
			throws Exception;
	
	public int insertSelective(Order record);
	
	public int updateByPrimaryKey(Order record);
	
	public int updateByPrimaryKeySelective(Order record);
	
	public List<OrderStatus> selectSelectList(String selected);
	
	public List<Channel> getChannel(Channel record);
	
	public List<Area> getArea(Area record);
	
	public List<FlightNum> getFlightNum(FlightNum record);
	
	public  Order selectByPrimaryKey(Integer id);

}