package com.uguanjia.o2o.store.service.impl;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.uguanjia.o2o.Order;
import com.uguanjia.o2o.store.controller.dto.MWOrder;
import com.uguanjia.o2o.store.controller.dto.OrderQueryCondition;
import com.uguanjia.o2o.store.service.OrderService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/application.xml"})
public class MOrderServiceTest {
	
	@Inject
	@Named("OrderService")
	private OrderService orderService;    
    
	@Test
	public void test_queryOrders_01() {
		
		long storeId = 4403020002L;
		
		OrderQueryCondition condition = new OrderQueryCondition();
		condition.setStoreId(storeId);
		
		List<Order> orders = this.orderService.queryOrders(condition);
		
		assertNotNull(orders);
		assertTrue(orders.size() > 0 );

		for( Order order : orders ){
			MWOrder mOrder = (MWOrder)order;
			System.out.println(mOrder.getMid() + " <<<< ==== ==== ==== ====");
			System.out.println(mOrder.getCreateTime());
			System.out.println(mOrder.getCustomerName());
			System.out.println(mOrder.getCustomerPhonenumber());
			System.out.println(mOrder.getArea());
			System.out.println(mOrder.getCustomerAddress());
			System.out.println(mOrder.getRevenue());
			System.out.println(mOrder.getExpressId());
			System.out.println(mOrder.getExpressName());
		}
	}

}
