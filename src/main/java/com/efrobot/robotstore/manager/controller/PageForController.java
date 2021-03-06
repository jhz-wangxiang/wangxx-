package com.efrobot.robotstore.manager.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/v1/page")
@Controller
public class PageForController {

	@RequestMapping(value = "/test")
	public String test(HttpServletRequest request) {
		request.setAttribute("navName", "结算信息-修改");
		return "test";
	}
	@RequestMapping(value = "/orderList")
	public String orderList(HttpServletRequest request) {
		request.setAttribute("navName", "订单管理");
		return "orderList";
	}
	@RequestMapping(value = "/addOrder")
	public String addOrder(HttpServletRequest request) {
		request.setAttribute("navName", "新建订单(校验用户)");
		return "addOrder";
	}
	@RequestMapping(value = "/newOrder")
	public String newOrder(HttpServletRequest request) {
		request.setAttribute("navName", "新建订单");
		return "newOrder";
	}
	@RequestMapping(value = "/orderDetails")
	public String orderDetails(HttpServletRequest request) {
		request.setAttribute("navName", "订单详情");
		return "orderDetails";
	}
	@RequestMapping(value = "/customerList")
	public String customerList(HttpServletRequest request) {
		request.setAttribute("navName", "客户管理");
		return "customerList";
	}
	@RequestMapping(value = "/customerDetails")
	public String customerDetails(HttpServletRequest request) {
		request.setAttribute("navName", "客户详情");
		return "customerDetails";
	}
	@RequestMapping(value = "/orderHistory")
	public String orderHistory(HttpServletRequest request) {
		request.setAttribute("navName", "订单历史");
		return "orderHistory";
	}
	@RequestMapping(value = "/staffList")
	public String staffList(HttpServletRequest request) {
		request.setAttribute("navName", "员工管理");
		return "staffList";
	}
	@RequestMapping(value = "/abnormityOrderList")
	public String abnormityOrderList(HttpServletRequest request) {
		request.setAttribute("navName", "异常管理");
		return "abnormityOrderList";
	}
	@RequestMapping(value = "/roleList")
	public String roleList(HttpServletRequest request) {
		request.setAttribute("navName", "角色管理");
		return "roleList";
	}
	@RequestMapping(value = "/channelList")
	public String channelList(HttpServletRequest request) {
		request.setAttribute("navName", "渠道管理");
		return "channelList";
	}
	@RequestMapping(value = "/flightList")
	public String flightList(HttpServletRequest request) {
		request.setAttribute("navName", "航班管理");
		return "flightList";
	}
	@RequestMapping(value = "/areaList")
	public String areaList(HttpServletRequest request) {
		request.setAttribute("navName", "区域管理");
		return "areaList";
	}
	@RequestMapping(value = "/dispatchList")
	public String dispatchList(HttpServletRequest request) {
		request.setAttribute("navName", "派送人管理");
		return "dispatchList";
	}
	@RequestMapping(value = "/count")
	public String count(HttpServletRequest request) {
		request.setAttribute("navName", "统计管理");
		return "count";
	}
	@RequestMapping(value = "/countTotal")
	public String countTotal(HttpServletRequest request) {
		request.setAttribute("navName", "总表统计");
		return "countTotal";
	}
}
