package com.efrobot.robotstore.baseapi.manager;

import java.util.List;

import com.efrobot.robotstore.baseapi.manager.pojo.SysRole;
import com.efrobot.robotstore.baseapi.manager.pojo.SysUser;

public interface SysUserMapper {
    
    // 根据用户名查询用户信息
    SysUser selectByUserName(String userName);
    
    int insertSelective(SysUser record);
    
    int updateByPrimaryKeySelective(SysUser record);
    
    SysUser selectByPrimaryKey(Integer id);
    
    List<SysUser> selectByParms(SysUser record);
}