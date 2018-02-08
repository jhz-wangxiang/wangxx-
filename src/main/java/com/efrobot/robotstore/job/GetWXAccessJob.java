package com.efrobot.robotstore.job;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.efrobot.robotstore.baseapi.manager.OrderMapper;
import com.efrobot.robotstore.baseapi.manager.pojo.Order;

/**
 * 
 * 类的描述:获取微信token,js ticket Copyright 2015 JIQIREN Inc. All Rights Reserved.
 * 
 * @author wurui. Email:wurui@ren001.com
 * @date 2015年12月4日 下午2:40:35
 */

public class GetWXAccessJob {

	@Resource
	private OrderMapper orderMapper;

	protected void execute() {
		System.out.println("进入轮休取消订单操作");
		try {
			Order record = new Order();//未支付取消
			record.setOrderStatus(1);
			List<Order> list = orderMapper.selectByParms(record);
			for(Order order:list){
				Date dt=new Date();
				long cha = dt.getTime() - order.getCreateDate().getTime();
				double result = cha * 1.0 / (1000 * 60 * 60);
				if (result >= 24) {
					order.setOrderStatus(10);
					order.setRemark("超过24小时未支付");
					orderMapper.updateByPrimaryKeySelective(order);
					System.out.println("取消未支付的订单");
				}
			}
			
			Order record1 = new Order();//未确认取消
			record1.setOrderStatus(2);
			List<Order> list1 = orderMapper.selectByParms(record1);
			for(Order order:list1){
				Date dt=new Date();
				long cha = dt.getTime() - order.getCreateDate().getTime();
				double result = cha * 1.0 / (1000 * 60 * 60);
				if (result >= 24) {
					if(order.getOrderWxNo()!=null&&"".equals(order.getOrderWxNo())){
						order.setRemark("超过24小时未确认");
						order.setOrderStatus(10);
						orderMapper.updateByPrimaryKeySelective(order);
						System.out.println("取消未确认的订单");
					}
				}
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

}
