package com.uguanjia.o2o.store.service;

import java.util.List;

import com.uguanjia.o2o.Order;
import com.uguanjia.o2o.store.controller.dto.OrderQueryCondition;

/**
 * 
 * @author 宿磊
 *
 */
public interface OrderService {
	
	/**
	 * 查询订单
	 * @param condition
	 * @return
	 */
	public List<Order> queryOrders(OrderQueryCondition condition);

}
