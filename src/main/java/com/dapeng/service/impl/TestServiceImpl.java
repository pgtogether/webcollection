package com.dapeng.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dapeng.dao.TestMapper;
import com.dapeng.domain.Test;
import com.dapeng.domain.User;
import com.dapeng.service.TestService;
import com.dapeng.service.bo.TestBO;

@Service
public class TestServiceImpl implements TestService {

	@Autowired
	private TestMapper testDao;

	@Override
	public int insertTest(TestBO bo) {
		Test test = new Test();
		test.setId(bo.getId());
		test.setName(bo.getName());
		return testDao.insert(test);
	}

	@Override
	public List<TestBO> selectTestList() {
		return testDao.selectAll();
	}

	@Override
	public int insertUser(User user) {
//		User userdto = new User();
//		userdto.setUser_name(user.getUser_name());
//		userdto.setUser_pwd(user.getUser_pwd());
//		userdto.setUser_email(user.getUser_email());
//		
		return  testDao.insertUser(null);
	}

}
