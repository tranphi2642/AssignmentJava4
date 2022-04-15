package com.fpoly.servlet_ASM;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/Assignment/admin/homeAdmin", "/Assignment/admin/quanlyvideo", "/Assignment/admin/quanlytaikhoan",
		"/Assignment/admin/thongke" })
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("homeAdmin")) {
			req.setAttribute("views", "/views/admin/trangchuadmin.jsp");
			this.doTrangChuAdmin(req, resp);
		} else if (uri.contains("quanlyvideo")) {
			req.setAttribute("views", "/views/admin/quanlyvideo.jsp");
			this.doQuanLyVideo(req, resp);
		} else if (uri.contains("quanlytaikhoan")) {
			req.setAttribute("views", "/views/admin/quanlytaikhoan.jsp");
			this.doQuanLyTaiKhoan(req, resp);
		} else if (uri.contains("thongke")) {
			req.setAttribute("views", "/views/admin/thongke.jsp");
			this.doThongKe(req, resp);
		}
	}

	protected void doTrangChuAdmin(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.getRequestDispatcher("/views/admin/admin.jsp").forward(req, resp);
	}

	protected void doQuanLyVideo(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.sendRedirect("http://localhost:8080/Assignment_Java4/Assignment/admin/indexVideo");
	}

	protected void doQuanLyTaiKhoan(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.sendRedirect("http://localhost:8080/Assignment_Java4/Assignment/admin/indexUser");
	}
	protected void doThongKe(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.sendRedirect("http://localhost:8080/Assignment_Java4/Assignment/admin/findAll");
	}

	
}
