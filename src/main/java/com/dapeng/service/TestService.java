package com.dapeng.service;

import java.util.List;

import com.dapeng.service.bo.TestBO;

public interface TestService {
	int insertTest(TestBO bo);

	List<TestBO> selectTestList();
}
