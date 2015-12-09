package com.dapeng.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dapeng.dao.RegistMapper;
import com.dapeng.domain.User;
import com.dapeng.service.RegistService;
import com.dapeng.service.bo.UserBO;
/**
 * 用户注册impl
 * @author lixf
 *
 */
@Service
public class RegistServiceImpl implements RegistService {

	@Autowired
	private RegistMapper registDao;

	@Override
	public int registUser(UserBO userBO) {
		User user = new User();
		user.setUsername(userBO.getUsername());
		user.setPassword(userBO.getPassword());
		user.setPhone(userBO.getPhone());
		user.setSex(userBO.getSex());
		user.setBirthday(userBO.getBirthday());
		user.setPswquestion(userBO.getPswquestion());
		user.setPswanswer(userBO.getPswanswer());
		user.setEmail(userBO.getEmail());
		return  registDao.registUser(user);
	}


}
