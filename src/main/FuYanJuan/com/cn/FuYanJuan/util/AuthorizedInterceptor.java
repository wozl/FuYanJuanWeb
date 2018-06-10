package com.cn.FuYanJuan.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * @author LQ & FuYanJuan
 *
 *请求权限拦截器 
 */
public class AuthorizedInterceptor implements HandlerInterceptor{
	
	private static final String[] LOGIN_URI={"/login","/loginCheck","404.html"};

	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object Handler) throws Exception{
		boolean flag=false;
		String servletPath=request.getServletPath();
		for(String path:LOGIN_URI){
			if(servletPath.contains(path)){
				flag=true;
				break;
			}
		}
		if(!flag){
			String name=(String)request.getSession().getAttribute("user");
			if(name==null){
				request.setAttribute("massage", "请您先登录后再查看");
				request.getRequestDispatcher("/login").forward(request,response);
			}else{
				flag=true;
			}
		}
		
		return flag;
	}
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	

}
