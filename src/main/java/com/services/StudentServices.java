package com.services;

import java.util.List;

import com.entities.Students;

public interface StudentServices {
	public List<Students> list();
	public boolean delete(Students students);
	public boolean update(Students students);
}
