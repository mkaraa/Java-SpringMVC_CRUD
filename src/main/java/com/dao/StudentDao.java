package com.dao;

import java.util.List;

import com.entities.Students;

public interface StudentDao {
	public List<Students> list();
	public boolean delete(Students students);
	public boolean update(Students students);
	
}
