package com.fpoly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.fpoly.entity.User;
import com.fpoly.utils.JpaUtils;

public class UsersDao {
	private EntityManager em = JpaUtils.getEntityManager();

	public UsersDao() {
	}

	@Override
	protected void finalize() throws Throwable {
		em.close(); // Close stream when ending Dao
	}

	public boolean create(User user) {
		try {
			em.getTransaction().begin();
			em.persist(user);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public boolean update(User user) {
		try {
			em.getTransaction().begin();
			em.merge(user);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public boolean delete(String username) {
		try {
			User user = findById(username);
			em.getTransaction().begin();
			em.remove(user);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public User findById(String username) {
		User user = em.find(User.class, username);
		return user;
	}

	public List<User> findAll() {
		String jpql = "select o from User o";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		List<User> list = query.getResultList();
		return list;
	}

	public User findByUsernameAndEmail(String username, String email) {
		EntityManager em = JpaUtils.getEntityManager();
		String jpql = "select o from User o where o.id=:username and o.email = :email";
		try {
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter("username", username);
			query.setParameter("email", email);
			return query.getSingleResult();
		} finally {
			em.close();
		}
	}
}