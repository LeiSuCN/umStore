package com.uguanjia.o2o.store.dao.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.uguanjia.o2o.Store;
import com.uguanjia.o2o.store.dao.StoreDao;

@Repository("StoreDao")
public class UStoreDao extends SqlSessionDaoSupport implements StoreDao{
	
	@Inject
	@Named("sqlSessionFactoryBean")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	private StoreDao getProxy(){
		return getSqlSession().getMapper(StoreDao.class);
	}

	@Override
	public Store queryStoreById(long id) {
		return getProxy().queryStoreById(id);
	}

	@Override
	public Store queryStoreByPhonenumber(String phonenumber) {
		return getProxy().queryStoreByPhonenumber(phonenumber);
	}
}
