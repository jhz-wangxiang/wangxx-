package com.efrobot.robotstore.manager.service;

import java.util.List;

import com.efrobot.robotstore.baseapi.manager.pojo.SysMenuDto;

public interface SysMenuService {

    List< SysMenuDto > selectAllMenuByRole( List<String> list ) throws Exception;

}