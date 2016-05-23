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

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dapeng.service.BookmarkService;
import com.dapeng.service.UserInfoService;
import com.dapeng.util.StringUtils;
import com.depeng.web.bo.BookmarkMiniBO;

/**
 * 分类功能
 * 
 * @Copyright: Copyright (c) 2015
 * @Company: J&&S工作室
 * @author J&&S jiangdp
 * @date 2015年11月12日 下午7:34:32
 * @version V1.0
 */
@Controller
@RequestMapping("/*")
public class CategoryController extends UserSessionController {

    @Autowired
    private BookmarkService bookmarkService;

    @Autowired
    private UserInfoService userInfoService;

    /**
     * 解锁分类
     */
    @RequestMapping(value = "unlockCategory", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> unlockCategory(HttpServletRequest request, HttpSession session) {
        String categorypsw = request.getParameter("categorypsw");
        String userid = getSessionUserId(session);
        boolean result = userInfoService.checkCategoryPsw(categorypsw, userid);
        return ajaxSuccess(result);
    }

    /**
     * 获取某个分类下的全部书签
     */
    @RequestMapping(value = "doSelectBookmarkListByCategory", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doSelectBookmarkListByCategory(HttpServletRequest request, HttpSession session) {
        String categoryno = request.getParameter("categoryno");

        if (!StringUtils.validInteger(categoryno)) {
            return ajaxFail();
        }
        List<BookmarkMiniBO> bookmarkList = bookmarkService.selectBookmarkListByCategoryNo(Integer.valueOf(categoryno),
                getSessionUserId(session));
        return ajaxSuccess(bookmarkList);
    }
}
