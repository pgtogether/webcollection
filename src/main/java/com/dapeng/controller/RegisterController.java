/**   
* @Title: RegisterController.java 
* @Package com.dapeng.controller 
* @Description: TODO(用一句话描述该文件做什么) 
* @author jiangdp
* @date 2015年11月12日 下午7:20:13 
* @version V1.0   
*/
package com.dapeng.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dapeng.domain.User;
import com.dapeng.service.TestService;

/**
 * 
 * 类的功能描述
 *
 * @Copyright: Copyright (c) 2015
 * @Company: J&&S工作室
 * @author J&&S jiangdp
 * @date 2015年11月12日 下午7:25:49
 * @version V1.0
 */
@Controller
@RequestMapping("/*")
public class RegisterController {
	
	@Autowired
	private TestService testService;
	
	
	@RequestMapping("userRegist")
	public String name(){
		return "userRegist";
	}
	
	
	@RequestMapping(value = "doUserRegist", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public String doUserRegist(User user) {
/*		System.out.println(user.getUser_name()+"用户名...");
		User userdto = new User();
		userdto.setUser_name(user.getUser_name());
		userdto.setUser_pwd(user.getUser_pwd());
		userdto.setUser_email(user.getUser_email());
		int result = testService.insertUser(userdto);
		
		if (result > 0) {
			return "OK";
		} else {
			return "NG";
		}*/
		return null;
	}

}
