package com.efrobot.robotstore.manager.service;

import java.util.List;

import com.efrobot.robotstore.baseapi.manager.pojo.Area;
import com.efrobot.robotstore.baseapi.manager.pojo.Channel;
import com.efrobot.robotstore.baseapi.manager.pojo.Count;
import com.efrobot.robotstore.baseapi.manager.pojo.FlightNum;
import com.efrobot.robotstore.baseapi.manager.pojo.Order;
import com.efrobot.robotstore.baseapi.manager.pojo.OrderStatus;
import com.efrobot.robotstore.baseapi.manager.pojo.OrderStatusRecord;
import com.efrobot.robotstore.util.PageInfo;

public interface OrderService {
	public PageInfo<Order> getOrderListPage(Order order, Integer pageNum, Integer pageSize)
			throws Exception;
	public PageInfo<Count> getOrderCount(Order order, Integer pageNum, Integer pageSize)
			throws Exception;
	
	public PageInfo<OrderStatusRecord> getOrderStatusRecordListPage(String orderNo, Integer pageNum, Integer pageSize)
			throws Exception;
	
	public List<Order> selectByParms(Order record) ;
	
	public List<Count> getOrderCountAll(Order record) ;
	
	public int insertSelective(Order record);
	
	public int updateByPrimaryKey(Order record);
	
	public int updateByPrimaryKeySelective(Order record);
	
	public int setDispatched(Order record);
	
	public List<OrderStatus> selectSelectList(String selected);
	
	public List<Channel> getChannel(Channel record);
	
	public List<OrderStatusRecord> selectByparms(String exp1);
	
	public List<Area> getArea(Area record);
	
	public List<FlightNum> getFlightNum(FlightNum record);
	
	public  Order selectByPrimaryKey(Integer id);
	
	public  int updateByPrimaryKeySelective(OrderStatusRecord record);
	
	public  int insertSelective(OrderStatusRecord record);

}