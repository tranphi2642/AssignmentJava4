package com.fpoly.servlet_ASM;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.fpoly.dao.UsersDao;
import com.fpoly.dao.VideosDao;
import com.fpoly.entity.User;
import com.fpoly.entity.Video;

@WebServlet({"/Assignment/admin/indexVideo","/Assignment/admin/editVideo/*","/Assignment/admin/createVideo"
	,"/Assignment/admin/updateVideo","/Assignment/admin/deleteVideo"})
public class editVideo extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		VideosDao dao = new VideosDao();
		Video video = new Video();
		String uri = req.getRequestURI();
		
		if(uri.contains("editVideo")) {
			String id = uri.substring(uri.lastIndexOf("/")+1);
			video = dao.findById(id);
		}else if(uri.contains("createVideo")) {
			try {
				BeanUtils.populate(video, req.getParameterMap());
				dao.create(video);
				req.setAttribute("message", "Thêm mới thành công");
			}catch (Exception e) {
				req.setAttribute("message", "Thêm mới thất bại");
			}
		}else if(uri.contains("updateVideo")) {
			try {
				String a = req.getParameter("poster");
				System.out.println(a);
				BeanUtils.populate(video, req.getParameterMap());
				dao.update(video);
				req.setAttribute("message", "Cập nhật thành công");
			}catch (Exception e) {
				req.setAttribute("message", "Cập nhật thất bại");
			}
		}else if(uri.contains("deleteVideo")) {
			try {
				String id = req.getParameter("id");
				dao.delete(id);
				req.setAttribute("message", "Xóa thành công");
			}catch (Exception e) {
				req.setAttribute("message", "Xóa thất bại");
			}
		}
		
		req.setAttribute("form", video);
		req.setAttribute("items", dao.findAll());
		
		req.getRequestDispatcher("/views/admin/quanlyvideo.jsp").forward(req, resp);
	}
	
}
