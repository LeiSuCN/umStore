package com.uguanjia.o2o.store.config;
/*******************************************
 * @CLASS:Configration
 * @DESCRIPTION:	
 * @VERSION:v1.0
 *******************************************/
public interface Configration {
	
	public void refresh();
	
	public String getName();
	
	public Object getValue(String cfgName);

}

