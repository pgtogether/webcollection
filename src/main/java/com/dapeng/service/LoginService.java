/**
 * 
 */
package com.dapeng.service;

import com.dapeng.service.bo.UserBO;

/**
 * @author lixf
 *
 */
public interface LoginService {
	/**
	 * 登录操作
	 * @param userBO
	 * @return
	 */
	int login(UserBO userBO);
}
