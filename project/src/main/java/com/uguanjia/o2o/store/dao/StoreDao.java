package com.uguanjia.o2o.store.dao;

import com.uguanjia.o2o.Store;

/**
 * 门店信息查询DAO
 * @author 宿磊
 *
 */
public interface StoreDao {
	
	/**
	 * 根据ID查询门店信息
	 * @param id
	 * @return
	 */
	public Store queryStoreById(long id);
	
	/**
	 * 根据电话号码查询门店信息
	 * @param id
	 * @return
	 */
	public Store queryStoreByPhonenumber(String phonenumber);

}
