package com.efrobot.robotstore.baseapi.manager;

import java.util.List;

import com.efrobot.robotstore.baseapi.manager.pojo.SysMenu;
import com.efrobot.robotstore.baseapi.manager.pojo.SysMenuDto;

public interface SysMenuMapper {

	int deleteByPrimaryKey(Integer menuId);

    int insert(SysMenu record);

    int insertSelective(SysMenu record);

    SysMenu selectByPrimaryKey(Integer menuId);

    int updateByPrimaryKeySelective(SysMenu record);

    int updateByPrimaryKey(SysMenu record);
    
    List<SysMenu> selectAllMenu(SysMenu record);
    
    List< SysMenuDto > selectAllMenuByRole(  List<String> list  );
    
    List<SysMenu> listAllParentMenu();
    
    List<SysMenu> listSubMenuByParentId(Integer menuId);
}