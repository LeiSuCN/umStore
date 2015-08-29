package com.uguanjia.o2o.store.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.uguanjia.o2o.Order;
import com.uguanjia.o2o.Store;
import com.uguanjia.o2o.store.controller.dto.OrderQueryCondition;
import com.uguanjia.o2o.store.service.OrderService;

@Controller("StoreController")
@RequestMapping("/")
public class StoreController {
	
	@Inject
	@Named("OrderService")
	private OrderService orderService;
	
	@RequestMapping("/information")
	public ModelAndView viewStoreInformation(HttpServletRequest request){
		
		ControllerHelper.ViewOptions options = new ControllerHelper.ViewOptions();
		options.content = "store_info.ftl";
		
		ModelAndView mav = ControllerHelper.createModelAndView(options);
		
		Store store = ControllerHelper.getCurrentStore(request);
		mav.addObject("store", store);
		
		return mav;
	}

	
	/**
	 * 视图：门店订单列表
	 * @param request
	 * @param condition
	 * @return
	 */
	@RequestMapping("/orders")
	public ModelAndView viewStoreOrders(HttpServletRequest request
			, @ModelAttribute OrderQueryCondition condition){
		
		Store store = ControllerHelper.getCurrentStore(request);
		long storeId = store.getId();
		
		ModelAndView mav = ControllerHelper.createModelAndView("order_list.ftl");
		
		// 如果查询条件为null，则创建默认的查询条件
		if( condition == null ){
			condition = new OrderQueryCondition();
			// TODO 恢复默认条件
		}
		// 查询条件：无分页
		condition.setPageNo(-1);	
		// 分页大小
		condition.setPageSize(20);
		// 时间窗口
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		Date today = calendar.getTime();
		condition.setDateTo(sdf.format(today));
		calendar.add(Calendar.MONTH, -1);
		Date lastMonth = calendar.getTime();
		condition.setDateFrom(sdf.format(lastMonth));

		// 只能查询当前门店的订单
		condition.setStoreId(storeId);
		
		// result
		List<Order> orders =  orderService.queryOrders(condition);
		
		// 更新总页数
		int total = condition.getTotal();
		int pageSize = condition.getPageSize();
		int pages = total/pageSize;
		if( total%pageSize != 0 )pages++;
		
		mav.addObject("condition", condition);
		mav.addObject("pages", pages);
		mav.addObject("orders", orders);
		
		return mav;
	}

}
