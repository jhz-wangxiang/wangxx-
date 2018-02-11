package com.efrobot.robotstore.baseapi.manager;
import java.util.List;

import com.efrobot.robotstore.baseapi.manager.pojo.Dispatched;

public interface DispatchedMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Dispatched record);

    int insertSelective(Dispatched record);

    Dispatched selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Dispatched record);

    int updateByPrimaryKey(Dispatched record);
    
    List<Dispatched> getDispatched(Dispatched channel);
}