package com.efrobot.robotstore.manager.controller;

import java.io.IOException;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.exception.ExceptionUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.alibaba.fastjson.JSONObject;

@Component
@Aspect
public class LogAspect {
	private static final Logger log = Logger.getLogger(LogAspect.class);

	@Pointcut("execution(* com.efrobot.robotstore.manager.controller..*(..))")
	public void aspect() {
	}

	@Around("aspect()")
	public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
		Object result = null;
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		
		// 获取调用者IP
		String ip = request.getHeader("X-Forwarded-For");
		if (ip == null) {
			ip = request.getRemoteAddr();
		}
		// 获取请求URL
		String url = request.getRequestURI();
		String method = request.getMethod();

		Object[] args = joinPoint.getArgs();
		List<Object> argList = new ArrayList<>();
		for (Object object : args) {
			if (object instanceof Serializable) {
				argList.add(object);
			}
		}
	    result = joinPoint.proceed();
		log.info("TYPE:" + method + "#IP:" + ip + "#URL:" + url + "#METHOD:"
				+ (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()")
				+ "#REQ:" + JSONObject.toJSONString(argList) + "#" + "RES:" + JSONObject.toJSONString(result));
		return result;
	}

	@AfterThrowing(pointcut = "aspect()", throwing = "ex")
	public void doAfterThrowing(JoinPoint joinPoint, Throwable ex) throws IOException {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();

		// 获取调用者IP
		String ip = null;
        //Nginx:X-Real-IP,aliyun:X-Forwarded-For
		ip = request.getHeader("X-Forwarded-For");
		if (ip==null) {
			ip = request.getHeader("X-Real-IP");
		}
		// 获取请求URL
		String url = request.getRequestURI();
		Object[] args = joinPoint.getArgs();
		List<Object> argList = new ArrayList<>();
		for (Object object : args) {
			if (object instanceof Serializable) {
				argList.add(object);
			}
		}
		// 简短的错误信息
		String errInfo = "";

		// 根据不同的异常类型进行不同处理
		if (ex instanceof DataAccessException) {
			errInfo = "数据库操作失败！";
		} else if (ex instanceof NullPointerException) {
			errInfo = "调用了未经初始化的对象或者是不存在的对象！";
		} else if (ex instanceof IOException) {
			errInfo = "IO异常！";
		} else if (ex instanceof ClassNotFoundException) {
			errInfo = "指定的类不存在！";
		} else if (ex instanceof ArithmeticException) {
			errInfo = "数学运算异常！";
		} else if (ex instanceof ArrayIndexOutOfBoundsException) {
			errInfo = "数组下标越界!";
		} else if (ex instanceof IllegalArgumentException) {
			errInfo = "方法的参数错误！";
		} else if (ex instanceof ClassCastException) {
			errInfo = "类型强制转换错误！";
		} else if (ex instanceof SecurityException) {
			errInfo = "违背安全原则异常！";
		} else if (ex instanceof SQLException) {
			errInfo = "操作数据库异常！";
		} else if (ex.getClass().equals(NoSuchMethodError.class)) {
			errInfo = "方法末找到异常！";
		} else if (ex.getClass().equals(InternalError.class)) {
			errInfo = "Java虚拟机发生了内部错误";
		} else {
			errInfo = "程序内部错误，操作失败！";
		}

		log.error("EX_CODE:" + ex.getClass().getName() + "#EX_MSG:" + ex.getMessage() + "#EX_URL:" + url + "#EX_METHOD:"
				+ (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()")
				+ "#EX_IP:" + ip + "#EX_PARAM:" + JSONObject.toJSONString(argList) + "#EX_DESC:" + errInfo + "#EX:"
				+ JSONObject.toJSONString(ExceptionUtils.getStackTrace(ex)));
	}

}
