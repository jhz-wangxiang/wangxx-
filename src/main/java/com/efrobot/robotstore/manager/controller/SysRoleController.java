package com.efrobot.robotstore.manager.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.efrobot.robotstore.baseapi.manager.pojo.Order;
import com.efrobot.robotstore.baseapi.manager.pojo.SysRole;
import com.efrobot.robotstore.baseapi.manager.pojo.User;
import com.efrobot.robotstore.manager.service.SysMenuService;
import com.efrobot.robotstore.manager.service.SysRoleService;
import com.efrobot.robotstore.util.CommonUtil;
import com.efrobot.robotstore.util.PageInfo;

@RequestMapping("/v1/role")
@Controller
public class SysRoleController {

	@Resource
	private SysRoleService sysRoleService;
	
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/getOrderListPage")
	@ResponseBody
	public JSONObject getRoleListPage(SysRole record, Integer pageNumber, Integer pageSize) throws Exception {
		JSONObject jsonObject = new JSONObject();
		PageInfo<SysRole> rows = null;
		JSONObject obj = new JSONObject();
		String result = "";
		rows = sysRoleService.getRoleListPage(record, pageNumber, pageSize);
		result = obj.toJSONString(rows, SerializerFeature.WriteMapNullValue, SerializerFeature.WriteNullNumberAsZero,
				SerializerFeature.WriteNullStringAsEmpty);

		jsonObject = JSONObject.parseObject(result);
		return jsonObject;
	}
	
	@RequestMapping(value = "/insertRole", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertRole(SysRole record) throws Exception {
		int result = -1;
		result = sysRoleService.insertSelective(record);
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1){
			return CommonUtil.resultMsg("SUCCESS", "信息插入成功");
		}else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
		
	}
	
	@RequestMapping(value = "/updateRole", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateRole(SysRole record) throws Exception {
		int result = -1;
		result = sysRoleService.updateByPrimaryKeySelective(record);
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1){
			return CommonUtil.resultMsg("SUCCESS", "修改成功");
		}else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
		
	}
	
	@RequestMapping(value = "/deleteRole", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteRole(Integer id) throws Exception {
		int result = -1;
		result = sysRoleService.deleteByPrimaryKey(id);
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1){
			return CommonUtil.resultMsg("SUCCESS", "刪除成功");
		}else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
		
	}

}
