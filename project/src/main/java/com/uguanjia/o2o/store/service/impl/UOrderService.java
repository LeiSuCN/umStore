package com.uguanjia.o2o.store.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import com.uguanjia.o2o.Order;
import com.uguanjia.o2o.store.controller.dto.OrderQueryCondition;
import com.uguanjia.o2o.store.dao.OrderDao;
import com.uguanjia.o2o.store.service.OrderService;

@Service("UOrderService")
public class UOrderService implements OrderService{
	
	private final Logger logger = LogManager.getLogger(getClass());
	
	@Inject
	@Named("OrderDao")
	private OrderDao orderDao;	

	@Override
	public List<Order> queryOrders(OrderQueryCondition condition) {
		
		long storeId = condition.getStoreId();
		
		if( logger.isInfoEnabled() ){
			logger.info("begin to query orders for " + storeId 
					+ ", pageNo is " + condition.getPageNo() 
					+ ", pageSize is " + condition.getPageSize());
		}
		
		// 首先查询总数
		int total = orderDao.queryOrderCountsByStore(condition);
		List<Order> orders = null;
		condition.setTotal(total);
		if( total > 0 )
		{
			orders = orderDao.queryOrdersByStore(condition);
		}
		else 
		{
			orders = new ArrayList<>();
		}
		
		return orders;
	}

}
