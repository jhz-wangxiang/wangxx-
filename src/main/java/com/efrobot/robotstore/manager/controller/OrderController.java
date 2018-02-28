package com.efrobot.robotstore.manager.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.efrobot.robotstore.baseapi.manager.pojo.Area;
import com.efrobot.robotstore.baseapi.manager.pojo.Channel;
import com.efrobot.robotstore.baseapi.manager.pojo.Count;
import com.efrobot.robotstore.baseapi.manager.pojo.FlightNum;
import com.efrobot.robotstore.baseapi.manager.pojo.Order;
import com.efrobot.robotstore.baseapi.manager.pojo.OrderStatus;
import com.efrobot.robotstore.baseapi.manager.pojo.OrderStatusRecord;
import com.efrobot.robotstore.baseapi.manager.pojo.SysUser;
import com.efrobot.robotstore.baseapi.manager.pojo.User;
import com.efrobot.robotstore.manager.service.AreaService;
import com.efrobot.robotstore.manager.service.FlightNumService;
import com.efrobot.robotstore.manager.service.OrderService;
import com.efrobot.robotstore.manager.service.UserService;
import com.efrobot.robotstore.util.CommonUtil;
import com.efrobot.robotstore.util.Const;
import com.efrobot.robotstore.util.PageInfo;
import com.efrobot.robotstore.util.SerialNum;
import com.efrobot.toolkit.util.http.RestClient;

