package com.efrobot.robotstore.manager.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.efrobot.robotstore.baseapi.manager.pojo.FlightNum;
import com.efrobot.robotstore.manager.service.FlightNumService;
import com.efrobot.robotstore.util.CommonUtil;
import com.efrobot.robotstore.util.PageInfo;

@RequestMapping("/v1/flight")
@Controller
public class FlightNumController {

	@Resource
	private FlightNumService flightNumRoleService;
	
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/getFlightNumListPage")
	@ResponseBody
	public JSONObject getFlightNumListPage(FlightNum record, Integer pageNumber, Integer pageSize) throws Exception {
		JSONObject jsonObject = new JSONObject();
		PageInfo<FlightNum> rows = null;
		JSONObject obj = new JSONObject();
		String result = "";
		rows = flightNumRoleService.getFlightNumListPage(record, pageNumber, pageSize);
		result = obj.toJSONString(rows, SerializerFeature.WriteMapNullValue, SerializerFeature.WriteNullNumberAsZero,
				SerializerFeature.WriteNullStringAsEmpty);

		jsonObject = JSONObject.parseObject(result);
		return jsonObject;
	}
	
	@RequestMapping(value = "/insertFlightNum", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertFlightNum(FlightNum record) throws Exception {
		int result = -1;
		result = flightNumRoleService.insertSelective(record);
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1){
			return CommonUtil.resultMsg("SUCCESS", "信息插入成功");
		}else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
		
	}
	
	@RequestMapping(value = "/updateFlightNum", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateFlightNum(FlightNum record) throws Exception {
		int result = -1;
		result = flightNumRoleService.updateByPrimaryKeySelective(record);
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1){
			return CommonUtil.resultMsg("SUCCESS", "修改成功");
		}else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
		
	}
	
	@RequestMapping(value = "/deleteFlightNum", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFlightNum(Integer id) throws Exception {
		int result = -1;
		result = flightNumRoleService.deleteByPrimaryKey(id);
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1){
			return CommonUtil.resultMsg("SUCCESS", "刪除成功");
		}else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
	}
}
