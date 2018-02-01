package com.efrobot.robotstore.baseapi.manager.pojo;

import java.io.Serializable;
import java.util.Date;

public class FlightNum implements Serializable {
	/**
	* 
	*/
	private static final long serialVersionUID = 1L;
    private Integer id;

    private String flightNum;

    private String compay;

    private Date startTime;

    private Date endTime;

    private String status;

    private Date cteateDate;

    private String exp1;

    private String exp2;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFlightNum() {
        return flightNum;
    }

    public void setFlightNum(String flightNum) {
        this.flightNum = flightNum == null ? null : flightNum.trim();
    }

    public String getCompay() {
        return compay;
    }

    public void setCompay(String compay) {
        this.compay = compay == null ? null : compay.trim();
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public Date getCteateDate() {
        return cteateDate;
    }

    public void setCteateDate(Date cteateDate) {
        this.cteateDate = cteateDate;
    }

    public String getExp1() {
        return exp1;
    }

    public void setExp1(String exp1) {
        this.exp1 = exp1 == null ? null : exp1.trim();
    }

    public String getExp2() {
        return exp2;
    }

    public void setExp2(String exp2) {
        this.exp2 = exp2 == null ? null : exp2.trim();
    }
}