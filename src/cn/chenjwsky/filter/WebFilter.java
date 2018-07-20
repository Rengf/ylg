package cn.chenjwsky.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

import com.hd.model.sysUser;

public class WebFilter extends OncePerRequestFilter {

	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		String pathurl = request.getServletPath();
		sysUser sysuser = (sysUser) request.getSession().getAttribute("UserInfo");
		filterChain.doFilter(request, response);  

		/*if(sysuser!=null || "login.do".equals(pathurl)){//说明用户已经登录  或  登录请求放过
			filterChain.doFilter(request, response);  
		}else{
			response.sendRedirect("login.jsp");
		}*/
		return ;
	}
	
}
