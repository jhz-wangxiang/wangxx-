package com.efrobot.robotstore.baseapi.manager;

import java.util.List;

import com.efrobot.robotstore.baseapi.manager.pojo.Area;

public interface AreaMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Area record);

    int insertSelective(Area record);

    Area selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Area record);

    int updateByPrimaryKey(Area record);
    
    List<Area> getArea(Area record);
}