@RequestMapping("/v1/order")
@RestController
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private AreaService areaService;
	private final static int SPLIT_COUNT = 65535; // Excel每个工作簿的行数
	public static RestTemplate restTemplate = RestClient.getInstance();// 请求类
	private static Workbook workBook;
	@Autowired
	private FlightNumService flightNumService;
	@Autowired
	private UserService userService;
	public static Map<Integer, String> status_order = new ConcurrentHashMap<Integer, String>();

	@PostConstruct
	public void init() {
		List<OrderStatus> list = orderService.selectSelectList(null);
		for (OrderStatus s : list) {
			status_order.put(s.getStatus(), s.getDescribe());
		}
	}

	@SuppressWarnings("static-access")
	@RequestMapping(value = "/getOrderListPage")
	@ResponseBody
	public JSONObject getOrderListPage(Order record, Integer pageNumber, Integer pageSize) throws Exception {
		JSONObject jsonObject = new JSONObject();
		PageInfo<Order> rows = null;
		JSONObject obj = new JSONObject();
		String result = "";
		if (null != record.getIds() && !"".equals(record.getIds())) {
			record.setListStatus(Arrays.asList(record.getIds().split(",")));
		}
		rows = orderService.getOrderListPage(record, pageNumber, pageSize);
		result = obj.toJSONString(rows, SerializerFeature.WriteMapNullValue, SerializerFeature.WriteNullNumberAsZero,
				SerializerFeature.WriteNullStringAsEmpty);

		jsonObject = JSONObject.parseObject(result);
		return jsonObject;
	}

	@SuppressWarnings("static-access")
	@RequestMapping(value = "/getPrintListPage")
	@ResponseBody
	public JSONObject getPrintListPage(String ids, Integer pageNumber, Integer pageSize) throws Exception {
		JSONObject jsonObject = new JSONObject();
		PageInfo<Order> rows = null;
		JSONObject obj = new JSONObject();
		String result = "";
		Order record = new Order();
		record.setList(Arrays.asList(ids.split(",")));
		rows = orderService.getOrderListPage(record, pageNumber, pageSize);
		result = obj.toJSONString(rows, SerializerFeature.WriteMapNullValue, SerializerFeature.WriteNullNumberAsZero,
				SerializerFeature.WriteNullStringAsEmpty);

		jsonObject = JSONObject.parseObject(result);
		return jsonObject;
	}

	@RequestMapping(value = "/getOrderDetail", method = RequestMethod.POST)
	@ResponseBody
	public Order getOrderDetail(Order record) throws Exception {
		List<Order> orderList = orderService.selectByParms(record);
		return orderList.get(0);
	}

	@RequestMapping(value = "/insertOrder", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertOrder(Order record) throws Exception {
		int result = -1;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat mmdd = new SimpleDateFormat("MMdd");
		String datestr = sdf.format(new Date());
		if ("".equals(record.getNowTimeStr()) || null == record.getNowTimeStr()) {
			return CommonUtil.resultMsg("FAIL", "航班日期不能为空 ");
		}
		if ("".equals(record.getFlightNum()) || null == record.getFlightNum()) {
			return CommonUtil.resultMsg("FAIL", "航班号不能为空 ");
		}
		FlightNum f = new FlightNum();
		f.setFlightNum(record.getFlightNum());
		List<FlightNum> list = flightNumService.selectByParms(f);
		if (list.size() == 0) {
			return CommonUtil.resultMsg("FAIL", "对不起，你航班的目的地还未开通此项服务。 ");
		}

		FlightNum flightNum = list.get(0);
		// if (record.getNowTime().getTime() < flightNum.getEndTime().getTime()
		// && record.getNowTime().getTime() >
		// flightNum.getStartTime().getTime()) {
		// } else {
		// return CommonUtil.resultMsg("FAIL", "对不起，你航班的目的地还未开通此项服务。 ");
		// }
		// 校验航班时间
		// SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
		//
		// String time = sdf.format(record.getNowTime()) + " " +
		// flightNum.getEndHour() + ":00:00";
		//
		// Date t = sdf2.parse(time);
		// Date n = new Date();
		// if (!CommonUtil.jisuan(n, t)) {
		// return CommonUtil.resultMsg("FAIL", "航班未开放，请于落地前 24 小时内下单");//
		// 订单可在航班计划落地时间前
		// // 24
		// // 小时内下单，如早下单，则提示
		// }
		record.setFlightNum(record.getFlightNum().toUpperCase());
		String zm = flightNum.getExp1();
		Subject subject = SecurityUtils.getSubject();
		Session session = subject.getSession();
		SysUser sysUser = (SysUser) session.getAttribute(Const.SESSION_USER);
		// 异常处理
		record.setOrderStatus(1);// 支付变成2
		record.setPayStatus("未支付");
		record.setCreateDate(new Date());
//		record.setOrderNo(orderNo);
		record.setSingleWay("柜台");
		record.setAbnormalStatus("否");
		record.setExp1("否");
		record.setOperator("柜台" + sysUser.getName());
		// 价格计算
		float c = 10;
		float a = 10;
		int p = 100;
		if (null != record.getChannelId()) {// 渠道
			Channel ch = new Channel();
			ch.setId(record.getChannelId());
			List<Channel> listch = orderService.getChannel(ch);
			c = listch.get(0).getDiscount().longValue();
		}
		if (null != record.getAreaId()) {// 區域
			Area ar = new Area();
			ar.setId(record.getAreaId());
			List<Area> listch = areaService.selectByParms(ar);
			a = listch.get(0).getDiscount().longValue();
			p = listch.get(0).getPrice();
		}

		int num = Integer.parseInt(record.getBaggageNum());
		float paid = (float) ((p + (num - 1) * p * 0.1 * a) * 0.1 * c);
		record.setTotalFee(new BigDecimal(num * p));
		record.setPaidFee(new BigDecimal(paid));
		result = orderService.insertSelective(record);
		String idStr=record.getId().toString();
		if(idStr.length()==1){
			idStr="000"+idStr;
		}
		if(idStr.length()==2){
			idStr="00"+idStr;
		}
		if(idStr.length()==3){
			idStr="0"+idStr;
		}
		String orderNo = zm + datestr + mmdd.format(record.getNowTime()) + record.getFlightNum()
		+ idStr;
		record.setOrderNo(orderNo);
		orderService.updateByPrimaryKey(record);
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1) {
			User user = new User();
			user.setOrderDate(new Date());
			user.setExp2("有");
			user.setId(record.getUserId());
			userService.updateByPrimaryKeySelective(user);
			setHistory("提交订单", orderNo, "");
			return CommonUtil.resultMsg("SUCCESS", "订单创建成功!");
		} else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
	}

	@RequestMapping(value = "/insertOrderbyUser", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertOrderbyUser(Order record) throws Exception {
		int result = -1;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat mmdd = new SimpleDateFormat("MMdd");
		String datestr = sdf.format(new Date());
		if ("".equals(record.getNowTimeStr()) || null == record.getNowTimeStr()) {
			return CommonUtil.resultMsg("FAIL", "航班日期不能为空 ");
		}
		if ("".equals(record.getFlightNum()) || null == record.getFlightNum()) {
			return CommonUtil.resultMsg("FAIL", "航班号不能为空 ");
		}
		FlightNum f = new FlightNum();
		f.setFlightNum(record.getFlightNum());
		List<FlightNum> list = flightNumService.selectByParms(f);
		if (list.size() == 0) {
			return CommonUtil.resultMsg("FAIL", "对不起，你航班的目的地还未开通此项服务。");
		}
		FlightNum flightNum = list.get(0);
		// if (record.getNowTime().getTime() < flightNum.getEndTime().getTime()
		// && record.getNowTime().getTime() >
		// flightNum.getStartTime().getTime()) {
		// } else {
		// return CommonUtil.resultMsg("FAIL", "对不起，你航班的目的地还未开通此项服务。");
		// }
		// // 校验航班时间
		// SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
		//
		// String time = sdf.format(record.getNowTime()) + " " +
		// flightNum.getEndHour() + ":00:00";
		//
		// Date t = sdf2.parse(time);
		// Date n = new Date();
		// if (!CommonUtil.jisuan(n, t)) {
		// return CommonUtil.resultMsg("FAIL", "航班未开放，请于落地前 24 小时内下单");//
		// 订单可在航班计划落地时间前
		// // 24
		// // 小时内下单，如早下单，则提示
		// }
		// 订单可在航班计划落地时间前 24 小时内下单，如早下单，则提示
		// //航班未开放，请于落地前 24 小时内下单。未支付订单保留至航班计划落地时间
		// //后 24 小时，将自动取消。未确认订单在航班计划落地时间后 24 小时，将自动
		// //退款，并标识订单取消。（
		record.setFlightNum(record.getFlightNum().toUpperCase());
		String zm = flightNum.getExp1();
		Subject subject = SecurityUtils.getSubject();
		Session session = subject.getSession();
		SysUser sysUser = (SysUser) session.getAttribute(Const.SESSION_USER);
		// 异常处理
		record.setOrderStatus(1);// 支付变成2
		record.setPayStatus("未支付");
		record.setCreateDate(new Date());
//		record.setOrderNo(orderNo);
		record.setSingleWay("柜台");
		record.setAbnormalStatus("否");
		record.setOperator("柜台" + sysUser.getName());
		// 价格计算
		float c = 10;
		float a = 10;
		int p = 100;
		if (null != record.getChannelId()) {// 渠道
			Channel ch = new Channel();
			ch.setId(record.getChannelId());
			List<Channel> listch = orderService.getChannel(ch);
			c = listch.get(0).getDiscount().longValue();
		}
		if (null != record.getAreaId()) {// 區域
			Area ar = new Area();
			ar.setId(record.getAreaId());
			List<Area> listch = areaService.selectByParms(ar);
			a = listch.get(0).getDiscount().longValue();
			p = listch.get(0).getPrice();
		}

		int num = Integer.parseInt(record.getBaggageNum());
		float paid = (float) ((p + (num - 1) * p * 0.1 * a) * 0.1 * c);
		record.setTotalFee(new BigDecimal(num * p));
		record.setPaidFee(new BigDecimal(paid));
		result = orderService.insertSelective(record);
		String idStr=record.getId().toString();
		if(idStr.length()==1){
			idStr="000"+idStr;
		}
		if(idStr.length()==2){
			idStr="00"+idStr;
		}
		if(idStr.length()==3){
			idStr="0"+idStr;
		}
		String orderNo = zm + datestr + mmdd.format(record.getNowTime()) + record.getFlightNum()
		+ idStr;
		record.setOrderNo(orderNo);
		orderService.updateByPrimaryKey(record);
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1) {
			User user = new User();
			user.setOrderDate(new Date());
			user.setExp2("有");
			user.setId(record.getUserId());
			user.setPhone(record.getPhone());
			user.setName(record.getName());
			user.setChannelId(record.getChannelId());
			userService.updateByPrimaryKeySelective(user);
			setHistory("提交订单", orderNo, "");
			return CommonUtil.resultMsg("SUCCESS", "订单创建成功!");
		} else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
	}

	@RequestMapping(value = "/updateOrder", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateOrder(Order record) throws Exception {
		int result = -1;
		result = orderService.updateByPrimaryKeySelective(record);
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1)
			return CommonUtil.resultMsg("SUCCESS", "编辑信息成功");
		else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
	}

	@RequestMapping(value = "/setDispatched", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> setDispatched(Order record, String ids) throws Exception {
		int result = -1;
		record.setList(Arrays.asList(ids.split(",")));
		record.setExp1("是");
		result = orderService.setDispatched(record);
		return CommonUtil.resultMsg("SUCCESS", "编辑信息成功");
	}

	// 修改订单过程状态
	@RequestMapping(value = "/updateOrderStatus", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateOrderStatus(Order record) throws Exception {
		int result = -1;
		Order order2 = orderService.selectByPrimaryKey(record.getId());
		if (order2.getOrderStatus() < 6) {
			if (order2.getOrderStatus() == 1) {
				record.setPayStatus("已支付");
			}
			record.setOrderStatus(order2.getOrderStatus() + 1);
			setHistory(status_order.get(order2.getOrderStatus() + 1), order2.getOrderNo(), record.getRemark());
		} else {
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

	// 修改订单过程状态
	@RequestMapping(value = "/updateOrderStop", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateOrderStop(Order record) throws Exception {
		int result = -1;
		Order order2 = orderService.selectByPrimaryKey(record.getId());
		record.setOrderStatus(11);
		result = orderService.updateByPrimaryKeySelective(record);
		setHistory(status_order.get(11), order2.getOrderNo(), record.getRemark());
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1)
			return CommonUtil.resultMsg("SUCCESS", "编辑信息成功");
		else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
	}

	// 修改取消过程状态
	@RequestMapping(value = "/updateOrderCancel", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateOrderCancel(Order record) throws Exception {
		int result = -1;
		Order order2 = orderService.selectByPrimaryKey(record.getId());
		// if (order2.getOrderStatus() < 2) {
		record.setOrderStatus(10);
		result = orderService.updateByPrimaryKeySelective(record);
		setHistory(status_order.get("订单取消"), order2.getOrderNo(), record.getCancelReason());
		if(order2.getOrderWxNo()!=null&&!"".equals(order2.getOrderWxNo())){
			HttpHeaders headers = new HttpHeaders();
			MediaType type = MediaType.parseMediaType("application/json; charset=UTF-8");
			headers.setContentType(type);
			headers.add("Accept", MediaType.APPLICATION_JSON.toString());
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("out_trade_no",order2.getOrderNo() );
			BigDecimal bb=new BigDecimal("100");
			BigDecimal total=bb.multiply(order2.getPaidFee());
			jsonObject.put("total_fee", total.intValue());
			jsonObject.put("refund_fee", total.intValue());
			HttpEntity<String> formEntity = new HttpEntity<String>(jsonObject.toString(), headers);
	        restTemplate.postForObject("http://ajtservice.com/v1/area/refund", formEntity,
					String.class);
		}
		// } else {
		// return CommonUtil.resultMsg("FAIL", "现在的状态不可以取消订单");
		// }
		if (result == 0) {
			return CommonUtil.resultMsg("FAIL", "未找到可编辑的信息");
		} else if (result == 1)
			return CommonUtil.resultMsg("SUCCESS", "编辑信息成功");
		else {
			return CommonUtil.resultMsg("FAIL", "更新异常: 多条数据被更新 ");
		}
	}

	// 修改取消过程状态
	@RequestMapping(value = "/updateAbnormalStatus", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateAbnormalStatus(Order record) throws Exception {
		int result = -1;
		Order order2 = orderService.selectByPrimaryKey(record.getId());
		if ("是".equals(order2.getAbnormalStatus())) {
			record.setAbnormalStatus("否");
			setHistory("订单异常", order2.getOrderNo(), record.getAbnormaReason());
		} else {
			record.setAbnormalStatus("是");
			setHistory("订单正常", order2.getOrderNo(), record.getAbnormaReason());
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
		List<OrderStatus> list = orderService.selectSelectList(ids);
		return list;
	}

	@RequestMapping(value = "/getChannel", method = RequestMethod.POST)
	@ResponseBody
	public List<Channel> getChannel(Channel record) throws Exception {
		record.setExp1("1");
		List<Channel> list = orderService.getChannel(record);
		return list;
	}

	@RequestMapping(value = "/getArea", method = RequestMethod.POST)
	@ResponseBody
	public List<Area> getArea(Area record) throws Exception {
		List<Area> list = orderService.getArea(record);
		return list;
	}

	@RequestMapping(value = "/getFlightNum", method = RequestMethod.POST)
	@ResponseBody
	public List<FlightNum> getFlightNum(FlightNum record) throws Exception {
		List<FlightNum> list = orderService.getFlightNum(record);
		return list;
	}

	// 查询历史状态
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/selectHistory", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject selectHistory(String orderNo, Integer pageNumber, Integer pageSize) throws Exception {
		JSONObject jsonObject = new JSONObject();
		PageInfo<OrderStatusRecord> rows = null;
		JSONObject obj = new JSONObject();
		String result = "";
		rows = orderService.getOrderStatusRecordListPage(orderNo, pageNumber, pageSize);
		result = obj.toJSONString(rows, SerializerFeature.WriteMapNullValue, SerializerFeature.WriteNullNumberAsZero,
				SerializerFeature.WriteNullStringAsEmpty);

		jsonObject = JSONObject.parseObject(result);
		return jsonObject;
		// return orderService.selectByparms(orderNo);
	}

	public int setHistory(String remark, String orderNo, String reason) {
		Subject subject = SecurityUtils.getSubject();
		Session session = subject.getSession();
		SysUser sysUser = (SysUser) session.getAttribute(Const.SESSION_USER);
		OrderStatusRecord orderStatusRecord = new OrderStatusRecord();
		orderStatusRecord.setRemark(remark);
		orderStatusRecord.setExp1(orderNo);
		orderStatusRecord.setExp2(reason);
		orderStatusRecord.setRoleId(sysUser.getRoleId());
		orderStatusRecord.setUserId(sysUser.getId());
		orderStatusRecord.setCreateDate(new Date());
		orderStatusRecord.setStatus(1);// 1-后台,2-客户
		int result = orderService.insertSelective(orderStatusRecord);
		return result;

	}

	@RequestMapping(value = "/getPrice", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getPrice(Order record) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		// 价格计算
		float c = 10;
		float a = 10;
		int p = 100;
		if (null != record.getChannelId()) {// 渠道
			Channel ch = new Channel();
			ch.setId(record.getChannelId());
			List<Channel> listch = orderService.getChannel(ch);
			c = listch.get(0).getDiscount().longValue();
		}
		if (null != record.getAreaId()) {// 區域
			Area ar = new Area();
			ar.setId(record.getAreaId());
			List<Area> listch = areaService.selectByParms(ar);
			a = listch.get(0).getDiscount().longValue();
			p = listch.get(0).getPrice();
		}

		int num = Integer.parseInt(record.getBaggageNum());
		float paid = (float) ((p + (num - 1) * p * 0.1 * a) * 0.1 * c);
		record.setTotalFee(new BigDecimal(num * p));
		record.setPaidFee(new BigDecimal(paid));

		map.put("resultCode", "SUCCESS");
		map.put("ChannelDiscount", c);// 渠道折扣
		map.put("AreaDiscount", a);// 区域折扣,第二件起的折扣
		map.put("num", num);// 礼包数量
		map.put("price", p);// 单间
		map.put("totalFee", num * p);// 总额
		map.put("paid", paid);// 实际支付价格
		return map;
	}

	@RequestMapping(value = "/checkflightNum", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> checkflightNum(Order record) throws Exception {
		// SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		// if ("".equals(record.getNowTimeStr()) || null ==
		// record.getNowTimeStr()) {
		// return CommonUtil.resultMsg("FAIL", "航班日期不能为空 ");
		// }
		if ("".equals(record.getFlightNum()) || null == record.getFlightNum()) {
			return CommonUtil.resultMsg("FAIL", "航班号不能为空 ");
		}
		FlightNum f = new FlightNum();
		f.setFlightNum(record.getFlightNum());
		List<FlightNum> list = flightNumService.selectByParms(f);
		if (list.size() == 0) {
			return CommonUtil.resultMsg("FAIL", "对不起，你航班的目的地还未开通此项服务。 ");
		}

		// FlightNum flightNum = list.get(0);
		// if (record.getNowTime().getTime() < flightNum.getEndTime().getTime()
		// && record.getNowTime().getTime() >
		// flightNum.getStartTime().getTime()) {
		// } else {
		// return CommonUtil.resultMsg("FAIL", "对不起，你航班的目的地还未开通此项服务。 ");
		// }
		// 校验航班时间
		// SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
		//
		// String time = sdf.format(record.getNowTime()) + " " +
		// flightNum.getEndHour() + ":00:00";
		//
		// Date t = sdf2.parse(time);
		// Date n = new Date();
		// if (!CommonUtil.jisuan(n, t)) {
		// return CommonUtil.resultMsg("FAIL", "航班未开放，请于落地前 24 小时内下单");//
		// 订单可在航班计划落地时间前
		// // 24
		// // 小时内下单，如早下单，则提示
		// }
		return CommonUtil.resultMsg("SUCCESS", "校验成功");
	}

	@SuppressWarnings("static-access")
	@RequestMapping(value = "/getOrderCount")
	@ResponseBody
	public JSONObject getOrderCount(Order record, Integer pageNumber, Integer pageSize) throws Exception {
		JSONObject jsonObject = new JSONObject();
		PageInfo<Count> rows = null;
		JSONObject obj = new JSONObject();
		String result = "";
		if (null != record.getIds() && !"".equals(record.getIds())) {
			record.setListStatus(Arrays.asList(record.getIds().split(",")));
		}
		rows = orderService.getOrderCount(record, pageNumber, pageSize);
		result = obj.toJSONString(rows, SerializerFeature.WriteMapNullValue, SerializerFeature.WriteNullNumberAsZero,
				SerializerFeature.WriteNullStringAsEmpty);

		jsonObject = JSONObject.parseObject(result);
		return jsonObject;
	}

	/**
	 * @方法名: exportOrderLLogis
	 * @功能描述: 导出物流信息订单信息xml
	 * @param ids
	 * @return
	 * @作者 wxx
	 * @日期 2016年7月14日
	 */
	@RequestMapping(value = "/exportOrderJiaojie")
	public void exportOrderJiaojie(String ids, HttpServletResponse res, HttpSession session) throws Exception {
		OutputStream os = res.getOutputStream();
		List<Order> list = null;
		Order record = new Order();
		record.setList(Arrays.asList(ids.split(",")));
		list = orderService.selectByParms(record);

		String filename = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()).toString();
		res.setHeader("Content-disposition",
				"attachment; filename=" + new String(filename.getBytes("GB2312"), "iso8859_1") + ".xlsx");
		res.setContentType("application/msexcel");
		createOrderWorkbook(list, os);
		// return CommonUtil.resultMsg("SUCCESS", "导出成功");
		// } catch (Exception e) {
		// //LOG.error(e.getMessage(), e);
		// return CommonUtil.resultMsg("FAIL", "导出失败");
		// }
	}
	/**
	 * @方法名: exportOrderLLogis
	 * @功能描述: 导出物流信息订单信息xml
	 * @param ids
	 * @return
	 * @作者 wxx
	 * @日期 2016年7月14日
	 */
	@RequestMapping(value = "/exportOrderSendGoogs")
	public void exportOrderSendGoogs(String ids, HttpServletResponse res, HttpSession session) throws Exception {
		OutputStream os = res.getOutputStream();
		List<Order> list = null;
		Order record = new Order();
		record.setList(Arrays.asList(ids.split(",")));
		list = orderService.selectByParms(record);
		
		String filename = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()).toString();
		res.setHeader("Content-disposition",
				"attachment; filename=" + new String(filename.getBytes("GB2312"), "iso8859_1") + ".xlsx");
		res.setContentType("application/msexcel");
		createSendGoogsWorkbook(list, os);
		// return CommonUtil.resultMsg("SUCCESS", "导出成功");
		// } catch (Exception e) {
		// //LOG.error(e.getMessage(), e);
		// return CommonUtil.resultMsg("FAIL", "导出失败");
		// }
	}

	/**
	 * 创建订单信息XSSFWorkbook对象
	 * 
	 * @return XSSFWorkbook
	 */
	public static void createOrderWorkbook(List<Order> fieldData, OutputStream os) throws Exception {
		String pathfile = OrderController.class.getResource("/xls/机场运输交接表.xlsx").getPath();
		workBook = new XSSFWorkbook(new FileInputStream(new File(pathfile)));
		int sheetNum = 0; // 指定sheet的页数
		int rows = 0;
		if (fieldData != null && fieldData.size() > 0) {
			rows = fieldData.size();// 总的记录数
			if (rows % SPLIT_COUNT == 0) {
				sheetNum = rows / SPLIT_COUNT;
			} else {
				sheetNum = rows / SPLIT_COUNT + 1;
			}
		} else {
			Sheet sheet0 = workBook.getSheet("Sheet" + 1);// 使用workbook对象创建sheet对象
		}
		for (int i = 1; i <= sheetNum; i++) {// 循环2个sheet的值
			Sheet sheet = workBook.getSheet("Sheet" + i);
			// 分页处理excel的数据，遍历所有的结果
			String flag = "";// 标记合并单元格
			int rownum = 0;
			int k2=0;
			for (int k = 0; k < (rows < SPLIT_COUNT ? rows : SPLIT_COUNT); k++) {
				if (((i - 1) * SPLIT_COUNT + k) >= rows) // 如果数据超出总的记录数的时候，就退出循环
					break;
				Row row = sheet.createRow((k + 3));// 创建1行l'
				k2=k;
				// 分页处理，获取每页的结果集，并将数据内容放入excel单元格
				Order order = (Order) fieldData.get((i - 1) * SPLIT_COUNT + k);

				Cell cell = row.createCell(0);//
				cell.setCellValue(k+1);

				cell = row.createCell(1);// 
				cell.setCellValue(
						order.getConsignee() == null ? "" : order.getConsignee());

				cell = row.createCell(2);// 
				cell.setCellValue(
						order.getConsigneePhone() == null ? "" : order.getConsigneePhone());
				cell = row.createCell(3);// 
				String address="";
				if(order.getCity()!=null){
					address=order.getCity();
				}
				if(order.getArea()!=null){
					address=address+order.getArea();
				}
				if(order.getAddress()!=null){
					address=address+order.getAddress();
				}
				cell.setCellValue(address);
				
				cell = row.createCell(4);// 
				cell.setCellValue(
						order.getRegisterName() == null ? "" : order.getRegisterName());
				cell = row.createCell(5);// 
				cell.setCellValue(
						order.getRegisterPhone() == null ? "" : order.getRegisterPhone());
				cell = row.createCell(6);// 
				cell.setCellValue(
						order.getBaggageNo() == null ? "" : order.getBaggageNo());
				cell = row.createCell(7);// 
				cell.setCellValue(
						order.getRemark() == null ? "" : order.getRemark());
				
			}
			Row row = sheet.createRow((k2 + 5));// 创建1行l'
			Cell cell = row.createCell(1);//
			cell.setCellValue("交出人:");
			Row row1 = sheet.createRow((k2 + 6));// 创建1行l'
			Cell cell1 = row1.createCell(1);//
			cell1.setCellValue("接收人:");
		}
		workBook.write(os);// 将excel中的数据写到输出流中，用于文件的输出
		os.close();
	}
	/**
	 * 创建订单信息XSSFWorkbook对象
	 * 
	 * @return XSSFWorkbook
	 */
	public static void createSendGoogsWorkbook(List<Order> fieldData, OutputStream os) throws Exception {
		String pathfile = OrderController.class.getResource("/xls/送货表调度.xlsx").getPath();
		workBook = new XSSFWorkbook(new FileInputStream(new File(pathfile)));
		int sheetNum = 0; // 指定sheet的页数
		int rows = 0;
		if (fieldData != null && fieldData.size() > 0) {
			rows = fieldData.size();// 总的记录数
			if (rows % SPLIT_COUNT == 0) {
				sheetNum = rows / SPLIT_COUNT;
			} else {
				sheetNum = rows / SPLIT_COUNT + 1;
			}
		} else {
			Sheet sheet0 = workBook.getSheet("Sheet" + 1);// 使用workbook对象创建sheet对象
		}
		for (int i = 1; i <= sheetNum; i++) {// 循环2个sheet的值
			Sheet sheet = workBook.getSheet("Sheet" + i);
			// 分页处理excel的数据，遍历所有的结果
			String flag = "";// 标记合并单元格
			int rownum = 0;
			int k2=0;
			for (int k = 0; k < (rows < SPLIT_COUNT ? rows : SPLIT_COUNT); k++) {
				if (((i - 1) * SPLIT_COUNT + k) >= rows) // 如果数据超出总的记录数的时候，就退出循环
					break;
				Row row = sheet.createRow((k + 3));// 创建1行l'
				k2=k;
				// 分页处理，获取每页的结果集，并将数据内容放入excel单元格
				Order order = (Order) fieldData.get((i - 1) * SPLIT_COUNT + k);
				
				Cell cell = row.createCell(0);//
				cell.setCellValue(k+1);
				
				cell = row.createCell(1);// 
				cell.setCellValue(
						order.getConsignee() == null ? "" : order.getConsignee());
				
				cell = row.createCell(2);// 
				cell.setCellValue(
						order.getConsigneePhone() == null ? "" : order.getConsigneePhone());
				cell = row.createCell(3);// 
				String address="";
				if(order.getCity()!=null){
					address=order.getCity();
				}
				if(order.getArea()!=null){
					address=address+order.getArea();
				}
				if(order.getAddress()!=null){
					address=address+order.getAddress();
				}
				cell.setCellValue(address);
				
				cell = row.createCell(6);// 
				cell.setCellValue(
						order.getBaggageNo() == null ? "" : order.getBaggageNo());
				cell = row.createCell(7);// 
				cell.setCellValue(
						order.getRemark() == null ? "" : order.getRemark());
				
			}
//			Row row = sheet.createRow((k2 + 3));// 创建1行l'
//			Cell cell = row.createCell(1);//
//			cell.setCellValue("交出人:");
//			Row row1 = sheet.createRow((k2 + 4));// 创建1行l'
//			Cell cell1 = row1.createCell(1);//
//			cell1.setCellValue("接收人:");
		}
		workBook.write(os);// 将excel中的数据写到输出流中，用于文件的输出
		os.close();
	}

	public static void main(String[] args) {
		
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMdd HH");

		String time = sdf2.format(new Date()) + " " + "10";

		try {
			Date t = sdf2.parse(time);
			Date n = new Date();
			long between = t.getTime() - n.getTime();

			if (between < (24 * 3600000) || between > 0) {
				System.out.print(sdf2.format(new Date()));
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
