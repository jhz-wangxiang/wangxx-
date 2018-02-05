package com.efrobot.robotstore.manager.controller;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.efrobot.robotstore.baseapi.manager.pojo.SysMenuDto;
import com.efrobot.robotstore.baseapi.manager.pojo.SysUser;
import com.efrobot.robotstore.manager.service.SysMenuService;
import com.efrobot.robotstore.util.CommonUtil;
import com.efrobot.robotstore.util.Const;
import com.efrobot.robotstore.util.ProjectConfig;
import com.efrobot.robotstore.util.VerifyCodeUtil;

@RequestMapping("/v1/login")
@Controller
public class LoginController {

	@Resource
	private SysMenuService sysMenuService;

	@RequestMapping("/loginPage")
	public String loginPage() {
		return "../login";
	}

	@RequestMapping(path = "/test")
	public String test(String mac, HttpServletResponse response, HttpServletRequest request) throws Exception {
		System.out.println(mac);
		request.getSession().setAttribute("mac", mac);
		response.sendRedirect("../login");
		return null;
	}

	@RequestMapping("/homePage")
	public String homePage(HttpServletRequest request) {
		request.setAttribute("navName", "官网订单");
		return "index";
	}

	/**
	 * 获取验证码图片和文本(验证码文本会保存在HttpSession中)
	 */
	@RequestMapping("/getVerifyCodeImage")
	public void getVerifyCodeImage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 设置页面不缓存
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		String verifyCode = VerifyCodeUtil.generateTextCode(VerifyCodeUtil.TYPE_NUM_ONLY, 4, null);
		// 将验证码放到HttpSession里面
		request.getSession().setAttribute("verifyCode", verifyCode);
		// log.debug("本次生成的验证码为[" + verifyCode + "],已存放到HttpSession中");
		// 设置输出的内容的类型为JPEG图像
		response.setContentType("image/jpeg");
		BufferedImage bufferedImage = VerifyCodeUtil.generateImageCode(verifyCode, 90, 30, 3, true, Color.WHITE,
				Color.BLACK, null);
		// 写给浏览器
		ImageIO.write(bufferedImage, "JPEG", response.getOutputStream());
	}

	/**
	 * 
	 * @方法名: login
	 * @功能描述: 管理系统登陆
	 * @param session
	 * @param sysUser
	 * @return
	 * @作者 wangxiangxiang
	 * @日期 2016年7月13日
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> login(SysUser sysUser, HttpServletRequest request, String verifyCode) throws Exception {
		// log.debug("执行登录功能");
		Map<String, Object> map = new HashMap<String, Object>();
		// 从session 中获取验证码
		String verifySessionCode = (String) request.getSession().getAttribute("verifyCode");
		if (StringUtils.isBlank(verifySessionCode))
			return CommonUtil.resultMsg("FAIL", "验证码过期，请重新输入验证码");

		if (StringUtils.isBlank(verifyCode))
			return CommonUtil.resultMsg("FAIL", "请输入验证码");
		// 去掉大小写因素影响
		verifyCode = verifyCode.toUpperCase().trim();
		verifySessionCode = verifySessionCode.toUpperCase().trim();
		// 判断验证码
		if (!verifySessionCode.equals(verifyCode))
			return CommonUtil.resultMsg("FAIL", "请输入正确的验证码");
		// 校验登陆用户名密码
		if (StringUtils.isBlank(sysUser.getUsername())) {
			return CommonUtil.resultMsg("FAIL", "用户名不能为空");
		}
		if (StringUtils.isBlank(sysUser.getPassword())) {
			return CommonUtil.resultMsg("FAIL", "密码不能为空");
		}
		// 查询用户权限

		// shiro加入身份验证，登录后存放进shiro token
		SecurityUtils.getSecurityManager().logout(SecurityUtils.getSubject());
		Subject subject = SecurityUtils.getSubject();

		try {
			UsernamePasswordToken token = new UsernamePasswordToken(sysUser.getUsername(),
					com.efrobot.robotstore.util.SecurityUtils.encryptByMD5(sysUser.getPassword()));
			subject.login(token);
		} catch (UnknownAccountException uae) {
			// log.debug("对用户[" + sysUser.getUsername() + "]未知账户");
			return CommonUtil.resultMsg("FAIL", "用户名或密码错误");
		} catch (IncorrectCredentialsException ice) {
			// log.debug("对用户[" + sysUser.getUsername() + "]密码不正确");
			return CommonUtil.resultMsg("FAIL", "用户名或密码错误");
		} catch (LockedAccountException lae) {
			// log.debug("对用户[" + sysUser.getUsername() + "]账户已锁定");
			return CommonUtil.resultMsg("FAIL", "账户已锁定");
		} catch (ExcessiveAttemptsException eae) {
			// log.debug("对用户[" + sysUser.getUsername() + "]用户名或密码错误次数过多");
			return CommonUtil.resultMsg("FAIL", "用户名或密码错误次数过多");
		} catch (AuthenticationException ae) {
			// log.debug("对用户[" + sysUser.getUsername() + "]用户名或密码不正确");
			return CommonUtil.resultMsg("FAIL", "用户名或密码不正确");
		} catch (NoSuchAlgorithmException e) {
			return CommonUtil.resultMsg("FAIL", "加密算法发生异常");
		} catch (UnsupportedEncodingException e) {
			return CommonUtil.resultMsg("FAIL", "加密处理发生异常不支持的编码");
		}

		// 保存用户信息到session
		Session session = subject.getSession();
		session.setAttribute(Const.SESSION_USERNAME, sysUser.getUsername());
		
		Object midObject = session.getAttribute(Const.SESSION_USER);
		if (midObject == null)
			return CommonUtil.resultMsg("FAIL", "从session中获取用户信息异常");
		sysUser = (SysUser) midObject;
		session.setAttribute(Const.SESSION_USER, sysUser);
//		List<SysMenuDto> list = null;
//		list = sysMenuService.selectAllMenuByRole(Arrays.asList(sysUser.getUsername().split("-")));
		map.put("resultCode", "SUCCESS");
		map.put("msg", "登录成功");
		map.put("roleId", sysUser.getRoleId());
//		map.put("menuList", list);
		return map;
	}

	/**
	 * @方法名: logout
	 * @功能描述: TODO(这里用一句话描述这个方法的作用)
	 * @param request
	 * @param response
	 * @return
	 * @作者 zhouzihe
	 * @日期 2016年7月20日
	 */
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redirectAttributes) throws Exception {
		Subject subject = SecurityUtils.getSubject();
		redirectAttributes.addFlashAttribute("message", "保存用户成功！");// 使用addFlashAttribute
		if (subject == null)
			return "../login";

		// 清除session
		subject.logout();
		return "../login";
	}

}
