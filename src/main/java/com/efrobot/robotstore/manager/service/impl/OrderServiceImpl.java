package com.efrobot.robotstore.manager.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.efrobot.robotstore.baseapi.manager.AreaMapper;
import com.efrobot.robotstore.baseapi.manager.ChannelMapper;
import com.efrobot.robotstore.baseapi.manager.FlightNumMapper;
import com.efrobot.robotstore.baseapi.manager.OrderMapper;
import com.efrobot.robotstore.baseapi.manager.OrderStatusMapper;
import com.efrobot.robotstore.baseapi.manager.OrderStatusRecordMapper;
import com.efrobot.robotstore.baseapi.manager.pojo.Area;
import com.efrobot.robotstore.baseapi.manager.pojo.Channel;
import com.efrobot.robotstore.baseapi.manager.pojo.Count;
import com.efrobot.robotstore.baseapi.manager.pojo.FlightNum;
import com.efrobot.robotstore.baseapi.manager.pojo.Order;
import com.efrobot.robotstore.baseapi.manager.pojo.OrderStatus;
import com.efrobot.robotstore.baseapi.manager.pojo.OrderStatusRecord;
import com.efrobot.robotstore.manager.service.OrderService;
import com.efrobot.robotstore.util.PageInfo;
import com.github.pagehelper.PageHelper;

@Service
public class OrderServiceImpl implements OrderService {

	@Resource
	private OrderMapper orderMapper;
	@Resource
	private OrderStatusMapper orderStatusMapper;
	@Resource
	private ChannelMapper channelMapper;
	@Resource
	private AreaMapper areaMapper;
	@Resource
	private FlightNumMapper flightNumMapper;
	@Resource
	private OrderStatusRecordMapper orderStatusRecordMapper;

	@Override
	public PageInfo<Order> getOrderListPage(Order order, Integer pageNum, Integer pageSize) throws Exception {
		PageHelper.startPage(pageNum, pageSize);
		List<Order> list = orderMapper.selectByParms(order);
		PageInfo<Order> page = new PageInfo<Order>(list);
		return page;
	}

