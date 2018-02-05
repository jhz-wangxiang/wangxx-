package com.efrobot.robotstore.manager.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.efrobot.robotstore.baseapi.manager.SysMenuMapper;
import com.efrobot.robotstore.baseapi.manager.pojo.SysMenuDto;
import com.efrobot.robotstore.manager.service.SysMenuService;

/**
 * 
 * @包名 com.efrobot.robotstore.manager.service.impl
 * @类名 SysUserServiceServiceImpl.java
 * @作者 wangxiangxiang
 * @创建日期 2016年7月13日
 * @描述 
 * @版本 V 1.0
 */
@Service
public class SysMenuServiceImpl implements SysMenuService {

	@Resource
	private SysMenuMapper sysMenuMapper;
	@Override
	public List< SysMenuDto > selectAllMenuByRole( List<String> list ){
		return sysMenuMapper.selectAllMenuByRole(list);
	}
	
}
