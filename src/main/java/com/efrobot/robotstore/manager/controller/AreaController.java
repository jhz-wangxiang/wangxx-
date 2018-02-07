package com.efrobot.robotstore.manager.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.efrobot.robotstore.baseapi.manager.pojo.Area;
import com.efrobot.robotstore.baseapi.manager.pojo.FlightNum;
import com.efrobot.robotstore.manager.service.AreaService;
import com.efrobot.robotstore.manager.service.FlightNumService;
import com.efrobot.robotstore.util.CommonUtil;
import com.efrobot.robotstore.util.PageInfo;

@RequestMapping("/v1/area")
@Controller
public class AreaController {

	@Resource
	private AreaService areaService;
	
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/getAreaListPage")
	@ResponseBody
	public JSONObject getAreaListPage(Area record, Integer pageNumber, Integer pageSize) throws Exception {
		JSONObject jsonObject = new JSONObject();
		PageInfo<Area> rows = null;
		JSONObject obj = new JSONObject();
		String result = "";
		rows = areaService.getAreaListPage(record, pageNumber, pageSize);
		result = obj.toJSONString(rows, SerializerFeature.WriteMapNullValue, SerializerFeature.WriteNullNumberAsZero,
				SerializerFeature.WriteNullStringAsEmpty);

		jsonObject = JSONObject.parseObject(result);
		return jsonObject;
	}
	
	@RequestMapping(value = "/insertArea", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertArea(Area record) throws Exception {
		int result = -1;
		result = areaService.insertSelective(record);
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1){
			return CommonUtil.resultMsg("SUCCESS", "信息插入成功");
		}else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
		
	}
	
	@RequestMapping(value = "/updateArea", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateArea(Area record) throws Exception {
		int result = -1;
		result = areaService.updateByPrimaryKeySelective(record);
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1){
			return CommonUtil.resultMsg("SUCCESS", "修改成功");
		}else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
		
	}
	
	@RequestMapping(value = "/deleteArea", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteArea(Integer id) throws Exception {
		int result = -1;
		result = areaService.deleteByPrimaryKey(id);
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1){
			return CommonUtil.resultMsg("SUCCESS", "刪除成功");
		}else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
	}
}
