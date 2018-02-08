package com.efrobot.robotstore.manager.service.impl;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.efrobot.robotstore.baseapi.manager.OrderMapper;
import com.efrobot.robotstore.baseapi.manager.UserMapper;
import com.efrobot.robotstore.baseapi.manager.pojo.Order;
import com.efrobot.robotstore.baseapi.manager.pojo.User;
import com.efrobot.robotstore.manager.service.UserService;
import com.efrobot.robotstore.util.PageInfo;
import com.github.pagehelper.PageHelper;

@Service
public class UserServiceImpl implements UserService {
	@Resource
	private UserMapper userMapper;
	@Resource
	private OrderMapper orderMapper;

	@Override
	public List<User> selectByUser(User record) {
		return userMapper.selectByUser(record);
	}
	
	@Override
	public int insertSelective(User record) {
		return userMapper.insertSelective(record);
	}

	@Override
	public int updateByPrimaryKeySelective(User record) {
		return userMapper.updateByPrimaryKeySelective(record);
	}
	
	@Override
	public PageInfo<User> getUserListPage(User user, Integer pageNum, Integer pageSize)
			throws Exception {
		PageHelper.startPage(pageNum, pageSize);
		List<User> list = userMapper.selectByParms(user);
		for(User us:list){
			if(us.getName()!=null&&!"".equals(us.getName())){
				us.setExp1("是");
			}else{
				us.setExp1("未");
			}
			Order order=new Order();
			String ids="1,2,3,4,5";
			order.setListStatus(Arrays.asList(ids.split(",")));
			order.setUserId(us.getId());
			List<Order> orlist=orderMapper.selectByParms(order);
			if(orlist.size()!=0){
				us.setExp2("有");
			}else{
				us.setExp2("未");
			}
			
		}
		PageInfo<User> page = new PageInfo<User>(list);
		return page;
	}

}
