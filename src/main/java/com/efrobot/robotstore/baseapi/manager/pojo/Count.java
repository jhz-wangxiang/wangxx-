package com.efrobot.robotstore.baseapi.manager.pojo;

import java.io.Serializable;

public class Count implements Serializable {
	/**
	* 
	*/
	private static final long serialVersionUID = 1L;


    private Integer count;

    private String name;
    
    private String time;

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

    
}