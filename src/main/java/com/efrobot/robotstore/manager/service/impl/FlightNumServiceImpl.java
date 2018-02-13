package com.efrobot.robotstore.manager.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.efrobot.robotstore.baseapi.manager.FlightNumMapper;
import com.efrobot.robotstore.baseapi.manager.SysRoleMapper;
import com.efrobot.robotstore.baseapi.manager.SysUserMapper;
import com.efrobot.robotstore.baseapi.manager.pojo.FlightNum;
import com.efrobot.robotstore.baseapi.manager.pojo.Order;
import com.efrobot.robotstore.baseapi.manager.pojo.SysRole;
import com.efrobot.robotstore.baseapi.manager.pojo.SysUser;
import com.efrobot.robotstore.manager.service.FlightNumService;
import com.efrobot.robotstore.manager.service.SysRoleService;
import com.efrobot.robotstore.util.PageInfo;
import com.github.pagehelper.PageHelper;

@Service
public class FlightNumServiceImpl implements FlightNumService {

	@Resource
	private FlightNumMapper flightNumMapper;
	@Override
	public PageInfo<FlightNum> getFlightNumListPage(FlightNum role, Integer pageNum, Integer pageSize)
			throws Exception {
		PageHelper.startPage(pageNum, pageSize);
		List<FlightNum> list = flightNumMapper.selectByParms(role);
		PageInfo<FlightNum> page = new PageInfo<FlightNum>(list);
		return page;
	}
	
	@Override
	public int insertSelective(FlightNum record){
		return flightNumMapper.insertSelective(record);
	}
	
	@Override
	public List<FlightNum> selectByParms(FlightNum record){
		return flightNumMapper.selectByParms(record);
	}
	@Override
	public int updateByPrimaryKeySelective(FlightNum record){
		return flightNumMapper.updateByPrimaryKeySelective(record);
	}
	
	@Override
	public int deleteByPrimaryKey(Integer id){
		return flightNumMapper.deleteByPrimaryKey(id);
	}
	@Override
	public Map<String, Object> importFlightNum(List<String[]> list) {
		Map<String, Object> result = new HashMap<>();
		List<String> failList = new ArrayList<>(); // 失败的 系统订单号
		for (String[] arrs : list) {
			FlightNum manager = new FlightNum();
			try {
				manager.setFlightNum(arrs[0]);//arrs[64] == null ? null : new SimpleDateFormat("yyyy/MM/dd").parse(arrs[64])
				manager.setCompay(arrs[1]);
				manager.setStartPlace(arrs[2]);
				manager.setEndPlace(arrs[3]);
				manager.setStartTime(arrs[4] == null ? null : new SimpleDateFormat("yyyy/MM/dd").parse(arrs[4]));
				manager.setEndTime(arrs[5] == null ? null : new SimpleDateFormat("yyyy/MM/dd").parse(arrs[5]));
				if(arrs[6].length()>=10){
					manager.setStartHour(arrs[6].substring(10));
				}else{
					manager.setStartHour(arrs[6]);
				}
				if(arrs[6].length()>=10){
					manager.setEndHour(arrs[7].substring(10));
				}else{
					manager.setEndHour(arrs[7]);
				}
				manager.setExp1(arrs[8]);
				
				FlightNum flightNum = new FlightNum();
				flightNum.setFlightNum(arrs[0]);
				List<FlightNum> list2=flightNumMapper.selectByParms(flightNum);
				if(list2.size()==0){
					flightNumMapper.insertSelective(manager);
				}else
				{
					manager.setId(list2.get(0).getId());
					flightNumMapper.updateByPrimaryKeySelective(manager);
				}
			} catch (Exception e) {
				failList.add("航班号:" + arrs[0]);
			}
		}
		result.put("resultCode", "SUCCESS");// 状态码
		result.put("msg", "导入成功");
		result.put("failList", failList);
		result.put("num", failList.size());
		return result;
	}
}
