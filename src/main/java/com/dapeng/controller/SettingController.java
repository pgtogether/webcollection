/**
 * @Title: IndexController.java
 * @Package com.dapeng.controller
 * @Description: TODO
 * @Copyright: Copyright (c) 2015
 * @Company: J&&S工作室
 *  
 * @author J&&S jiangdp
 * @date 2015年11月12日 下午7:34:32
 * @version V1.0
 */
package com.dapeng.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dapeng.controller.form.SetCategoryPswForm;
import com.dapeng.service.UserInfoService;
import com.dapeng.service.bo.UserInfoBO;

/**
 * 各种设置Controller
 * 
 * @Copyright: Copyright (c) 2015
 * @Company: J&&S工作室
 * @author J&&S jiangdp
 * @date 2015年11月12日 下午7:34:32
 * @version V1.0
 */
@Controller
@RequestMapping("setting/*")
public class SettingController extends UserSessionController {

    @Autowired
    private UserInfoService userInfoService;

    @RequestMapping(value = "home", method = { RequestMethod.GET, RequestMethod.POST })
    public String home(Model model, HttpSession session) {
        return "setting/home";
    }

    /**
     * 安全中心页
     */
    @RequestMapping(value = "security", method = { RequestMethod.GET, RequestMethod.POST })
    public String security(Model model, HttpSession session) {
        return "setting/security";
    }

    /**
     * 设置分类密码页
     */
    @RequestMapping(value = "security/setcategorypsw", method = { RequestMethod.GET, RequestMethod.POST })
    public String setcategorypsw(Model model, HttpSession session) {
        return "setting/setcategorypsw";
    }

    /**
     * 设置分类密码
     */
    @RequestMapping(value = "security/doSetcategorypsw", method = { RequestMethod.GET, RequestMethod.POST })
    public Map<String, Object> doSetcategorypsw(@Valid
    SetCategoryPswForm form, BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
            return ajaxFail(result.getAllErrors().get(0).getDefaultMessage());
        }

        String categorypsw = form.getCategorypsw();
        String confirmcategorypsw = form.getConfirmcategorypsw();

        if (!categorypsw.equals(confirmcategorypsw)) {
            return ajaxFail("两次输入的密码不一致");
        }

        UserInfoBO bo = new UserInfoBO();
        bo.setUserid(getSessionUserId(session));
        bo.setCategorypsw(categorypsw);
        int row = userInfoService.setCategoryPsw(bo);
        if (row == 0) {
            return ajaxFail();
        }
        return ajaxSuccess();
    }

}
