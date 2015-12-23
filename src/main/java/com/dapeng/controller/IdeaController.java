/**   
* @Title: LoginController.java 
* @Package com.dapeng.controller 
* @Description: TODO(用一句话描述该文件做什么) 
* @author A18ccms A18ccms_gmail_com   
* @date 2015年11月12日 下午7:17:22 
* @version V1.0   
*/
package com.dapeng.controller;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dapeng.controller.form.IdeaForm;
import com.dapeng.service.IdeaService;
import com.dapeng.service.bo.IdeaBO;

/**
 * 
	用户反馈
 */
@Controller
@RequestMapping("/*")
public class IdeaController extends UserSessionController{
	
	
	 @Autowired
	 private IdeaService ideaService;
	 
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
    public Map<String, Object> doIdea(IdeaForm ideaForm,HttpSession session) {
    	
    	IdeaBO ideaBO = new IdeaBO();
    	ideaBO.setUserid(getSessionUserId(session));
    	ideaBO.setIdeatitle(ideaForm.getIdeatitle());
    	ideaBO.setIdeacontent(ideaForm.getIdeacontent());
    	ideaBO.setIdeatime(new Date());
    	int count = ideaService.addUserIdea(ideaBO);
    	if (count>0) {
    		 return ajaxSuccess();
		}else {
			return ajaxFail();
		}
    }
}
