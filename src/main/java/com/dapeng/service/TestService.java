package com.dapeng.service;

import java.util.List;

import com.dapeng.domain.User;
import com.dapeng.service.bo.TestBO;

public interface TestService {
	int insertTest(TestBO bo);
	int insertUser(User user);
	List<TestBO> selectTestList();
}
