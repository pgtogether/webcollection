package com.dapeng.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dapeng.domain.Test;
import com.dapeng.domain.User;
import com.dapeng.service.bo.TestBO;

@Repository
public interface TestMapper {
	int deleteByPrimaryKey(String id);

	int insert(Test record);

	int insertSelective(Test record);

	Test selectByPrimaryKey(String id);

	List<TestBO> selectAll();

	int updateByPrimaryKeySelective(Test record);

	int updateByPrimaryKey(Test record);
	
	int insertUser(User user);
}