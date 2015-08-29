package com.uguanjia.o2o.store.dao;

import java.util.List;

import com.uguanjia.o2o.Order;
import com.uguanjia.o2o.store.controller.dto.OrderQueryCondition;

/*******************************************
 * @CLASS:OrderDao
 * @DESCRIPTION:	
 * @VERSION:v1.0
 *******************************************/
public interface OrderDao {

	
	public int queryOrderCountsByStore(OrderQueryCondition condition);
	
	public List<Order> queryOrdersByStore(OrderQueryCondition condition);
}

