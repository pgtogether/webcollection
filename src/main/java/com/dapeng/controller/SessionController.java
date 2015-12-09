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

import com.dapeng.session.UserSession;

/**
 * SessionController
 * 
 * @Copyright: Copyright (c) 2015
 * @Company: J&&S工作室
 * @author J&&S jiangdp
 * @date 2015年11月12日 下午7:34:32
 * @version V1.0
 */
public class SessionController {

    public UserSession getUserSession(HttpSession session) {
        UserSession userSession = (UserSession) session.getAttribute("USER_SESSION");
        return userSession;
    }

    public String getSessionUserId(HttpSession session) {
        UserSession userSession = getUserSession(session);

        if (userSession != null) {
            return userSession.getUserid();
        }
        return "testUser";
    }
}
