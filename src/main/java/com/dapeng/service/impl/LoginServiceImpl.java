/**
 * 
 */
package com.dapeng.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dapeng.dao.LoginMapper;
import com.dapeng.domain.User;
import com.dapeng.service.LoginService;
import com.dapeng.service.bo.UserBO;

/**
 * @author lixf
 *
 */
@Service
public class LoginServiceImpl implements LoginService{

	 @Autowired
	 private LoginMapper loginDao;
	
	
	/* (non-Javadoc)
	 * @see com.dapeng.service.LoginService#login(com.dapeng.service.bo.UserBO)
	 * 登录操作
	 */
	@Override
	public int login(UserBO userBO) {
		User user = new User();
		user.setUsername(userBO.getUsername());
		user.setPassword(userBO.getPassword());
		return loginDao.login(user);
	}

}
