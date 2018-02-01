package com.efrobot.robotstore.baseapi.manager;

import com.efrobot.robotstore.baseapi.manager.pojo.SysRole;

public interface SysRoleMapper {

    int deleteByPrimaryKey(Integer roleId);

    int insert(SysRole record);

    int insertSelective(SysRole record);

    SysRole selectByPrimaryKey(Integer roleId);

    int updateByPrimaryKeySelective(SysRole record);

    int updateByPrimaryKey(SysRole record);
}