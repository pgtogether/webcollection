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
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dapeng.constants.CategoryPermissionEnum;
import com.dapeng.constants.CategoryTypeEnum;
import com.dapeng.controller.form.AddBookMarkForm;
import com.dapeng.controller.form.CategoryForm;
import com.dapeng.controller.form.EditBookMarkForm;
import com.dapeng.domain.Bookmark;
import com.dapeng.domain.Category;
import com.dapeng.service.BookmarkService;
import com.dapeng.service.CategoryService;
import com.dapeng.service.bo.BookmarkBO;
import com.dapeng.service.bo.CategoryBO;
import com.depeng.web.bo.BookmarkMiniBO;
import com.depeng.web.bo.CategoryMiniBO;
import com.depeng.web.bo.CategoryWithBookmarkMiniBO;

/**
 * 类的功能描述
 * 
 * @Copyright: Copyright (c) 2015
 * @Company: J&&S工作室
 * @author J&&S jiangdp
 * @date 2015年11月12日 下午7:34:32
 * @version V1.0
 */
@Controller
@RequestMapping("/*")
public class IndexController extends UserSessionController {

    @Autowired
    private BookmarkService bookmarkService;

    @Autowired
    private CategoryService categoryService;

    /**
     * 默认主页
     */
    @RequestMapping(value = "index", method = { RequestMethod.GET, RequestMethod.POST })
    public String index(Model model, HttpSession session) {
        // 获取热门书签
        List<BookmarkMiniBO> hotBookmarkList = bookmarkService.selectHotBookmarkList(getSessionUserId(session));
        model.addAttribute("hotBookmarkList", hotBookmarkList);
        return "index";
    }

    @RequestMapping(value = "index1", method = { RequestMethod.GET, RequestMethod.POST })
    public String index1() {
        return "index1";
    }

    @RequestMapping(value = "recycle", method = { RequestMethod.GET, RequestMethod.POST })
    public String recycle1() {
        return "recycle";
    }

