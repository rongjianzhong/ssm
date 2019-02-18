package com.zking.ssm.filter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
public class urlFilter implements Filter{
	private String encoding = "UTF-8";// 默认字符集
	
	//构造方法
	public urlFilter() {
		super();
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		ObjectMapper mapper = new ObjectMapper();
		
		String uri = req.getRequestURI();
		String path  = session.getServletContext().getContextPath();
		uri = uri.replace(path, "");
		/** 请求类型（后缀） */
		String hou = "";
		try {
			String a = uri.substring(uri.lastIndexOf("/")+1);
			hou = a.substring(a.lastIndexOf(".")+1);
	 	} catch (Exception e) {
	 		e.printStackTrace();
		}
    	/** 数据库中存储的是相对路径*/
    	uri = uri.substring(1);
    	
    	boolean isExcludedPage = false;
		Object sets = req.getServletContext().getAttribute("ModuleSet");//获取存进去的所有url功能路径
		if(null != sets) {//如果不为空
			Set<String> set = (Set<String>) sets;
			if(!set.contains(uri)) {
				isExcludedPage = true;
				System.out.println("【公共权限放行】\t"+uri);
			}
		}else {
			isExcludedPage = true;
		}
		
        if(isExcludedPage) {
        	//不拦截列表中
        	chain.doFilter(req, res);
        }else {
        	//权限拦截器
			if(session.getAttribute("user")!=null) {
				//已登录
	        	Set<String> set = (Set<String>) session.getAttribute("set");//获取用户的权限
	    		if(set.contains(uri)) {//如果用户的权限包含该请求的权限则放行
	    			System.err.println("【用户权限放行】\t"+uri);
	    			chain.doFilter(req, res);
	    		}else {//否则拦截
	    			System.err.println("    !权限不足:   "+uri);
	    			System.err.print  ("    !权限列表：");for (String string : set) System.out.print(string+"   " );
	    			System.out.println();
	    			Map<String,Object> map = new HashMap<String,Object>();
					map.put("data",null);
					map.put("count",0);
					map.put("code",0);
	    			map.put("success", false);
	    			map.put("message", "权限不足,请联系管理员!");
	    			//权限不足
//	    			res.sendRedirect(path+"/permission/error2.html");
	    			mapper.writeValue(res.getOutputStream(), map);
	    		}
			}else {
				//未登录
				System.out.println("    未登录：\t    即将跳转到登录页面...");
				res.sendRedirect(path+"/login/login.jsp");
			}
        }
	}
	
	//当服务启动时初始化该方法(只初始化一次)
	public void init(FilterConfig filterConfig) throws ServletException {
		String s = filterConfig.getInitParameter("encoding");// 读取web.xml文件中配置的字符集
		if (null != s && !s.trim().equals("")) {
			this.encoding = s.trim();
		}	
	}
	
	
}
