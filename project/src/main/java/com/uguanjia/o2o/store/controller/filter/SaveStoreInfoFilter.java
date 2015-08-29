package com.uguanjia.o2o.store.controller.filter;

import static com.uguanjia.o2o.store.controller.ControllerHelper.SESSION_KEY_STORE;
import static com.uguanjia.o2o.store.controller.ControllerHelper.getCurrentOperator;

import java.io.IOException;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.filter.GenericFilterBean;

import com.uguanjia.o2o.Operator;
import com.uguanjia.o2o.Store;
import com.uguanjia.o2o.StoreStatus;
import com.uguanjia.o2o.store.dao.StoreDao;

/*******************************************
 * @CLASS:QueryStoreInfoFilter
 * @DESCRIPTION:	
 * @VERSION:v1.0
 * @DATE:2015 2 13 9:46:14
 *******************************************/
public class SaveStoreInfoFilter extends GenericFilterBean{
	
	private final Logger logger = LogManager.getLogger(getClass());
	
	@Inject
	@Named("StoreDao")
	private StoreDao storeDao;
	
	private boolean saveStoreInfo(HttpServletRequest request,ServletResponse response) throws ServletException, IOException{
		
		// 如果session中不存在STORE_INFO
		// ,则为角色为STORE的用户查询门店信息
		if( request.getSession() != null && 
				request.getSession().getAttribute(SESSION_KEY_STORE) == null ){
			
			Operator operator = getCurrentOperator();
			
			if( operator != null ){
				String username = operator.getUsername();
				if( !StringUtils.isEmpty(username) ){
					Store store = this.storeDao.queryStoreByPhonenumber(username);
					if( store != null ){
						logger.debug("用户" + username + "的门店ID为" + store.getId() );
						request.getSession().setAttribute(SESSION_KEY_STORE, store);
					} else{
						logger.debug("用户" + username + "没有门店信息");
					}
				}
			}
		}
		
		// 门店异常状态
		if( request.getSession().getAttribute(SESSION_KEY_STORE) != null ){
			Store store = (Store)request.getSession().getAttribute(SESSION_KEY_STORE);
			// 当store id小于1000000000l时，说明该门店正处于待审核状态
			if( store.getId() < 1000000000l)
			{
				HttpServletRequest httpReq = (HttpServletRequest) request;
				
				// 待审核状态
				if( StoreStatus.APPROVAL == store.getStatus() )
				{
					httpReq.getRequestDispatcher("/WEB-INF/jsp/public/register_wait.jsp").forward(request, response);
				}
				// 驳回
				else if( StoreStatus.REJECT == store.getStatus() )
				{
					// 获取驳回理由
					// httpReq.setAttribute("error_msg", activity.getComment());
					
					httpReq.getRequestDispatcher("/WEB-INF/jsp/public/register_reject.jsp").forward(request, response);
				}
				
				return false;
			}
		}
		
		return true;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		if( saveStoreInfo((HttpServletRequest)request, response) ){
			chain.doFilter(request, response);
		}
	}

	public void setStoreDao(StoreDao storeDao) {
		this.storeDao = storeDao;
	}
}

