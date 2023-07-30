
package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

@Component
public class AuthCheckFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String re = ((HttpServletRequest) request).getRequestURI();
		String user = null;
		if (re.contains("admin") || re.contains("swagger-ui")) {
			HttpSession session = ((HttpServletRequest) request).getSession();
			try {
				user = (String)session.getAttribute("userType");
				
				if (re.endsWith("/forgotPassword") || re.endsWith("loginForm") || re.endsWith("logoutAdmin")) {
					chain.doFilter(request, response);
				} 
				else if (user != null && user.equals("ADMIN")) {
					chain.doFilter(request, response);
					
				}
				else {
					session.setAttribute("msg", "You are not authorised to access this link !");
					HttpServletResponse r = ((HttpServletResponse)response);
					r.sendRedirect("/admin/loginForm");
			}
			} 
			catch (Exception e) {
				e.printStackTrace();
				session.setAttribute("msg", "Please Login!!");
				request.getRequestDispatcher("loginForm").forward(request, response);
			}
		} 
		else {
			chain.doFilter(request, response);
		}
	}
}
