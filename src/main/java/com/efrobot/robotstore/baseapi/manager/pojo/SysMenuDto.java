package com.efrobot.robotstore.baseapi.manager.pojo;

import java.util.List;

public class SysMenuDto extends SysMenu{

	
	private static final long serialVersionUID = 1L;
	
	private List<SysMenu> sysMenu;

	public List<SysMenu> getSysMenu() {
		return sysMenu;
	}

	public void setSysMenu(List<SysMenu> sysMenu) {
		this.sysMenu = sysMenu;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}