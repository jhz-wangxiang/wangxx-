package com.efrobot.robotstore.baseapi.manager;

import com.efrobot.robotstore.baseapi.manager.pojo.SysRole;

public interface SysRoleMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(SysRole record);

    int insertSelective(SysRole record);

    SysRole selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysRole record);

    int updateByPrimaryKey(SysRole record);
}