package com.efrobot.robotstore.baseapi.manager;

import com.efrobot.robotstore.baseapi.manager.pojo.SysMenu;

public interface SysMenuMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(SysMenu record);

    int insertSelective(SysMenu record);

    SysMenu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysMenu record);

    int updateByPrimaryKey(SysMenu record);
}