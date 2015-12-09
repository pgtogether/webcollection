/**   
* @Title: RegisterController.java 
* @Package com.dapeng.controller 
* @Description: TODO(用一句话描述该文件做什么) 
* @author jiangdp
* @date 2015年11月12日 下午7:20:13 
* @version V1.0   
*/
package com.dapeng.controller;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dapeng.controller.form.RegistForm;
import com.dapeng.service.RegistService;
import com.dapeng.service.bo.UserBO;

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
public class RegisterController extends BaseController{
	
	@Autowired
	private RegistService registService;
	
	
	@RequestMapping("regist")
	public String name(){
		return "regist";
	}
	
	
	@RequestMapping(value = "doRegist", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public Map<String, Object> doRegist(RegistForm registForm) {
		System.out.println(registForm.getUsername()+"用户名...");
		UserBO userBO = new UserBO();
		userBO.setUsername(registForm.getUsername());
		userBO.setBirthday(new Date());
		userBO.setSex(registForm.getSex());
		userBO.setPhone(registForm.getPhone());
		userBO.setPswquestion(registForm.getPswquestion());
		userBO.setPswanswer(registForm.getPswanswer());
		userBO.setPassword(registForm.getPassword());
		userBO.setEmail(registForm.getEmail());
		
		int result = registService.registUser(userBO);
		
		if (result > 0) {
			return ajaxSuccess();
		} else {
			return ajaxFail();
		}
	}

}
