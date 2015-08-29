package com.uguanjia.o2o.store.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.commons.lang3.math.NumberUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.uguanjia.o2o.Order;
import com.uguanjia.o2o.store.config.Configration;
import com.uguanjia.o2o.store.controller.dto.MWOrder;
import com.uguanjia.o2o.store.controller.dto.OrderQueryCondition;
import com.uguanjia.o2o.store.service.OrderService;

@Service("OrderService")
public class MOrderService implements OrderService{
	
	private final Logger logger = LogManager.getLogger(getClass());
	
	@Inject
	@Named("uProps")
	private Configration uProps;

	@Override
	public List<Order> queryOrders(OrderQueryCondition condition) {
		
		long storeId = condition.getStoreId();
		
		if( logger.isInfoEnabled() ){
			logger.info("begin to query orders for " + storeId 
					+ ", pageNo is " + condition.getPageNo() 
					+ ", pageSize is " + condition.getPageSize());
		}
		
		List<Order> orders = null;
		
		try(CloseableHttpClient httpclient = HttpClients.createDefault()){
			
			HttpPost post = this.bulidHttpPostByQueryCondition(condition);
			
			orders = httpclient.execute(post, new OrderListResponseHandler());
			
		} catch (IOException e) {
			logger.error(e);
		}
		
		return orders;
	}
	
	private HttpPost bulidHttpPostByQueryCondition(OrderQueryCondition condition) throws UnsupportedEncodingException{
		
		List<NameValuePair> params = new ArrayList<>();
		// 门店ID
		params.add(new BasicNameValuePair("psid", String.valueOf(condition.getStoreId())));
		// 分页大小
		params.add(new BasicNameValuePair("leng", String.valueOf(Integer.MAX_VALUE)));
		// 数据起始位置
		params.add(new BasicNameValuePair("start", "0"));
		HttpEntity entity = new UrlEncodedFormEntity(params);
		
		
		
		
		String urlMwOrderList = uProps.getValue("mw.api.address").toString() + uProps.getValue("mw.api.order.list").toString();
		HttpPost post = new HttpPost(urlMwOrderList);
		post.setEntity(entity);
		return post;
	}
	
	class OrderListResponseHandler implements ResponseHandler<List<Order>>{

		@Override
		public List<Order> handleResponse(HttpResponse response) throws ClientProtocolException, IOException {
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			List<Order> orders = new ArrayList<>();
			HttpEntity entity = response.getEntity();
			try( InputStream is = entity.getContent() ){
				JsonFactory jf = new JsonFactory();
				JsonParser jp = jf.createJsonParser(is);
				jp.nextToken();//START_ARRAY
				while( jp.nextToken() == JsonToken.START_OBJECT ){
					
					MWOrder order = new MWOrder();
					
					while (jp.nextToken() != JsonToken.END_OBJECT) {
						
						String fieldname = jp.getCurrentName();
						jp.nextToken(); // move to value
						String value = jp.getText();
						switch (fieldname) {
						case "id":
							order.setMid(value);
							break;
						case "customer_name":
							order.setCustomerName(value);
							break;
						case "customer_phone":
							order.setCustomerPhonenumber(value);
							break;
						case "customer_address":
							order.setCustomerAddress(value);
							break;
						case "customer_area_id":
							order.setArea(NumberUtils.toInt(value, 0));
							break;
						case "ord_time":
							try {
								order.setCreateTime(sdf.parse(value));
							} catch (ParseException e) {
								logger.error(e);;
							}
							break;
						case "cost_total":
							order.setRevenue(NumberUtils.toInt(value, 0)/100);
							break;
						
						case "status":
							order.setStatus(NumberUtils.toInt(value, 0));
							break;
						
						case "express_name":
							order.setExpressName(value);
							break;

						case "express_id":
							order.setExpressId(value);
							break;

						default:
							break;
						}
					}
					
					orders.add(order);
				}
				jp.close();
			}
			return orders;
		}
		
	}

}
