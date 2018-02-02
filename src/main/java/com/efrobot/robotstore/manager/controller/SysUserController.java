package com.efrobot.robotstore.manager.controller;

import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.efrobot.robotstore.baseapi.manager.pojo.SysUser;
import com.efrobot.robotstore.manager.service.SysUserService;
import com.efrobot.robotstore.util.CommonUtil;
import com.efrobot.robotstore.util.Const;
import com.efrobot.toolkit.util.security.MD5;

@RequestMapping("/v1/sysuser")
@RestController
public class SysUserController {
	private static MD5 md5 = MD5.getInstance();
	@Autowired
	private SysUserService sysUserService;

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(SysUser sysUser) throws Exception {
		// log.debug("执行用户注册功能");
		sysUser.setStatus("1");
		// 校验登陆用户名密码
		if (StringUtils.isBlank(sysUser.getUsername())) {
			return CommonUtil.resultMsg("FAIL", "用户名不能为空");
		}
		if (StringUtils.isBlank(sysUser.getPassword())) {
			return CommonUtil.resultMsg("FAIL", "密码不能为空");
		}
		// try {
		int flag = sysUserService.insertSelective(sysUser);
		if (flag <= 0) {
			return CommonUtil.resultMsg("FAIL", "新增失败");
		}

		return CommonUtil.resultMsg("SUCCESS", "新增用户成功");
	}

	@RequestMapping(value = "/updateStatus", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateStatus(SysUser sysUser) throws Exception {
		// log.debug("执行用户更新功能");

		// 校验登陆用户名密码
		if (null == sysUser.getId()) {
			return CommonUtil.resultMsg("FAIL", "用户id不能为空");
		}
		// try {
		int flag = sysUserService.updateByPrimaryKeySelective(sysUser);
		if (flag <= 0) {
			return CommonUtil.resultMsg("FAIL", "更新失败");
		}
		// } catch (Exception e) {
		// //log.error("更新用户失败", e);
		// return CommonUtil.resultMsg("FAIL", "更新失败");
		// }

		return CommonUtil.resultMsg("SUCCESS", "更新用户成功");
	}
	
	@RequestMapping(value = "/updatePassWord", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updatePassWord(String passWordOld,String passWordNew) throws Exception {
		Subject subject = SecurityUtils.getSubject();
		Session session = subject.getSession();
		SysUser sysUser=(SysUser) session.getAttribute(Const.SESSION_USER);
		
	    passWordOld = md5.getMD5String(passWordOld);
		// 校验登陆用户名密码
		if (null == sysUser.getId()) {
			return CommonUtil.resultMsg("FAIL", "用户id不能为空");
		}
		if(!passWordOld.equals(sysUser.getPassword())){
			return CommonUtil.resultMsg("FAIL", "密码输入错误");
		}
		sysUser.setPassword(passWordNew);
		int flag = sysUserService.updateByPrimaryKeySelective(sysUser);
		if (flag <= 0) {
			return CommonUtil.resultMsg("FAIL", "更新失败");
		}
		return CommonUtil.resultMsg("SUCCESS", "更新用户成功");
	}
//
//	/**
//	 * 
//	 * @方法名: delete
//	 * @功能描述: 删除用户
//	 * @param userId
//	 * @return
//	 * @作者 wangxiangxiang
//	 * @日期 2016年7月13日
//	 */
//	@RequestMapping(value = "/delete", method = RequestMethod.POST)
//	@ResponseBody
//	public Map<String, Object> delete(Integer userId) throws Exception {
//		// log.debug("执行用户删除功能");
//
//		// 校验登陆用户名密码
//		if (null == userId) {
//			return CommonUtil.resultMsg("FAIL", "用户id不能为空");
//		}
//		// try {
//		int flag = sysUserService.deleteByPrimaryKey(userId);
//		if (flag <= 0) {
//			return CommonUtil.resultMsg("FAIL", "删除失败");
//		}
//		// } catch (Exception e) {
//		// //log.error("删除用户失败", e);
//		// return CommonUtil.resultMsg("FAIL", "删除失败");
//		// }
//
//		return CommonUtil.resultMsg("SUCCESS", "删除用户成功");
//	}
//

	@RequestMapping(value = "/selectByUserId", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectByUserId(Integer userId) throws Exception {
		// log.debug("执行根据用户id 查询用户信息");

		// 校验登陆用户名密码
		if (null == userId) {
			return CommonUtil.resultMsg("FAIL", "用户id不能为空");
		}
		SysUser sysUser = null;
		sysUser = sysUserService.selectByPrimaryKey(userId);
		Map<String, Object> map = CommonUtil.resultMsg("SUCCESS", "查询用户成功");
		map.put("date", sysUser);
		return map;
	}
}
