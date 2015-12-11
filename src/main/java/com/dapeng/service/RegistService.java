package com.dapeng.service;

import com.dapeng.service.bo.UserBO;

public interface RegistService {
	/**
	 * 注册用户
	 * @param userBO
	 * @return
	 */
	int registUser(UserBO userBO);
	
	/**
	 * 检测用户是否存在
	 * @param userBO
	 * @return
	 */
	int isUsernameExist(UserBO userBO);
}
