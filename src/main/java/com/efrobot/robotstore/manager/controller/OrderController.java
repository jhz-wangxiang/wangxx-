package com.efrobot.robotstore.manager.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.efrobot.robotstore.baseapi.manager.pojo.Area;
import com.efrobot.robotstore.baseapi.manager.pojo.Channel;
import com.efrobot.robotstore.baseapi.manager.pojo.FlightNum;
import com.efrobot.robotstore.baseapi.manager.pojo.Order;
import com.efrobot.robotstore.baseapi.manager.pojo.OrderStatus;
import com.efrobot.robotstore.baseapi.manager.pojo.OrderStatusRecord;
import com.efrobot.robotstore.baseapi.manager.pojo.SysUser;
import com.efrobot.robotstore.baseapi.manager.pojo.User;
import com.efrobot.robotstore.manager.service.OrderService;
import com.efrobot.robotstore.manager.service.UserService;
import com.efrobot.robotstore.util.CommonUtil;
import com.efrobot.robotstore.util.Const;
import com.efrobot.robotstore.util.PageInfo;


@RequestMapping("/v1/order")
@RestController
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private UserService userService;
	public static Map<Integer, String> status_order = new ConcurrentHashMap<Integer,String>();
	
//	@PostConstruct
//	public void init() {
//		List<OrderStatus> list=orderService.selectSelectList("");
//		for(OrderStatus s: list){
//			status_order.put(s.getStatus(), s.getDescribe());
//		}
//	}
	
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/getOrderListPage")
	@ResponseBody
	public JSONObject getOrderListPage(Order record, Integer pageNumber, Integer pageSize) throws Exception {
		JSONObject jsonObject = new JSONObject();
		PageInfo<Order> rows = null;
		JSONObject obj = new JSONObject();
		String result = "";
		rows = orderService.getOrderListPage(record, pageNumber, pageSize);
		result = obj.toJSONString(rows, SerializerFeature.WriteMapNullValue, SerializerFeature.WriteNullNumberAsZero,
				SerializerFeature.WriteNullStringAsEmpty);

		jsonObject = JSONObject.parseObject(result);
		return jsonObject;
	}
	
	@RequestMapping(value = "/getOrderDetail", method = RequestMethod.POST)
	@ResponseBody
	public Order getOrderDetail(Order record) throws Exception {
		List<Order> orderList= orderService.selectByParms(record);
		return orderList.get(0);
	}
	
	@RequestMapping(value = "/insertOrder", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertOrder(Order record) throws Exception {
		int result = -1;
		String orderNo=CommonUtil.bulidOrderNum("A");
		Subject subject = SecurityUtils.getSubject();
		Session session = subject.getSession();
		SysUser sysUser=(SysUser) session.getAttribute(Const.SESSION_USER);
		// 异常处理
		record.setOrderStatus(1);//支付变成2
		record.setPayStatus("未支付");
		record.setAbnormalStatus("正常");
		record.setCreateDate(new Date());
		record.setOrderNo(orderNo);
		record.setOperator("柜台"+sysUser.getName());
		result = orderService.insertSelective(record);
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1){
			User user=new User();
			user.setOrderDate(new Date());
			user.setExp2("有");
			user.setId(record.getUserId());
			userService.updateByPrimaryKeySelective(user);
			setHistory("提交订单",orderNo);
			return CommonUtil.resultMsg("SUCCESS", "信息插入功");
		}else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
	}
	
	@RequestMapping(value = "/updateOrder", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateOrder(Order record ) throws Exception {
		int result = -1;
		result = orderService.updateByPrimaryKey(record);
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1)
			return CommonUtil.resultMsg("SUCCESS", "编辑信息成功");
		else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
	}
	//修改订单过程状态
	@RequestMapping(value = "/updateOrderStatus", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateOrderStatus(Order record) throws Exception {
		int result = -1;
		Order order2= orderService.selectByPrimaryKey(record.getId());
		if(order2.getOrderStatus()<6){
			if(order2.getOrderStatus()==1){
				record.setPayStatus("已支付");
			}
			record.setOrderStatus(order2.getOrderStatus()+1);
//			setHistory(status_order.get(order2.getOrderStatus()+1),order2.getOrderNo());
		}else{
			return CommonUtil.resultMsg("FAIL", "已经签收完结");
		}
		result = orderService.updateByPrimaryKeySelective(record);
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1)
			return CommonUtil.resultMsg("SUCCESS", "编辑信息成功");
		else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
	}
	//修改取消过程状态
	@RequestMapping(value = "/updateOrderCancel", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateOrderCancel(Order record) throws Exception {
		int result = -1;
		Order order2= orderService.selectByPrimaryKey(record.getId());
		if(order2.getOrderStatus()<2){
			record.setOrderStatus(10);
			result = orderService.updateByPrimaryKeySelective(record);
//			setHistory(status_order.get("订单取消"),order2.getOrderNo());
		}else{
			return CommonUtil.resultMsg("FAIL", "现在的状态不可以取消订单");
		}
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1)
			return CommonUtil.resultMsg("SUCCESS", "编辑信息成功");
		else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
	}
	//修改取消过程状态
	@RequestMapping(value = "/updateAbnormalStatus", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateAbnormalStatus(Order record) throws Exception {
		int result = -1;
		Order order2= orderService.selectByPrimaryKey(record.getId());
		if("是".equals(order2.getAbnormalStatus())){
			record.setAbnormalStatus("否");
			setHistory("订单异常",order2.getOrderNo());
		}else{
			record.setAbnormalStatus("是");
			setHistory("订单正常",order2.getOrderNo());
		}
		result = orderService.updateByPrimaryKeySelective(record);
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1)
			return CommonUtil.resultMsg("SUCCESS", "编辑信息成功");
		else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
	}
	
	@RequestMapping(value = "/getOrderStatus", method = RequestMethod.POST)
	@ResponseBody
	public List<OrderStatus> getOrderStatus(String ids) throws Exception {
		  List<OrderStatus> list=orderService.selectSelectList(ids);
		  return list;
	}
	
	@RequestMapping(value = "/getChannel", method = RequestMethod.POST)
	@ResponseBody
	public List<Channel> getChannel(Channel record) throws Exception {
		List<Channel> list=orderService.getChannel(record);
		return list;
	}
	@RequestMapping(value = "/getArea", method = RequestMethod.POST)
	@ResponseBody
	public List<Area> getArea(Area record) throws Exception {
		List<Area> list=orderService.getArea(record);
		return list;
	}
	
	@RequestMapping(value = "/getFlightNum", method = RequestMethod.POST)
	@ResponseBody
	public List<FlightNum> getFlightNum(FlightNum record) throws Exception {
		List<FlightNum> list=orderService.getFlightNum(record);
		return list;
	}
	//查询历史状态
	@RequestMapping(value = "/selectHistory", method = RequestMethod.POST)
	@ResponseBody
	public List<OrderStatusRecord> selectHistory(String orderNo){
		return orderService.selectByparms(orderNo);
	}
	public int setHistory(String remark,String orderNo){
		Subject subject = SecurityUtils.getSubject();
		Session session = subject.getSession();
		SysUser sysUser=(SysUser) session.getAttribute(Const.SESSION_USER);
		OrderStatusRecord orderStatusRecord=new OrderStatusRecord();
		orderStatusRecord.setRemark(remark);
		orderStatusRecord.setExp1(orderNo);
		orderStatusRecord.setRoleId(sysUser.getRoleId());
		orderStatusRecord.setUserId(sysUser.getId());
		orderStatusRecord.setCreateDate(new Date());
		orderStatusRecord.setStatus(1);//1-后台,2-客户
		int result =orderService.updateByPrimaryKeySelective(orderStatusRecord);
		return result;
		
	}
}
