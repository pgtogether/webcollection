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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dapeng.controller.form.AddSubjectBookMarkForm;
import com.dapeng.service.BookmarkService;
import com.dapeng.service.SubjectService;
import com.dapeng.service.bo.BookmarkBO;
import com.dapeng.service.bo.SubjectBO;
import com.dapeng.util.StringUtils;

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
@RequestMapping("subject/*")
public class SubjectController extends UserSessionController {

    @Autowired
    private SubjectService subjectService;

    @Autowired
    private BookmarkService bookmarkService;

    /**
     * 新增专题
     */
    @RequestMapping(value = "doAddSubject", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doAddSubject(HttpServletRequest request, HttpSession session) {
        String subjectName = request.getParameter("subjectname");
        String subjectDesc = request.getParameter("subjectdesc");
        if (StringUtils.isEmpty(subjectName)) {
            return ajaxFail();
        }

        SubjectBO subjectBO = new SubjectBO();
        subjectBO.setUserid(getSessionUserId(session));
        subjectBO.setSubjectname(subjectName);
        subjectBO.setSubjectdesc(subjectDesc);
        int result = subjectService.addSubject(subjectBO);
        if (result > 0) {
            return ajaxSuccess();
        } else {
            return ajaxFail();
        }
    }

    /**
     * 添加专题下的网址
     */
    @RequestMapping(value = "doAddSubjectBookmark", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doAddSubjectBookmark(@Validated
    AddSubjectBookMarkForm form, BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
            return ajaxValidateError(result);
        }
        int subjectno = Integer.valueOf(form.getSubjectno());
        BookmarkBO bookmarkbo = new BookmarkBO();
        bookmarkbo.setUserid(getSessionUserId(session));
        bookmarkbo.setBookmarkname(StringUtils.trim(form.getBookmarkname()));
        bookmarkbo.setUrl(StringUtils.trim(form.getUrl()));
        bookmarkbo.setSubjectno(subjectno);
        bookmarkbo.setTags(StringUtils.trim(form.getTags()));
        bookmarkbo.setDescription(StringUtils.trim(form.getDesc()));
        Integer bookmarkno = bookmarkService.insertBookmark(bookmarkbo);
        if (bookmarkno > 0) {
            return ajaxSuccess(bookmarkno);
        } else {
            return ajaxFail("添加书签失败");
        }
    }

}
