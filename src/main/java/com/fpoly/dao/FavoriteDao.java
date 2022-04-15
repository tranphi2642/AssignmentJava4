package com.fpoly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.fpoly.entity.Favorite;
import com.fpoly.entity.Video;
import com.fpoly.utils.JpaUtils;

public class FavoriteDao {
	private EntityManager em = JpaUtils.getEntityManager();

	public FavoriteDao() {
	}

	@Override
	protected void finalize() throws Throwable {
		em.close(); // Close stream when ending Dao
	}

	public boolean create(Favorite favorite) {
		try {
			em.getTransaction().begin();
			em.persist(favorite);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public boolean update(Favorite favorite) {
		try {
			em.getTransaction().begin();
			em.merge(favorite);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public Favorite findById(int id) {
		Favorite favorite = em.find(Favorite.class, id);
		return favorite;
	}

	public boolean delete(int id) {
		try {
			Favorite favorite = findById(id);
			em.getTransaction().begin();
			em.remove(favorite);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}
	
	
}
