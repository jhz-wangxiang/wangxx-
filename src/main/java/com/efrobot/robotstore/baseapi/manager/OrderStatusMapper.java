package com.efrobot.robotstore.baseapi.manager;

import java.util.List;

import com.efrobot.robotstore.baseapi.manager.pojo.OrderStatus;

public interface OrderStatusMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(OrderStatus record);

    int insertSelective(OrderStatus record);

    OrderStatus selectByPrimaryKey(Integer id);
    
    List<OrderStatus> selectSelectList(List<String> list);

    int updateByPrimaryKeySelective(OrderStatus record);

    int updateByPrimaryKey(OrderStatus record);
}