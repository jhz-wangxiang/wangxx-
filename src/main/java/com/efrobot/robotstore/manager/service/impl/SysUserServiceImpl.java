package com.efrobot.robotstore.manager.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import com.efrobot.robotstore.baseapi.manager.SysUserMapper;
import com.efrobot.robotstore.baseapi.manager.pojo.SysUser;
import com.efrobot.robotstore.manager.service.SysUserService;
import com.efrobot.toolkit.util.security.MD5;

/**
 * 
 * @包名 com.efrobot.robotstore.manager.service.impl
 * @类名 SysUserServiceServiceImpl.java
 * @作者 wangxiangxiang
 * @创建日期 2016年7月13日
 * @描述 
 * @版本 V 1.0
 */
@Service
public class SysUserServiceImpl implements SysUserService {

	@Resource
	private SysUserMapper sysUserMapper;

	private static MD5 md5 = MD5.getInstance();

//	/**
//	 * @方法名: selectByParams
//	 * @功能描述: 查询用户列表
//	 * @param record
//	 * @return List<SysUser>
//	 * @作者 wangxx
//	 * @日期 2016年7月13日15:08:49
//	 */
//	public List<SysUser> selectByParams(SysUser record) {
//		if (null != record && !StringUtils.isBlank(record.getPassword())) {
//			String pssword = md5.getMD5String(record.getPassword());
//			record.setPassword(pssword);
//		}
//		return sysUserMapper.selectByParams(record);
//	}

	public int insertSelective(SysUser record) {
		if (null != record && !StringUtils.isBlank(record.getPassword())) {
			String pssword = md5.getMD5String(record.getPassword());
			record.setPassword(pssword);
		}
		return sysUserMapper.insertSelective(record);
	}
	
	public int updateByPrimaryKeySelective(SysUser record) {
		if (null != record && !StringUtils.isBlank(record.getPassword())) {
			String pssword = md5.getMD5String(record.getPassword());
			record.setPassword(pssword);
		}
		return sysUserMapper.updateByPrimaryKeySelective(record);
	}
//
//	/**
//	 * 
//	 * @方法名: deleteByPrimaryKey  
//	 * @功能描述: 删除用户
//	 * @param userId
//	 * @return
//	 * @throws Exception
//	 * @作者 wangxiangxiang
//	 * @日期 2016年7月13日
//	 */
//	public int deleteByPrimaryKey(Integer userId) {
//		return sysUserMapper.deleteByPrimaryKey(userId);
//	}
//
//	/**
//	  * 
	public SysUser selectByPrimaryKey(Integer userId) {
		return sysUserMapper.selectByPrimaryKey(userId);
	}
}
