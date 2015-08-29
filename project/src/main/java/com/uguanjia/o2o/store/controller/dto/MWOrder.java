package com.uguanjia.o2o.store.controller.dto;

import com.uguanjia.o2o.Order;

/**
 * 猫屋订单
 * @author MW-R002
 *
 */
public class MWOrder extends Order {
	
	private String mid;

	private int area;
	
	private String expressName;
	
	private String expressId;
	
	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getArea() {
		return area;
	}

	public void setArea(int area) {
		this.area = area;
	}

	public String getExpressName() {
		return expressName;
	}

	public void setExpressName(String expressName) {
		this.expressName = expressName;
	}

	public String getExpressId() {
		return expressId;
	}

	public void setExpressId(String expressId) {
		this.expressId = expressId;
	}
}
