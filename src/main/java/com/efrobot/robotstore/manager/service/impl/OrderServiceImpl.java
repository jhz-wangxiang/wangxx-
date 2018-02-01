package com.efrobot.robotstore.manager.service.impl;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.efrobot.robotstore.baseapi.manager.AreaMapper;
import com.efrobot.robotstore.baseapi.manager.ChannelMapper;
import com.efrobot.robotstore.baseapi.manager.FlightNumMapper;
import com.efrobot.robotstore.baseapi.manager.OrderMapper;
import com.efrobot.robotstore.baseapi.manager.OrderStatusMapper;
import com.efrobot.robotstore.baseapi.manager.pojo.Area;
import com.efrobot.robotstore.baseapi.manager.pojo.Channel;
import com.efrobot.robotstore.baseapi.manager.pojo.FlightNum;
import com.efrobot.robotstore.baseapi.manager.pojo.Order;
import com.efrobot.robotstore.baseapi.manager.pojo.OrderStatus;
import com.efrobot.robotstore.manager.service.OrderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class OrderServiceImpl implements OrderService {

	@Resource
	private OrderMapper orderMapper;
	@Resource
	private OrderStatusMapper orderStatusMapper;
	@Resource
	private ChannelMapper channelMapper;
	@Resource
	private AreaMapper areaMapper;
	@Resource
	private FlightNumMapper flightNumMapper;


	@Override
	public PageInfo<Order> getOrderListPage(Order order, Integer pageNum, Integer pageSize)
			throws Exception {
		PageHelper.startPage(pageNum, pageSize);
		List<Order> list = orderMapper.selectByParms(order);
		PageInfo<Order> page = new PageInfo<Order>(list);
		return page;
	}
	
	@Override
	public int insertSelective(Order record) {
		return orderMapper.insertSelective(record);
	}
	
	@Override
	public int updateByPrimaryKey(Order record) {
		return orderMapper.updateByPrimaryKey(record);
	}
	@Override
	public int updateByPrimaryKeySelective(Order record) {
		return orderMapper.updateByPrimaryKeySelective(record);
	}
	
	@Override
	public List<OrderStatus> selectSelectList(String selected) {
		return orderStatusMapper.selectSelectList(Arrays.asList(selected.split(",")));
	}
	@Override
	public  List<Channel> getChannel(Channel record) {
		return channelMapper.getChannel(record);
	}
	@Override
	public  List<Area> getArea(Area record) {
		return areaMapper.getArea(record);
	}
	@Override
	public  List<FlightNum> getFlightNum(FlightNum record) {
		return flightNumMapper.getFlightNum(record);
	}
	@Override
	public  Order selectByPrimaryKey(Integer id) {
		return orderMapper.selectByPrimaryKey(id);
	}
}
