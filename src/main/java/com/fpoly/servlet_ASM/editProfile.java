package com.fpoly.servlet_ASM;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpoly.dao.UsersDao;
import com.fpoly.dao.VideosDao;
import com.fpoly.entity.User;

@WebServlet({"/Assignment/capnhaptaikhoan","/Assignment/doimatkhau","/Assignment/layout_user","/Assignment/trangyeuthich"})
public class editProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	User user = new User();
	UsersDao dao = new UsersDao();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		String uri = req.getRequestURI();
		if(uri.contains("capnhaptaikhoan")) {
			this.doCapNhap(req,resp);
		}else if(uri.contains("doimatkhau")) {
			this.doDoiMatKhau(req,resp);
		}else if(uri.contains("layout_user")) {
			this.doLayoutUser(req, resp);
		}else if(uri.contains("trangyeuthich")) {
			this.doYeuThich(req, resp);
		}
	}
	
	protected void doCapNhap(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8"); 
		
		User user = (User) req.getSession().getAttribute("user"); 
		String method = req.getMethod();
		if(method.contains("POST")) {
			try {
				String id = req.getParameter("username");
				String pw = req.getParameter("password");
				String fullname = req.getParameter("fullname");
				String email = req.getParameter("email");
				user.setId(id);
				user.setPassword(pw);
				user.setFullname(fullname);
				user.setEmail(email);
				
				dao.update(user);
				req.setAttribute("user", user);
				req.setAttribute("message", "Cập nhập tài khoản thành công!");
				req.getRequestDispatcher("/views/capnhaptaikhoan.jsp").forward(req, resp);
			} catch (Exception e) {
				req.setAttribute("message", "Cập nhập tài khoản thất bại!");
				req.getRequestDispatcher("/views/capnhaptaikhoan.jsp").forward(req, resp);
				e.printStackTrace();
			}
		}else {
			req.getRequestDispatcher("/views/capnhaptaikhoan.jsp").forward(req, resp);
		}
		
	}
	
	protected void doDoiMatKhau(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		User user = (User) req.getSession().getAttribute("user"); 
		String method = req.getMethod();
		if(method.contains("POST")) {
			String pw = req.getParameter("password");
			String newpass = req.getParameter("new-pass");
			String confirmpass = req.getParameter("confirm-pass");
			try {
				if (!user.getPassword().equals(pw) && pw.equals(newpass) && newpass.equals(confirmpass)) {
					req.setAttribute("message", "Sai mật khẩu!");
					req.getRequestDispatcher("/views/doimatkhau.jsp").forward(req, resp);
				} else {
					user.setId(user.getId());
					user.setPassword(newpass);
					user.setFullname(user.getFullname());
					user.setEmail(user.getEmail());
					
					dao.update(user);
					req.setAttribute("user", user);
					req.setAttribute("message", "Đổi mật khẩu thành công!");
					req.getRequestDispatcher("/views/doimatkhau.jsp").forward(req, resp);
				}
			} catch (Exception e) {
				req.setAttribute("message", "Đổi mật khẩu thất bại!");
				req.getRequestDispatcher("/views/doimatkhau.jsp").forward(req, resp);
				e.printStackTrace();
			}
		}else {
			req.getRequestDispatcher("/views/doimatkhau.jsp").forward(req, resp);
		}
	}
	
	protected void doLayoutUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		VideosDao videoDao = new VideosDao();
		req.setAttribute("video", videoDao.findAll());
		req.setAttribute("oldVideo", videoDao.findTop8());
		req.getRequestDispatcher("/views/layout_user.jsp").forward(req, resp);
	}
	
	protected void doYeuThich(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		VideosDao videoDao = new VideosDao();
	
		User us = (User) req.getSession().getAttribute("user");
		System.out.println(us.getId());
	
		req.setAttribute("favorite", videoDao.findFavorie(us.getId()));
	
		req.getRequestDispatcher("/views/trangyeuthich.jsp").forward(req, resp);
	}
}
