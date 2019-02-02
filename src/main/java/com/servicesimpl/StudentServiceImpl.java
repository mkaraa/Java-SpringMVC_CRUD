package com.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.StudentDao;
import com.entities.Students;
import com.services.StudentServices;

@Service
public class StudentServiceImpl  implements StudentServices{

	@Autowired
	StudentDao studentDao;
	
	@Override
	public List<Students> list() {
		// TODO Auto-generated method stub
		return studentDao.list();
	}

	@Override
	public boolean delete(Students students) {
		// TODO Auto-generated method stub
		return studentDao.delete(students);
	}

	@Override
	public boolean update(Students students) {
		// TODO Auto-generated method stub
		return studentDao.update(students);
	}

	
}
