package com.efrobot.robotstore.manager.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.efrobot.robotstore.baseapi.manager.pojo.Address;
import com.efrobot.robotstore.baseapi.manager.pojo.User;
import com.efrobot.robotstore.manager.service.AddressService;
import com.efrobot.robotstore.manager.service.UserService;
import com.efrobot.robotstore.util.CommonUtil;
import com.efrobot.robotstore.util.PageInfo;

@RequestMapping("/v1/user")
@RestController
public class UserController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private AddressService addressService;
	@RequestMapping(value = "/getAddressByUser", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getAddressByUser(User user) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		Address record=new Address();
		record.setUserid(user.getId());
		List<Address> adressList=addressService.getAddress(record);
		for(Address record2:adressList){
			if(record2.getStatus()==1){
				map.put("address", record2);
			}
		}
		map.put("resultCode", "SUCCESS");
		map.put("addressList", adressList);
		return map;
	}
	
	@RequestMapping(value = "/getAddressAndUserByPhone", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getAddressAndUserByPhone(User user) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		Integer userid=0;
		List<Address> adressList=new ArrayList<>();
		User user2=new User();
		user2.setPhone(user.getPhone());
		List<User> list=userService.selectByUser(user2);
		if(list.size()==0){
			userService.insertSelective(user);
			userid=user.getId();
			map.put("user", user);	
		}else{
			userid=list.get(0).getId();
			Address record=new Address();
			record.setUserid(userid);
			adressList=addressService.getAddress(record);
			map.put("user", list.get(0));		
		}
		for(Address record2:adressList){
			if(record2.getStatus()==1){
				map.put("address", record2);
			}
		}
		map.put("resultCode", "SUCCESS");
		map.put("addressList", adressList);
		map.put("userid", userid);		
		return map;
	}
	
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/getUserListPage")
	@ResponseBody
	public JSONObject getUserListPage(User record, Integer pageNumber, Integer pageSize) throws Exception {
		JSONObject jsonObject = new JSONObject();
		PageInfo<User> rows = null;
		JSONObject obj = new JSONObject();
		String result = "";
		rows = userService.getUserListPage(record, pageNumber, pageSize);
		result = obj.toJSONString(rows, SerializerFeature.WriteMapNullValue, SerializerFeature.WriteNullNumberAsZero,
				SerializerFeature.WriteNullStringAsEmpty);

		jsonObject = JSONObject.parseObject(result);
		return jsonObject;
	}
	@RequestMapping(value = "/insertUser", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertUser(User record) throws Exception {
		int result = -1;
		User user2=new User();
		user2.setPhone(record.getPhone());
		List<User> list=userService.selectByUser(user2);
		if(list.size()>0){
			return CommonUtil.resultMsg("FAIL", "用户信息已经存在!!!");
		}
		result = userService.insertSelective(record);
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1){
			return CommonUtil.resultMsg("SUCCESS", "信息插入功");
		}else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
		
	}
	
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateUser(User record ) throws Exception {
		int result = -1;
		result = userService.updateByPrimaryKeySelective(record);
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1)
			return CommonUtil.resultMsg("SUCCESS", "编辑信息成功");
		else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
	}
	
	@RequestMapping(value = "/getUserDetail", method = RequestMethod.POST)
	@ResponseBody
	public User getUserDetail(User record) throws Exception {
		List<User> list = userService.selectByUser(record);
		return list.get(0);
	}
	
}
