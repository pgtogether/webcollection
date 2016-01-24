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

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

    @RequestMapping(value = "home", method = { RequestMethod.GET, RequestMethod.POST })
    public String home(Model model, HttpSession session) {
        return "setting/home";
    }

    @RequestMapping(value = "security", method = { RequestMethod.GET, RequestMethod.POST })
    public String security(Model model, HttpSession session) {
        return "setting/security";
    }

    @RequestMapping(value = "security_setcategorypsw", method = { RequestMethod.GET, RequestMethod.POST })
    public String setcategorypsw(Model model, HttpSession session) {
        return "setting/setcategorypsw";
    }
}
