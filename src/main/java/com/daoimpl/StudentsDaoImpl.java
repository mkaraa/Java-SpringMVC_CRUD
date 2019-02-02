package com.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dao.StudentDao;
import com.entities.Students;

@Repository
@Transactional
public class StudentsDaoImpl implements StudentDao{

	@Autowired
	SessionFactory session;
	
	@Override
	public List<Students> list() {
		return session.getCurrentSession().createQuery("from Students").list();
	}

	@Override
	public boolean delete(Students students) {
		session.getCurrentSession().delete(students);
		return false;
	}

	@Override
	public boolean update(Students students) {
		
		try {
			session.getCurrentSession().saveOrUpdate(students);
		} catch (Exception e) {
			return false;
		}
		return true;
		
	}

}