	@Override
	public PageInfo<Count> getOrderCount(Order order, Integer pageNum, Integer pageSize) throws Exception {
		PageHelper.startPage(pageNum, pageSize);
		List<Count> list = new ArrayList<>();
		if ("1".equals(order.getExp2())) {// 订单总量
			if ("YEAR".equals(order.getExp1())) {
				list = orderMapper.getOrderCountYear(order);
			} else if ("MON".equals(order.getExp1())) {
				list = orderMapper.getOrderCountMon(order);
			} else if ("WEEK".equals(order.getExp1())) {
				list = orderMapper.getOrderCountWeek(order);
			} else if ("DAY".equals(order.getExp1())) {
				list = orderMapper.getOrderCountDay(order);
			}
		} else if ("2".equals(order.getExp2())) {// 员工新建订单
			if ("YEAR".equals(order.getExp1())) {
				list = orderMapper.getOrderStaffYear(order);
			} else if ("MON".equals(order.getExp1())) {
				list = orderMapper.getOrderStaffMon(order);
			} else if ("WEEK".equals(order.getExp1())) {
				list = orderMapper.getOrderStaffWeek(order);
			} else if ("DAY".equals(order.getExp1())) {
				list = orderMapper.getOrderStaffDay(order);
			}
		} else if ("3".equals(order.getExp2())) {// 支付方式
			if ("YEAR".equals(order.getExp1())) {
				list = orderMapper.getOrderPayTypeYear(order);
			} else if ("MON".equals(order.getExp1())) {
				list = orderMapper.getOrderPayTypeMon(order);
			} else if ("WEEK".equals(order.getExp1())) {
				list = orderMapper.getOrderPayTypeWeek(order);
			} else if ("DAY".equals(order.getExp1())) {
				list = orderMapper.getOrderPayTypeDay(order);
			}
		} else if ("4".equals(order.getExp2())) {// 航空公司
			if ("YEAR".equals(order.getExp1())) {
				list = orderMapper.getOrderFlightYear(order);
			} else if ("MON".equals(order.getExp1())) {
				list = orderMapper.getOrderFlightMon(order);
			} else if ("WEEK".equals(order.getExp1())) {
				list = orderMapper.getOrderFlightWeek(order);
			} else if ("DAY".equals(order.getExp1())) {
				list = orderMapper.getOrderFlightDay(order);
			}
		}else if ("5".equals(order.getExp2())) {// 区域
			if ("YEAR".equals(order.getExp1())) {
				list = orderMapper.getOrderAreaYear(order);
			} else if ("MON".equals(order.getExp1())) {
				list = orderMapper.getOrderAreaMon(order);
			} else if ("WEEK".equals(order.getExp1())) {
				list = orderMapper.getOrderAreaWeek(order);
			} else if ("DAY".equals(order.getExp1())) {
				list = orderMapper.getOrderAreaDay(order);
			}
		}else if ("6".equals(order.getExp2())) {// 渠道
			if ("YEAR".equals(order.getExp1())) {
				list = orderMapper.getOrderChannelYear(order);
			} else if ("MON".equals(order.getExp1())) {
				list = orderMapper.getOrderChannelMon(order);
			} else if ("WEEK".equals(order.getExp1())) {
				list = orderMapper.getOrderChannelWeek(order);
			} else if ("DAY".equals(order.getExp1())) {
				list = orderMapper.getOrderChannelDay(order);
			}
		}else if ("7".equals(order.getExp2())) {// hangb
			if ("YEAR".equals(order.getExp1())) {
				list = orderMapper.getOrderFlightNumYear(order);
			} else if ("MON".equals(order.getExp1())) {
				list = orderMapper.getOrderFlightNumMon(order);
			} else if ("WEEK".equals(order.getExp1())) {
				list = orderMapper.getOrderFlightNumWeek(order);
			} else if ("DAY".equals(order.getExp1())) {
				list = orderMapper.getOrderFlightNumDay(order);
			}
		}
		PageInfo<Count> page = new PageInfo<Count>(list);
		return page;
	}
	@Override
	public List<Count> getOrderCountAll(Order order) {
		List<Count> list = new ArrayList<>();
		if ("1".equals(order.getExp2())) {// 订单总量
			if ("YEAR".equals(order.getExp1())) {
				list = orderMapper.getOrderCountYear(order);
			} else if ("MON".equals(order.getExp1())) {
				list = orderMapper.getOrderCountMon(order);
			} else if ("WEEK".equals(order.getExp1())) {
				list = orderMapper.getOrderCountWeek(order);
			} else if ("DAY".equals(order.getExp1())) {
				list = orderMapper.getOrderCountDay(order);
			}
		} else if ("2".equals(order.getExp2())) {// 员工新建订单
			if ("YEAR".equals(order.getExp1())) {
				list = orderMapper.getOrderStaffYear(order);
			} else if ("MON".equals(order.getExp1())) {
				list = orderMapper.getOrderStaffMon(order);
			} else if ("WEEK".equals(order.getExp1())) {
				list = orderMapper.getOrderStaffWeek(order);
			} else if ("DAY".equals(order.getExp1())) {
				list = orderMapper.getOrderStaffDay(order);
			}
		} else if ("3".equals(order.getExp2())) {// 支付方式
			if ("YEAR".equals(order.getExp1())) {
				list = orderMapper.getOrderPayTypeYear(order);
			} else if ("MON".equals(order.getExp1())) {
				list = orderMapper.getOrderPayTypeMon(order);
			} else if ("WEEK".equals(order.getExp1())) {
				list = orderMapper.getOrderPayTypeWeek(order);
			} else if ("DAY".equals(order.getExp1())) {
				list = orderMapper.getOrderPayTypeDay(order);
			}
		} else if ("4".equals(order.getExp2())) {// 航空公司
			if ("YEAR".equals(order.getExp1())) {
				list = orderMapper.getOrderFlightYear(order);
			} else if ("MON".equals(order.getExp1())) {
				list = orderMapper.getOrderFlightMon(order);
			} else if ("WEEK".equals(order.getExp1())) {
				list = orderMapper.getOrderFlightWeek(order);
			} else if ("DAY".equals(order.getExp1())) {
				list = orderMapper.getOrderFlightDay(order);
			}
		}else if ("5".equals(order.getExp2())) {// 区域
			if ("YEAR".equals(order.getExp1())) {
				list = orderMapper.getOrderAreaDay(order);
			} else if ("MON".equals(order.getExp1())) {
				list = orderMapper.getOrderAreaDay(order);
			} else if ("WEEK".equals(order.getExp1())) {
				list = orderMapper.getOrderAreaDay(order);
			} else if ("DAY".equals(order.getExp1())) {
				list = orderMapper.getOrderAreaDay(order);
			}
		}else if ("6".equals(order.getExp2())) {// 渠道
			if ("YEAR".equals(order.getExp1())) {
				list = orderMapper.getOrderChannelYear(order);
			} else if ("MON".equals(order.getExp1())) {
				list = orderMapper.getOrderChannelMon(order);
			} else if ("WEEK".equals(order.getExp1())) {
				list = orderMapper.getOrderChannelWeek(order);
			} else if ("DAY".equals(order.getExp1())) {
				list = orderMapper.getOrderChannelDay(order);
			}
		}else if ("7".equals(order.getExp2())) {// hangb
			if ("YEAR".equals(order.getExp1())) {
				list = orderMapper.getOrderFlightNumDay(order);
			} else if ("MON".equals(order.getExp1())) {
				list = orderMapper.getOrderFlightNumMon(order);
			} else if ("WEEK".equals(order.getExp1())) {
				list = orderMapper.getOrderFlightNumWeek(order);
			} else if ("DAY".equals(order.getExp1())) {
				list = orderMapper.getOrderFlightNumDay(order);
			}
		}
		return list;
	}

