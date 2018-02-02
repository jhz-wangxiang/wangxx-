package com.efrobot.robotstore.baseapi.manager.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Date;

public class Order implements Serializable {
	/**
	* 
	*/
	private static final long serialVersionUID = 1L;
    private Integer id;

    private Integer userId;//注册用户id
    
    private String name;//注册用户名称

    private String phone;//注册用户手机

    private String flightNum;//航班号

    private Date nowTime;//航班时间
    
    private String nowTimeStr;//航班时间

    private String baggageNum;//行李数量

    private String baggage;//行李

    private String registerName;//登记人姓名

    private String registerPhone;//登记人手机号

    private Integer channelId;//渠道id
    
    private String channel;//渠道名称

    private String consignee;//收货人姓名

    private String consigneePhone;//收货人手机号

    private String address;//收货地址

    private Integer areaId;//送货区域id

    private Integer mileage;//送货里程

    private BigDecimal basicFee;//基础费用

    private BigDecimal discount;//折扣

    private BigDecimal additionalFee;//附加费用

    private BigDecimal payCost;//补交费用
    
    private BigDecimal paidFee;//实付费用
    
    private BigDecimal expFee;//扩展费用

    private BigDecimal refundFee;//退款费用

    private BigDecimal totalFee;//总费用

    private String payType;//支付方式

    private String payStatus;//支付状态

    private String orderNo;//订单号

    private String orderWxNo;//微信订单号

    private Integer orderStatus;//订单状态

    private String abnormalStatus;//异常状态

    private String abnormaReason;//异常原因

    private String remark;//备注

    private String refundReason;//退款原因

    private String cancelReason;//取消原因

    private String operator;//操作人姓名

    private Date createDate;//下单时间

    private Date updateDate;
    
    private String describe;

    private String button;

    public String getNowTimeStr() {
		return nowTimeStr;
	}

	public void setNowTimeStr(String nowTimeStr) {
		this.nowTimeStr = nowTimeStr;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFlightNum() {
        return flightNum;
    }

    public void setFlightNum(String flightNum) {
        this.flightNum = flightNum == null ? null : flightNum.trim();
    }

    public Date getNowTime() {
    	if (null == nowTimeStr || "".equals(nowTimeStr)) {
			return nowTime;
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		try {
			nowTime = sdf.parse(nowTimeStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nowTime;
    }

    public void setNowTime(Date nowTime) {
        this.nowTime = nowTime;
    }

    public String getBaggageNum() {
        return baggageNum;
    }

    public void setBaggageNum(String baggageNum) {
        this.baggageNum = baggageNum == null ? null : baggageNum.trim();
    }

    public String getBaggage() {
        return baggage;
    }

    public void setBaggage(String baggage) {
        this.baggage = baggage == null ? null : baggage.trim();
    }


    public String getRegisterName() {
		return registerName;
	}

	public void setRegisterName(String registerName) {
		this.registerName = registerName;
	}

	public String getRegisterPhone() {
		return registerPhone;
	}

	public void setRegisterPhone(String registerPhone) {
		this.registerPhone = registerPhone;
	}

	public Integer getChannelId() {
        return channelId;
    }

    public void setChannelId(Integer channelId) {
        this.channelId = channelId;
    }

    public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}

	public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee == null ? null : consignee.trim();
    }

    public String getConsigneePhone() {
        return consigneePhone;
    }

    public void setConsigneePhone(String consigneePhone) {
        this.consigneePhone = consigneePhone == null ? null : consigneePhone.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public Integer getMileage() {
        return mileage;
    }

    public void setMileage(Integer mileage) {
        this.mileage = mileage;
    }

    public BigDecimal getBasicFee() {
        return basicFee;
    }

    public void setBasicFee(BigDecimal basicFee) {
        this.basicFee = basicFee;
    }

    public BigDecimal getDiscount() {
        return discount;
    }

    public void setDiscount(BigDecimal discount) {
        this.discount = discount;
    }

    public BigDecimal getAdditionalFee() {
        return additionalFee;
    }

    public void setAdditionalFee(BigDecimal additionalFee) {
        this.additionalFee = additionalFee;
    }

    public BigDecimal getPayCost() {
        return payCost;
    }

    public void setPayCost(BigDecimal payCost) {
        this.payCost = payCost;
    }

    public BigDecimal getRefundFee() {
        return refundFee;
    }

    public void setRefundFee(BigDecimal refundFee) {
        this.refundFee = refundFee;
    }

    public BigDecimal getPaidFee() {
		return paidFee;
	}

	public void setPaidFee(BigDecimal paidFee) {
		this.paidFee = paidFee;
	}

	public BigDecimal getExpFee() {
		return expFee;
	}

	public void setExpFee(BigDecimal expFee) {
		this.expFee = expFee;
	}

	public BigDecimal getTotalFee() {
        return totalFee;
    }

    public void setTotalFee(BigDecimal totalFee) {
        this.totalFee = totalFee;
    }

    public String getPayType() {
        return payType;
    }

    public void setPayType(String payType) {
        this.payType = payType == null ? null : payType.trim();
    }

    public String getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(String payStatus) {
        this.payStatus = payStatus == null ? null : payStatus.trim();
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo == null ? null : orderNo.trim();
    }

    public String getOrderWxNo() {
        return orderWxNo;
    }

    public void setOrderWxNo(String orderWxNo) {
        this.orderWxNo = orderWxNo == null ? null : orderWxNo.trim();
    }

    public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getAbnormalStatus() {
        return abnormalStatus;
    }

    public void setAbnormalStatus(String abnormalStatus) {
        this.abnormalStatus = abnormalStatus == null ? null : abnormalStatus.trim();
    }

    public String getAbnormaReason() {
        return abnormaReason;
    }

    public void setAbnormaReason(String abnormaReason) {
        this.abnormaReason = abnormaReason == null ? null : abnormaReason.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getRefundReason() {
        return refundReason;
    }

    public void setRefundReason(String refundReason) {
        this.refundReason = refundReason == null ? null : refundReason.trim();
    }

    public String getCancelReason() {
        return cancelReason;
    }

    public void setCancelReason(String cancelReason) {
        this.cancelReason = cancelReason == null ? null : cancelReason.trim();
    }

    public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getButton() {
		return button;
	}

	public void setButton(String button) {
		this.button = button;
	}
    
}