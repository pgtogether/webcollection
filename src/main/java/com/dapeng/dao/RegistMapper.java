/**
 * 
 */
package com.dapeng.dao;

import com.dapeng.domain.User;
import com.dapeng.service.bo.UserBO;

/**用户注册
 * @author lixf
 *
 */
public interface RegistMapper {
	int registUser(User user);
	
	int isUsernameExist(User user);
}