	@Override
	public PageInfo<OrderStatusRecord> getOrderStatusRecordListPage(String orderNo, Integer pageNum, Integer pageSize)
			throws Exception {
		PageHelper.startPage(pageNum, pageSize);
		List<OrderStatusRecord> list = orderStatusRecordMapper.selectByparms(orderNo);
		PageInfo<OrderStatusRecord> page = new PageInfo<OrderStatusRecord>(list);
		return page;
	}

	@Override
	public List<Order> selectByParms(Order record) {
		return orderMapper.selectByParms(record);
	}

	@Override
	public int insertSelective(Order record) {
		return orderMapper.insertSelective(record);
	}

	@Override
	public int updateByPrimaryKey(Order record) {
		return orderMapper.updateByPrimaryKey(record);
	}

	@Override
	public int updateByPrimaryKeySelective(Order record) {
		return orderMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int setDispatched(Order record) {
		return orderMapper.setDispatched(record);
	}

	@Override
	public List<OrderStatus> selectSelectList(String selected) {
		if (selected == null) {
			return orderStatusMapper.selectAll();
		} else {
			return orderStatusMapper.selectSelectList(Arrays.asList(selected.split(",")));
		}
	}

	@Override
	public List<Channel> getChannel(Channel record) {
		return channelMapper.getChannel(record);
	}

	@Override
	public List<Area> getArea(Area record) {
		return areaMapper.getArea(record);
	}

	@Override
	public List<FlightNum> getFlightNum(FlightNum record) {
		return flightNumMapper.getFlightNum(record);
	}

	@Override
	public Order selectByPrimaryKey(Integer id) {
		return orderMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(OrderStatusRecord record) {
		return orderStatusRecordMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int insertSelective(OrderStatusRecord record) {
		return orderStatusRecordMapper.insertSelective(record);
	}

	public List<OrderStatusRecord> selectByparms(String exp1) {
		return orderStatusRecordMapper.selectByparms(exp1);
	}

}
