package com.fpoly.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpoly.entity.User;

@WebFilter({"/Assignment/sign-up","/Assignment/capnhaptaikhoan/*","/Assignment/trangyeuthich/*"})
public class AuthFilter implements HttpFilter {
	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		String uri = req.getRequestURI();
		User user = (User)req.getSession().getAttribute("user");
		String error="";
		if(user==null ) {//chua dang nhap
			error = resp.encodeURL("Vui long dang nhap");
		}else if(!user.getAdmin() && uri.contains("/Assignment/capnhaptaikhoan/" ) || uri.contains("/Assignment/trangyeuthich/") || uri.contains("/Assignment/capnhaptaikhoan/")){//kg phai admin//
			error = resp.encodeURL("Vui long dang nhap voi vai tro admin");
		}
		
		if(!error.isEmpty()) {// truy cap kg hop le
			req.getSession().setAttribute("securi", uri);
			resp.sendRedirect("/Assignment_Java4/views/dangnhap.jsp?error="+resp.encodeURL(error));
		}else {//truy cap hop le
			chain.doFilter(req, resp);
		}
				
	}
}
