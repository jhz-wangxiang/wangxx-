package com.efrobot.robotstore.baseapi.manager;
import java.util.List;

import com.efrobot.robotstore.baseapi.manager.pojo.Count;
import com.efrobot.robotstore.baseapi.manager.pojo.Order;

public interface OrderMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);
    
    int setDispatched(Order record);

    int updateByPrimaryKey(Order record);
    
    List<Order> selectByParms(Order record);
    
    List<Count> getOrderCountDay(Order record);
    
    List<Count> getOrderCountWeek(Order record);
    
    List<Count> getOrderCountMon(Order record);
    
    List<Count> getOrderCountYear(Order record);
    
    List<Count> getOrderStaffYear(Order record);
    List<Count> getOrderStaffMon(Order record);
    List<Count> getOrderStaffWeek(Order record);
    List<Count> getOrderStaffDay(Order record);
    
    List<Count> getOrderPayTypeDay(Order record);
    List<Count> getOrderPayTypeWeek(Order record);
    List<Count> getOrderPayTypeMon(Order record);
    List<Count> getOrderPayTypeYear(Order record);
    
    List<Count> getOrderFlightDay(Order record);
    List<Count> getOrderFlightWeek(Order record);
    List<Count> getOrderFlightMon(Order record);
    List<Count> getOrderFlightYear(Order record);
    
    List<Count> getOrderAreaDay(Order record);
    List<Count> getOrderAreaMon(Order record);
    List<Count> getOrderAreaWeek(Order record);
    List<Count> getOrderAreaYear(Order record);
    
    List<Count> getOrderChannelDay(Order record);
    List<Count> getOrderChannelWeek(Order record);
    List<Count> getOrderChannelMon(Order record);
    List<Count> getOrderChannelYear(Order record);
    
}