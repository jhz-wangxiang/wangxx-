package com.efrobot.robotstore.manager.controller;

import java.util.ArrayList;
import java.util.Arrays;
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
import com.efrobot.robotstore.baseapi.manager.pojo.Order;
import com.efrobot.robotstore.baseapi.manager.pojo.User;
import com.efrobot.robotstore.manager.service.AddressService;
import com.efrobot.robotstore.manager.service.OrderService;
import com.efrobot.robotstore.manager.service.UserService;
import com.efrobot.robotstore.util.CommonUtil;
import com.efrobot.robotstore.util.PageInfo;

@RequestMapping("/v1/user")
@RestController
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private OrderService orderService;
	
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
		if(null==user.getPhone()||"".equals(user.getPhone())){
			map.put("resultCode", "FAIL");
			map.put("msg", "手机号不能为空");		
			return map;
		}
		Integer userid=0;
		List<Address> adressList=new ArrayList<>();
		User user2=new User();
		user2.setPhone(user.getPhone());
		List<User> list=userService.selectByUser(user2);
		if(list.size()==0){
			if(user.getName()!=null&&!"".equals(user.getName())){
				user.setExp1("是");
			}else{
				user.setExp1("未");
			}
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
		if(record.getName()!=null&&!"".equals(record.getName())){
			record.setExp1("是");
		}else{
			record.setExp1("未");
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
		if(record.getName()!=null&&!"".equals(record.getName())){
			record.setExp1("是");
		}else{
			record.setExp1("未");
		}
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
		User us=list.get(0);
		Order order=new Order();
		String ids="1,2,3,4,5";
		order.setListStatus(Arrays.asList(ids.split(",")));
		order.setUserId(us.getId());
		List<Order> orlist=orderService.selectByParms(order);
		if(orlist.size()!=0){
			us.setExp2("有");
		}else{
			us.setExp2("未");
		}
		if(us.getName()!=null&&!"".equals(us.getName())){
			us.setExp1("是");
		}else{
			us.setExp1("未");
		}
		return us;
	}
	
}
