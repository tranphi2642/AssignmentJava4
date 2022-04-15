package com.fpoly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.fpoly.entity.User;
import com.fpoly.entity.Video;
import com.fpoly.utils.JpaUtils;

public class VideosDao {
	private EntityManager em = JpaUtils.getEntityManager();

	public VideosDao() {
	}
	
	@Override
	protected void finalize() throws Throwable {
		em.close(); // Close stream when ending Dao
	}
	
	public boolean create(Video video) {
		try {
			em.getTransaction().begin();
			em.persist(video);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean update(Video video) {
		try {
			em.getTransaction().begin();
			em.merge(video);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public boolean delete(String id_video) {
		try {
			Video video = findById(id_video);
			em.getTransaction().begin();
			em.remove(video);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public Video findById(String id_video) {
		Video video = em.find(Video.class, id_video);
		return video;
	}

	public List<Video> findAll(){
		String jpql = "select o from Video o";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		List<Video> list = query.getResultList();
		return list;
	}
	
	public List<Video> findTop8(){
		String jpql = "select o from Video o where o.id like 'ovideo%'";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		List<Video> list = query.getResultList();
		return list;
	}
	
	public List<Video> findFavorie(String userId){
		String jpql = "select o.video from Favorite o where o.user.id = ?0 ";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		query.setParameter(0,userId);
		List<Video> list = query.getResultList();
		return list;
	}
	

	public Video findByTitle(String title){
		String jpql = "SELECT DISTINCT o.video FROM Favorite o WHERE o.video.titile = ?0";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		query.setParameter(0,title);
		return query.getResultList().get(0);
	}
	
	public List<Video> findByKeywork(String keywork){
		String jpql = "SELECT DISTINCT o.video FROM Favorite o WHERE o.video.titile LIKE :keyword";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		query.setParameter(0,keywork);
		List<Video> list = query.getResultList();
		return list;
	}
	
	public static void main(String[] args) {
		VideosDao dao = new VideosDao();
		dao.findFavorie("phi");
	}

}