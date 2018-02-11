package com.efrobot.robotstore.baseapi.manager.pojo;
import java.io.Serializable;
import java.math.BigDecimal;

public class Dispatched implements Serializable {
	/**
	* 
	*/
	private static final long serialVersionUID = 1L;
    private Integer id;

    private String dispatched;

    private String exp1;

    private String exp2;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDispatched() {
		return dispatched;
	}

	public void setDispatched(String dispatched) {
		this.dispatched = dispatched;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
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