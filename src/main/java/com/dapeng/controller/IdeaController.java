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
import com.dapeng.controller.form.IdeaForm;
import com.dapeng.controller.form.LoginForm;
import com.dapeng.service.LoginService;
import com.dapeng.service.bo.UserBO;

/**
 * 
	用户反馈
 */
@Controller
@RequestMapping("/*")
public class IdeaController extends BaseController{
	
	
	 @Autowired
	 private LoginService loginService;
	 
    /**
     * 用户反馈页面
     * 
     * @param @return
     * @return String
     */
    @RequestMapping(value = "useridea", method = { RequestMethod.GET, RequestMethod.POST })
    public String useridea() {
        return "useridea";
    }
	 
	 
    /** 
     * 用户反馈动作
     * @param @return
     */
    @RequestMapping(value = "doIdea", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doIdea(IdeaForm ideaForm) {
    	
    	
    	int count = 0;
    	if (count>0) {
    		 return ajaxSuccess();
		}else {
			return ajaxFail();
		}
    }
}