    /**
     * 
     * 获取用户收藏的所有书签
     * 
     */
    @RequestMapping(value = "doSelectBookmarkList", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doSelectBookmarkList(HttpSession session) {
        List<CategoryWithBookmarkMiniBO> bookmarkList = bookmarkService.selectBookmarkList(getSessionUserId(session));
        return ajaxSuccess(bookmarkList);
    }

    /**
     * 
     * 获取同一类别书签
     * 
     */
    @RequestMapping(value = "doSelectSametypeBookmarkList", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doSelectSametypeBookmarkList() {
        // List<Bookmark> bookmarkList = bookmarkService.selectBookmarkList();
        // return ajaxSuccess(bookmarkList);
        return ajaxSuccess();
    }

    /**
     * 
     * 标记为热点书签
     * 
     */
    @RequestMapping(value = "doSetHotBookmark", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doSetHotBookmark(HttpServletRequest request, HttpSession session) {
        String bookmarkno = request.getParameter("bookmarkno");
        if (StringUtils.isEmpty(bookmarkno)) {
            return ajaxFail("标记失败");
        }
        BookmarkBO bo = new BookmarkBO();
        bo.setUserid(getSessionUserId(session));
        bo.setBookmarkno(Integer.valueOf(bookmarkno));
        int result = bookmarkService.setHotbookmark(bo);
        if (result == 0) {
            return ajaxFail("标记失败");
        }
        return ajaxSuccess();
    }

    /**
     * 
     * 取消热点书签
     * 
     */
    @RequestMapping(value = "doCancelHotBookmark", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doCancelHotBookmark(HttpServletRequest request, HttpSession session) {
        String bookmarkno = request.getParameter("bookmarkno");
        if (StringUtils.isEmpty(bookmarkno)) {
            return ajaxFail("取消失败");
        }
        BookmarkBO bo = new BookmarkBO();
        bo.setUserid(getSessionUserId(session));
        bo.setBookmarkno(Integer.valueOf(bookmarkno));
        int result = bookmarkService.cancelHotbookmark(bo);
        if (result == 0) {
            return ajaxFail("取消失败");
        }
        return ajaxSuccess();
    }

    /**
     * 查询热点书签
     */
    @RequestMapping(value = "doSelectHotBookmarkList", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doSelectHotBookmarkList(HttpSession session) {
        List<BookmarkMiniBO> bookmarkList = bookmarkService.selectHotBookmarkList(getSessionUserId(session));
        return ajaxSuccess(bookmarkList);
    }

    /**
     * 回收站
     * 
     * @return
     */
    @RequestMapping(value = "doSelectRecycleBookmarkList", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public List<Bookmark> doSelectRecycleBookmarkList() {
        List<Bookmark> bookmarkList = bookmarkService.selectrecycleList();
        return bookmarkList;
    }

    /**
     * 从回收站恢复
     * 
     * @param bookmarkid
     * @return
     */
    @RequestMapping(value = "doRecoverBookmark", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public int doRecoverBookmark(String bookmarkid) {
        System.out.println("从回收站恢复----->  " + bookmarkid);
        String[] bookmarkidarr = bookmarkid.split(";");
        int result = -1;
        try {
            for (int i = 0; i < bookmarkidarr.length; i++) {
                result = bookmarkService.doRecoverBookmark(Integer.parseInt(bookmarkidarr[i]));
                if (result < 0) {
                    break;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 添加网址
     */
    @RequestMapping(value = "doAddBookmark", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doAddBookmark(@Validated
    AddBookMarkForm form, BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
            return ajaxValidateError(result);
        }
        BookmarkBO bookmarkbo = new BookmarkBO();
        bookmarkbo.setUserid(getSessionUserId(session));
        bookmarkbo.setBookmarkname(StringUtils.trimWhitespace(form.getBookmarkname()));
        bookmarkbo.setUrl(StringUtils.trimWhitespace(form.getUrl()));
        bookmarkbo.setCategoryno(Integer.valueOf(form.getCategoryno()));
        bookmarkbo.setDescription(StringUtils.trimWhitespace(form.getDescription()));
        int maxBookmarkNo = bookmarkService.insertBookmark(bookmarkbo);
        if (maxBookmarkNo > 0) {
            return ajaxSuccess(maxBookmarkNo);
        } else {
            return ajaxFail();
        }
    }

    /**
     * 标签逻辑删除 点击删除-》flg='1'
     * 
     * @param bookmarkid
     *            deleteflg 是否删除 0否 1逻辑删除 2物理删除
     * @return
     */
    @RequestMapping(value = "doDeleteBookmark", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doDeleteBookmark(HttpServletRequest request, HttpSession session) {
        String bookmarkno = request.getParameter("bookmarkno");
        if (StringUtils.isEmpty(bookmarkno)) {
            return ajaxFail("删除异常");
        }
        int result = bookmarkService.deleteBookmarkByUnique(getSessionUserId(session), Integer.valueOf(bookmarkno));
        if (result == 0) {
            return ajaxFail("删除失败");
        }
        return ajaxSuccess();
    }

    /**
     * 物理删除
     * 
     * @param bookmarkid
     * @return
     */
    @RequestMapping(value = "doPhysicsDelBookmark", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public int doPhysicsDelBookmark(String bookmarkid) {
        System.out.println("物理删除----->  " + bookmarkid);
        String[] bookmarkidarr = bookmarkid.split(";");
        int result = -1;
        try {
            for (int i = 0; i < bookmarkidarr.length; i++) {
                result = bookmarkService.deletePhysicsBookmarkById(Integer.parseInt(bookmarkidarr[i]));
                if (result < 0) {
                    break;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 编辑书签
     */
    @RequestMapping(value = "doUpdateBookmark", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doUpdateBookmark(@Validated
    EditBookMarkForm form, BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
            return ajaxValidateError(result);
        }

        BookmarkBO bo = new BookmarkBO();
        bo.setUserid(getSessionUserId(session));
        bo.setUrl(StringUtils.trimWhitespace(form.getUrl()));
        bo.setBookmarkno(Integer.valueOf(form.getBookmarkno()));
        bo.setBookmarkname(StringUtils.trimWhitespace(form.getBookmarkname()));
        bo.setTags(StringUtils.trimWhitespace(form.getTags()));
        bo.setDescription(StringUtils.trimWhitespace(form.getDescription()));
        int rows = bookmarkService.updateBookmark(bo);
        if (rows > 0) {
            return ajaxSuccess();
        } else {
            return ajaxFail();
        }
    }

    /**
     * 新增分类
     */
    @RequestMapping(value = "doAddCategory", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doAddCategory(CategoryForm form, HttpSession session) {
        CategoryBO categoryBO = new CategoryBO();
        categoryBO.setCategoryname(form.getCategoryname());
        // 权限
        categoryBO.setCategorypermission(CategoryPermissionEnum.NORMAL.getId());
        // 密码：暂无
        categoryBO.setCategorypsw("***");
        // 默认二级分类
        categoryBO.setCategorytype(CategoryTypeEnum.DEFAULT_CATEGORY_TYPE.getId());
        // 默认父分类
        categoryBO.setParentcategoryid(0);
        // 默认测试
        categoryBO.setUserid(getSessionUserId(session));
        int newCategoryId = categoryService.addCategory(categoryBO);
        if (newCategoryId == 0) {
            return ajaxFail();
        }
        return ajaxSuccess(newCategoryId);
    }

    @RequestMapping(value = "doDeleteCategory", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public int doDeleteCategory(String categoryid) {
        int result = -1;
        try {
            result = categoryService.deleteCategoryById(Integer.parseInt(categoryid));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @RequestMapping(value = "doUpdateCategory", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public int doUpdateCategory(Category category) {
        int result = -1;
        try {
            Category cgdto = new Category();
            cgdto.setCategoryid(category.getCategoryid());
            cgdto.setCategoryname(category.getCategoryname());
            result = categoryService.updateCategoryBySlected(category);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 查询用户名下的所有分类
     */
    @RequestMapping(value = "doSelectCategoryList", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doSelectCategoryList(HttpSession session) {
        List<CategoryMiniBO> categoryList = categoryService.selectCategoryList(getSessionUserId(session));
        return ajaxSuccess(categoryList);
    }

    /**
     * 书签从分类中迁移到另外一个分类 TODO
     * 
     * @param bookMarkForm
     * @return
     */
    @RequestMapping(value = "doChangeCategory", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public int doChangeCategory(AddBookMarkForm bookMarkForm) {
        int result = -1;
        BookmarkBO bo = new BookmarkBO();
        // bo.setBookmarkname(bookMarkForm.getBookmarkname());
        // bo.setUrl(bookMarkForm.getUrl());
        bo.setBookmarkid(4);
        bo.setSort(5);
        // bo.setCategoryid(2);
        result = categoryService.updateBookmarkCategory(bo);
        return result;
    }
}
