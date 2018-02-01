package com.efrobot.robotstore.util;

import org.apache.commons.lang.enums.ValuedEnum;

/**
 * @包名 com.efrobot.robotstore.util
 * @类名 Const.java
 * @作者 zhouletian 
 * @创建日期 2016年7月13日
 * @描述 常用常量
 * @版本 V 1.0
 */
public interface Const {
	public static final String SESSION_SECURITY_CODE = "sessionSecCode";
	public static final String SESSION_USER = "sessionUser";            //当前用户的对象信息
	public static final String SESSION_ROLE_RIGHTS = "sessionRoleRights"; //角色权限信息
	public static final String SESSION_menuList = "menuList";			//当前菜单
	public static final String SESSION_allmenuList = "allmenuList";		//全部菜单
	//public static final String SESSION_QX = "QX";                       //附加权限信息
	public static final String SESSION_userpds = "userpds";			
	public static final String SESSION_USERNAME = "USERNAME";			//用户名
	public static final String TRUE = "T";
	public static final String FALSE = "F";
	public static final String LOGIN = "/login_toLogin.do";				//登录地址

	/**
	 * 操作类型 1：新增 2：修改 3：删除 4：查询 5:登入 6：登出 7：导出
	 * 
	 * @author lihl2
	 * 
	 */
	static class OperationTypeEnum extends ValuedEnum {
		protected OperationTypeEnum(String name, int value) {
			super(name, value);
		}

		private static final long serialVersionUID = 1L;

		static final int INSERT_VAL = 1, UPDATE_VAL = 2, DEL_VAL = 3, QUERY_VAL = 4,
				LOGIN_VAL = 5 , LOGOUT_VAL = 6 , EXPORT_VAL = 7,IMPORT_VAL = 8;

		public static final OperationTypeEnum INSERT = new OperationTypeEnum("新增",
				INSERT_VAL);
		public static final OperationTypeEnum UPDATE = new OperationTypeEnum("更新",
				UPDATE_VAL);
		public static final OperationTypeEnum DEL = new OperationTypeEnum("删除",
				DEL_VAL);
		public static final OperationTypeEnum QUERY = new OperationTypeEnum("查询",
				QUERY_VAL);
		
		public static final OperationTypeEnum LOGIN = new OperationTypeEnum("登入",
				LOGIN_VAL);
		public static final OperationTypeEnum LOGOUT = new OperationTypeEnum("登出",
				LOGOUT_VAL);
		public static final OperationTypeEnum EXPORT = new OperationTypeEnum("导出",
				EXPORT_VAL);
		public static final OperationTypeEnum IMPORT = new OperationTypeEnum("导入",
				IMPORT_VAL);
		
		public static String getOperationName(int key){
			String str = "";
			switch (key) {
			case OperationTypeEnum.INSERT_VAL:
				str = OperationTypeEnum.INSERT.getName();
				break;
			case OperationTypeEnum.UPDATE_VAL:
				str = OperationTypeEnum.UPDATE.getName();
				break;
			case OperationTypeEnum.DEL_VAL:
				str = OperationTypeEnum.DEL.getName();
				break;
			case OperationTypeEnum.QUERY_VAL:
				str = OperationTypeEnum.QUERY.getName();
				break;
			case OperationTypeEnum.LOGIN_VAL:
				str = OperationTypeEnum.LOGIN.getName();
				break;
			case OperationTypeEnum.LOGOUT_VAL:
				str = OperationTypeEnum.LOGOUT.getName();
				break;
			case OperationTypeEnum.EXPORT_VAL:
				str = OperationTypeEnum.EXPORT.getName();
				break;
			case OperationTypeEnum.IMPORT_VAL:
				str = OperationTypeEnum.IMPORT.getName();
				break;

			default:
				str = "";
				break;
			}
			return str;
		}
	}
	
	
	/**
	 * @描述 模块枚举 1:用户登录  2：用户登出  3：导出功能  4：商品管理  5：订单管理
	 * @版本 V 1.0
	 */
	static class ModuleEnum extends ValuedEnum {
		protected ModuleEnum(String name, int value) {
			super(name, value);
		}

		private static final long serialVersionUID = 1L;

		static final int LOGIN_VAL = 1, LOGOUT_VAL = 2, EXPORT_VAL = 3, SYS_PRODUCT_VAL = 4, SYS_ORDER_VAL = 5, LOGISTICS_MANAGER_VAL = 6;

		public static final ModuleEnum LOGIN = new ModuleEnum("用户登陆",
				LOGIN_VAL);
		public static final ModuleEnum LOGOUT = new ModuleEnum("用户登出",
				LOGOUT_VAL);
		public static final ModuleEnum EXPORT = new ModuleEnum("导出功能",
				EXPORT_VAL);
		public static final ModuleEnum SYS_PRODUCT = new ModuleEnum("商品管理",
				SYS_PRODUCT_VAL);
		public static final ModuleEnum SYS_ORDER = new ModuleEnum("订单管理",
				SYS_ORDER_VAL);
		
		public static final ModuleEnum  LOGISTICS_MANAGER = new ModuleEnum("物流管理",
				LOGISTICS_MANAGER_VAL);
		
		
		public static String getModuleName(int key){
			String str = "";
			switch (key) {
			case ModuleEnum.LOGIN_VAL:
				str = ModuleEnum.LOGIN.getName();
				break;
			case ModuleEnum.LOGOUT_VAL:
				str = ModuleEnum.LOGOUT.getName();
				break;
			case ModuleEnum.EXPORT_VAL:
				str = ModuleEnum.EXPORT.getName();
				break;
			case ModuleEnum.SYS_PRODUCT_VAL:
				str = ModuleEnum.SYS_PRODUCT.getName();
				break;
			case ModuleEnum.SYS_ORDER_VAL:
				str = ModuleEnum.SYS_ORDER.getName();
				break;
			case ModuleEnum.LOGISTICS_MANAGER_VAL:
				str = ModuleEnum.LOGISTICS_MANAGER.getName();
				break;

			default:
				str = "";
				break;
			}
			return str;
		}
		public static int getModuleCode(String key){
			if(ModuleEnum.LOGIN.getName().equals(key)){
				return ModuleEnum.LOGIN_VAL;
			}else if(ModuleEnum.LOGOUT.getName().equals(key)){
				return ModuleEnum.LOGOUT_VAL;
			}else if(ModuleEnum.EXPORT.getName().equals(key)){
				return ModuleEnum.EXPORT_VAL;
			}else if(ModuleEnum.SYS_PRODUCT.getName().equals(key)){
				return ModuleEnum.SYS_PRODUCT_VAL;
			}else if(ModuleEnum.SYS_ORDER.getName().equals(key)){
				return ModuleEnum.SYS_ORDER_VAL;
			}else if(ModuleEnum.LOGISTICS_MANAGER.getName().equals(key)){
				return ModuleEnum.LOGISTICS_MANAGER_VAL;
			}else if(ModuleEnum.LOGIN.getName().equals(key)){
				return ModuleEnum.LOGIN_VAL;
			}else{
				return 0;
			}
		}
	}
	
}
