package com.efrobot.robotstore.baseapi.manager;
import java.util.List;

import com.efrobot.robotstore.baseapi.manager.pojo.Order;

public interface OrderMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    
    List<Order> selectByParms(Order record);
}