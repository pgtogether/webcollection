/**   
* @Title: LoginController.java 
* @Package com.dapeng.controller 
* @Description: TODO(用一句话描述该文件做什么) 
* @author A18ccms A18ccms_gmail_com   
* @date 2015年11月12日 下午7:17:22 
* @version V1.0   
*/
package com.dapeng.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dapeng.commons.MD5;
import com.dapeng.controller.form.LoginForm;
import com.dapeng.service.LoginService;
import com.dapeng.service.bo.UserBO;

/**
 * 
 * 类的功能描述
 *
 * @Copyright: Copyright (c) 2015
 * @Company: J&&S工作室
 * @author J&&S jiangdp
 * @date 2015年11月12日 下午7:24:56
 * @version V1.0
 */
@Controller
@RequestMapping("/*")
public class LoginController extends BaseController{
	
	
	 @Autowired
	 private LoginService loginService;
	 
    /**
     * 登录页面
     * 
     * @param @return
     * @return String
     */
    @RequestMapping(value = "login", method = { RequestMethod.GET, RequestMethod.POST })
    public String index() {
        return "login";
    }
	 
	 
    /**
     * 登录页面动作
     * 
     * @param @return
     */
    @RequestMapping(value = "doLogin", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doLogin(LoginForm loginForm) {
    	UserBO userBO = new UserBO();
    	userBO.setUsername(loginForm.getUsername());
    	userBO.setPassword(MD5.MD5Encode(loginForm.getPassword()));
    	int count = loginService.login(userBO);
    	System.out.println(count);
    	if (count>0) {
    		 return ajaxSuccess();
		}else {
			return ajaxFail();
		}
    }
}
