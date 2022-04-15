package com.fpoly.servlet_ASM;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpoly.dao.FavoriteDao;
import com.fpoly.dao.UsersDao;
import com.fpoly.dao.VideosDao;
import com.fpoly.entity.Email;
import com.fpoly.entity.Favorite;
import com.fpoly.entity.User;
import com.fpoly.entity.Video;
import com.fpoly.utils.SendMail;

@WebServlet({"/Assignment/likeVideo","/Assignment/shareVideo"})
public class likeShareServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		String uri = req.getRequestURI();
		if(uri.contains("likeVideo")) {
			this.doLikeVideo(req,resp);
		}else if(uri.contains("shareVideo")) {
			this.doShareVideo(req,resp);
		}
	}
	
	protected void doLikeVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		User us = (User) req.getSession().getAttribute("user");
		String videoId = req.getParameter("id");
		
		VideosDao videoDao = new VideosDao();
		Video video = videoDao.findById(videoId);
		
		new FavoriteDao().create(new Favorite(us,video,new Date()));
		resp.sendRedirect("http://localhost:8080/Assignment_Java4/Assignment/trangchitiet?id="+videoId);
	}
	
	protected void doShareVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		String method = req.getMethod();
		if(method.contains("POST")) {
			try {
				User us = (User) req.getSession().getAttribute("user");
				String emailAddress = req.getParameter("email");
				UsersDao dao = new UsersDao();
				User user = dao.findById(us.getId());
				String videoId = req.getParameter("id");
				if (user == null) {
					req.setAttribute("error", "Username are incorrect");
				} else {
					Email email = new Email();
					email.setForm("tiachop26042002@gmail.com");
					email.setFormPassword("tito26042002");
					email.setTo(emailAddress);
					email.setSubject("Forgot Password Function");
					StringBuilder sb = new StringBuilder();
					sb.append("Dear ").append(us.getId()).append("<br>");
					sb.append("You are using the share video function. <br> ");
					sb.append("Your link video is <b>").append("http://localhost:8080/Assignment_Java4/Assignment/trangchitiet?id="+videoId).append("</b>");
					email.setContent(sb.toString());
					SendMail.sendMail(email);
					req.setAttribute("message","Email sent to the email Address");
					resp.sendRedirect("http://localhost:8080/Assignment_Java4/Assignment/trangchitiet?id="+videoId);
				}
				req.setAttribute("like", user);
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("error", e.getMessage());
			}
		}
	}
}
