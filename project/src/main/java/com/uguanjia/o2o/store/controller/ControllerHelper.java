package com.uguanjia.o2o.store.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.servlet.ModelAndView;

import com.uguanjia.o2o.Operator;
import com.uguanjia.o2o.Store;

/**
 * Controller帮助类
 * @author 宿磊
 */
public class ControllerHelper {
	
	/** session: 门店信息 */
	public static String SESSION_KEY_STORE = "STORE_INFO";
	
	/**
	 * 生成默认使用main.ftl的ModelAndView
	 * @return
	 */
	public static ModelAndView createModelAndView(ViewOptions options){
		ModelAndView mv = new ModelAndView("/main");
		
		if( options != null ){
			mv.addObject("content", options.content);
		}
		
		return mv;
	}
	
	/**
	 * 生成默认使用main.ftl的ModelAndView
	 * @return
	 */
	public static ModelAndView createModelAndView(String content){
		ControllerHelper.ViewOptions options = new ControllerHelper.ViewOptions();
		options.content = content;
		
		return ControllerHelper.createModelAndView(options);
	}
	
	/**
	 * 获取当前的操作人员
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Operator getCurrentOperator() {
		Operator operator = null;
		
		if( SecurityContextHolder.getContext() == null || 
				SecurityContextHolder.getContext().getAuthentication() == null || 
				SecurityContextHolder.getContext().getAuthentication().getPrincipal() == null ){
			return operator;
		}
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if( principal instanceof UserDetails ){
			operator = new Operator();
			UserDetails userDetails = (UserDetails)principal;
			operator.setUsername(userDetails.getUsername());;
		} else{
			return operator;
		}
		
		// 获取权限
		Collection<GrantedAuthority> authorities = 
				(Collection<GrantedAuthority>)SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		
		if( authorities != null ){
			List<String> roles = new ArrayList<>(authorities.size());
			for( GrantedAuthority gauthority : authorities ){
				roles.add(gauthority.getAuthority());
			}
			
			operator.setRoles(roles);
		}
		
		return operator;
	}
	
	/**
	 * 获取当前的操作人员
	 * @return
	 */
	public static Store getCurrentStore(HttpServletRequest request) {
		
		if( request == null || request.getSession() == null ){
			return null;
		} else{
			return (Store)request.getSession().getAttribute(SESSION_KEY_STORE);
		}
	}
	
	public static class ViewOptions{
		
		public String content = "empty.ftl";
		
	}

}
