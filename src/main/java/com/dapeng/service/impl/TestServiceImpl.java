package com.dapeng.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dapeng.dao.TestMapper;
import com.dapeng.domain.Test;
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

}
