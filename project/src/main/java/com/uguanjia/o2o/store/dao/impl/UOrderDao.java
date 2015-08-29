package com.uguanjia.o2o.store.dao.impl;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.uguanjia.o2o.Order;
import com.uguanjia.o2o.store.controller.dto.OrderQueryCondition;
import com.uguanjia.o2o.store.dao.OrderDao;

@Repository("OrderDao")
public class UOrderDao extends SqlSessionDaoSupport implements OrderDao{
	
	@Inject
	@Named("sqlSessionFactoryBean")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	private OrderDao getProxy(){
		return getSqlSession().getMapper(OrderDao.class);
	}

	@Override
	public int queryOrderCountsByStore(OrderQueryCondition condition) {
		return getProxy().queryOrderCountsByStore(condition);
	}

	@Override
	public List<Order> queryOrdersByStore(OrderQueryCondition condition) {
		return getProxy().queryOrdersByStore(condition);
	}

}
