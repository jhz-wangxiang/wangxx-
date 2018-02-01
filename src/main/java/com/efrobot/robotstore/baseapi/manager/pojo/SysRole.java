package com.efrobot.robotstore.baseapi.manager.pojo;

import java.io.Serializable;

public class SysRole implements Serializable {
	/**
	* 
	*/
	private static final long serialVersionUID = 1L;
    private Integer roleId;

    private String roleName;

    private String statusQx;

    private String buttonQx;

    private String menuId;

    private String exp1;

    private String exp2;

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public String getStatusQx() {
        return statusQx;
    }

    public void setStatusQx(String statusQx) {
        this.statusQx = statusQx == null ? null : statusQx.trim();
    }

    public String getButtonQx() {
        return buttonQx;
    }

    public void setButtonQx(String buttonQx) {
        this.buttonQx = buttonQx == null ? null : buttonQx.trim();
    }

    public String getMenuId() {
        return menuId;
    }

    public void setMenuId(String menuId) {
        this.menuId = menuId == null ? null : menuId.trim();
    }

    public String getExp1() {
        return exp1;
    }

    public void setExp1(String exp1) {
        this.exp1 = exp1 == null ? null : exp1.trim();
    }

    public String getExp2() {
        return exp2;
    }

    public void setExp2(String exp2) {
        this.exp2 = exp2 == null ? null : exp2.trim();
    }
}