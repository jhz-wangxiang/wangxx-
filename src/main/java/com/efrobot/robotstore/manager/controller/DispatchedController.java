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
import com.efrobot.robotstore.baseapi.manager.pojo.Area;
import com.efrobot.robotstore.baseapi.manager.pojo.Dispatched;
import com.efrobot.robotstore.manager.service.DispatchedService;
import com.efrobot.robotstore.util.CommonUtil;
import com.efrobot.robotstore.util.PageInfo;

@RequestMapping("/v1/dispatched")
@Controller
public class DispatchedController {

	@Resource
	private DispatchedService dispatchedService;
	
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/getDispatchedListPage")
	@ResponseBody
	public JSONObject getDispatchedListPage(Dispatched record, Integer pageNumber, Integer pageSize) throws Exception {
		JSONObject jsonObject = new JSONObject();
		PageInfo<Dispatched> rows = null;
		JSONObject obj = new JSONObject();
		String result = "";
		rows = dispatchedService.getDispatchedListPage(record, pageNumber, pageSize);
		result = obj.toJSONString(rows, SerializerFeature.WriteMapNullValue, SerializerFeature.WriteNullNumberAsZero,
				SerializerFeature.WriteNullStringAsEmpty);

		jsonObject = JSONObject.parseObject(result);
		return jsonObject;
	}
	
	@RequestMapping(value = "/insertDispatched", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertDispatched(Dispatched record) throws Exception {
		int result = -1;
		result = dispatchedService.insertSelective(record);
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1){
			return CommonUtil.resultMsg("SUCCESS", "信息插入成功");
		}else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
	}
	
	@RequestMapping(value = "/updateDispatched", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateDispatched(Dispatched record) throws Exception {
		int result = -1;
		result = dispatchedService.updateByPrimaryKeySelective(record);
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1){
			return CommonUtil.resultMsg("SUCCESS", "修改成功");
		}else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
		
	}
	
	@RequestMapping(value = "/deleteDispatched", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteDispatched(Integer id) throws Exception {
		int result = -1;
		result = dispatchedService.deleteByPrimaryKey(id);
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1){
			return CommonUtil.resultMsg("SUCCESS", "修改成功");
		}else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
	}
	@RequestMapping(value = "/getDispatched", method = RequestMethod.POST)
	@ResponseBody
	public List<Dispatched> getDispatched(Dispatched record) throws Exception {
		List<Dispatched> list = dispatchedService.getDispatched(record);
		return list;
	}
//	
//	@RequestMapping(value = "/getRoleAll", method = RequestMethod.POST)
//	@ResponseBody
//	public List<SysRole> getRoleAll(SysRole record) throws Exception {
//		List<SysRole> list=sysRoleService.getRoleAll(record);
//		return list;
//	}
}
