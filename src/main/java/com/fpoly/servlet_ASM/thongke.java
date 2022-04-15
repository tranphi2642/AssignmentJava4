package com.fpoly.servlet_ASM;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpoly.dao.VideosDao;
import com.fpoly.entity.Favorite;
import com.fpoly.entity.Report;
import com.fpoly.entity.Video;
import com.fpoly.utils.JpaUtils;

@WebServlet({ "/Assignment/admin/findAll", "/Assignment/admin/findKey" })
public class thongke extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		System.out.println("================> Line 24: " + uri);

		if (uri.contains("findAll")) {
			doFindAll(req, resp);
		} else if (uri.contains("findKey")) {
			doFindKey(req, resp);
		}
	}

	protected void doFindAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EntityManager em = JpaUtils.getEntityManager();
		String methob = req.getMethod();
		if (methob.equalsIgnoreCase("get")) {
			String jpql = "select new Report(o.video.titile ,count(o.likeDate),max(o.likeDate),min(o.likeDate)) from Favorite o group by o.video.titile ";
			
			TypedQuery<Report> query = em.createQuery(jpql, Report.class);

			List<Report> list = query.getResultList();

			for (Report video : list) {
				System.out.println(video.getTitle());
			}

			req.setAttribute("video", list);
			req.getRequestDispatcher("/views/admin/thongke.jsp").forward(req, resp);
		} else
			req.getRequestDispatcher("/views/admin/thongke.jsp").forward(req, resp);
	}

	protected void doFindKey(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		EntityManager em = JpaUtils.getEntityManager();
		String methob = req.getMethod();
		if (methob.equalsIgnoreCase("post")) {
//			String jpql = "select new Report2(o.user.username ,o.user.fullname, o.user.email,o.likeDate) from Favorite o  ";
//			System.out.println("===============> Line 36");
//			TypedQuery<Report> query = em.createQuery(jpql, Report.class);
//			
//			List<Report> list = query.getResultList();
//			
//			for (Report video : list) {
//				System.out.println(video.getTitle());
//			}
//			
//			req.setAttribute("video1", list );
			if (req.getParameter("title") != null) {
				VideosDao dao = new VideosDao();
				Video video = dao.findByTitle(req.getParameter("title").toString());
				if(video == null) video = new Video();
				req.setAttribute("phiconga", video);
				for (Favorite f : video.getFavorites()) {
					System.out.println("===============> "+f.getLikeDate());
				}
				System.out.println("===============> Line 36: Video title"+video.getTitile());
			}

			req.getRequestDispatcher("/views/admin/thongke.jsp").forward(req, resp);
		} else
			req.getRequestDispatcher("/views/admin/thongke.jsp").forward(req, resp);
	}
}
