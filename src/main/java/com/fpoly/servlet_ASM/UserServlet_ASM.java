package com.fpoly.servlet_ASM;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fpoly.dao.UsersDao;
import com.fpoly.dao.VideosDao;
import com.fpoly.entity.Email;
import com.fpoly.entity.User;
import com.fpoly.entity.Video;
import com.fpoly.utils.SendMail;

@WebServlet({ "/Assignment/trangchu", "/Assignment/dangky", "/Assignment/dangnhap", "/Assignment/quenmatkhau",
				"/Assignment/trangchitiet","/Assignment/dangxuat" ,"/Assignment/timkiem"})
public class UserServlet_ASM extends HttpServlet {
	private static final long serialVersionUID = 1L;
	User user = new User();
	UsersDao dao = new UsersDao();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		String uri = req.getRequestURI();
		if (uri.contains("trangchu")) {
			this.doHome(req, resp);
		} else if (uri.contains("dangnhap")) {
			this.doSignIn(req, resp);
		} else if (uri.contains("dangky")) {
			this.doSignUp(req, resp);
		} else if (uri.contains("quenmatkhau")) {
			this.doForgotPass(req, resp);
		} else if (uri.contains("trangchitiet")) {
			this.doChiTiet(req, resp);
		} else if (uri.contains("dangxuat")) {
			HttpSession session = req.getSession();
			session. removeAttribute("user");
			req.getRequestDispatcher("/views/dangnhap.jsp").forward(req, resp);
		}else if (uri.contains("timkiem")) {
			this.doFindByKey(req, resp);
		}
	}

	protected void doHome(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		VideosDao videoDao = new VideosDao();
		req.setAttribute("video", videoDao.findAll());
		req.setAttribute("oldVideo", videoDao.findTop8());
		req.getRequestDispatcher("/views/trangchu.jsp").forward(req, resp);
	}

	protected void doSignIn(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			String id = req.getParameter("username");
			String pw = req.getParameter("password");
			try {
				user = dao.findById(id);
				if (!user.getPassword().equals(pw)) {
					req.setAttribute("message", "Sai mật khẩu!");
					req.getRequestDispatcher("/views/dangnhap.jsp").forward(req, resp);
				} else {
					req.setAttribute("message", "Đăng nhập thành công!");
					req.getSession().setAttribute("user", user);
					resp.sendRedirect("http://localhost:8080/Assignment_Java4/Assignment/layout_user");
				}
			} catch (Exception e) {
				req.setAttribute("message", "Sai tên đăng nhập!");
				req.getRequestDispatcher("/views/dangnhap.jsp").forward(req, resp);
			}
		} else {
			req.getRequestDispatcher("/views/dangnhap.jsp").forward(req, resp);
		}

	}

	protected void doSignUp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			String id = req.getParameter("username");
			String pw = req.getParameter("password");
			String fullname = req.getParameter("fullname");
			String email = req.getParameter("email");
			try {
				user.setId(id);
				user.setPassword(pw);
				user.setFullname(fullname);
				user.setEmail(email);
				dao.create(user);
				req.setAttribute("message", "Đăng ký thành công!");
				req.getRequestDispatcher("/views/dangnhap.jsp").forward(req, resp);
			} catch (Exception e) {
				req.setAttribute("message", "Đăng ký thất bại!");
				req.getRequestDispatcher("/views/dangky.jsp").forward(req, resp);
			}
		} else {
			req.getRequestDispatcher("/views/dangky.jsp").forward(req, resp);
		}
	}

	protected void doForgotPass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		String method = req.getMethod();
		if (method.contains("POST")) {
			try {
				String username = req.getParameter("username");
				String emailAddress = req.getParameter("email");
				System.out.println(username + " " + emailAddress);
				UsersDao dao = new UsersDao();
				User user = dao.findByUsernameAndEmail(username, emailAddress);
				if (user == null) {
					req.setAttribute("error", "Username or email are incorrect");
				} else {
					Email email = new Email();
					email.setForm("tiachop26042002@gmail.com");
					email.setFormPassword("tito26042002");
					email.setTo(emailAddress);
					email.setSubject("Forgot Password Function");
					StringBuilder sb = new StringBuilder();
					sb.append("Dear ").append(username).append("<br>");
					sb.append("You are used the forgot password function. <br> ");
					sb.append("Your password is <b>").append(user.getPassword()).append("</b>");
					sb.append("Regards<br>");
					sb.append("Administrator");
					email.setContent(sb.toString());
					SendMail.sendMail(email);
					req.setAttribute("message",
							"Email sent to the email Address" + " Please check and get your password");
				}
				req.setAttribute("user", user);
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("error", e.getMessage());
			}
		}
		req.getRequestDispatcher("/views/quenmatkhau.jsp").forward(req, resp);
	}
	
	protected void doChiTiet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		VideosDao videoDao = new VideosDao();
		String videoId = req.getParameter("id");
		Video video = videoDao.findById(videoId);
		req.setAttribute("video", video);
		req.setAttribute("oldVideo", videoDao.findTop8());
		req.getRequestDispatcher("/views/trangchitiet.jsp").forward(req, resp);
	}
	
	protected void doFindByKey(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		String methob = req.getMethod();
		if(methob.contains("POSt")) {
			String keywork = req.getParameter("keywork");
			VideosDao videoDao = new VideosDao();
			
			req.setAttribute("findKey",videoDao.findByKeywork(keywork));
		}
		req.getRequestDispatcher("/views/trangtimkiem.jsp").forward(req, resp);
	}
}
