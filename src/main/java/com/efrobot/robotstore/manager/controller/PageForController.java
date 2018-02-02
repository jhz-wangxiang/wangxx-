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
	@RequestMapping(value = "/newOrder")
	public String newOrder(HttpServletRequest request) {
		request.setAttribute("navName", "新建订单");
		return "newOrder";
	}
	
}
