package com.efrobot.robotstore.baseapi.manager;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.efrobot.robotstore.baseapi.manager.pojo.OrderStatusRecord;

public interface OrderStatusRecordMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(OrderStatusRecord record);

    int insertSelective(OrderStatusRecord record);

    OrderStatusRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderStatusRecord record);

    int updateByPrimaryKey(OrderStatusRecord record);
}