package com.fpoly.servlet_ASM;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.fpoly.dao.UsersDao;
import com.fpoly.entity.User;

@WebServlet({"/Assignment/admin/indexUser","/Assignment/admin/editUser/*","/Assignment/admin/createUser"
	,"/Assignment/admin/updateUser","/Assignment/admin/deleteUser"})
public class editUser extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		UsersDao dao = new UsersDao();
		User user = new User();
		String uri = req.getRequestURI();
		
		if(uri.contains("editUser")) {
			String id = uri.substring(uri.lastIndexOf("/")+1);
			user = dao.findById(id);
		}else if(uri.contains("createUser")) {
			try {
				BeanUtils.populate(user, req.getParameterMap());
				dao.create(user);
				req.setAttribute("message", "Thêm mới thành công");
			}catch (Exception e) {
				req.setAttribute("message", "Thêm mới thất bại");
			}
		}else if(uri.contains("updateUser")) {
			try {
				BeanUtils.populate(user, req.getParameterMap());
				dao.update(user);
				req.setAttribute("message", "Cập nhật thành công");
			}catch (Exception e) {
				req.setAttribute("message", "Cập nhật thất bại");
			}
		}else if(uri.contains("deleteUser")) {
			try {
				String id = req.getParameter("id");
				dao.delete(id);
				req.setAttribute("message", "Xóa thành công");
			}catch (Exception e) {
				req.setAttribute("message", "Xóa thất bại");
			}
		}
		
		req.setAttribute("form", user);
		req.setAttribute("items", dao.findAll());
		
		req.getRequestDispatcher("/views/admin/quanlytaikhoan.jsp").forward(req, resp);
	}
	
}
