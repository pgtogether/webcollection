﻿/**
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

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dapeng.constants.BookmarkDeleteEnum;
import com.dapeng.constants.BookmarkHotEnum;
import com.dapeng.constants.BookmarkPermissionEnum;
import com.dapeng.constants.CategoryPermissionEnum;
import com.dapeng.constants.CategoryTypeEnum;
import com.dapeng.controller.form.BookMarkForm;
import com.dapeng.controller.form.CategoryForm;
import com.dapeng.domain.Bookmark;
import com.dapeng.domain.Category;
import com.dapeng.service.BookmarkService;
import com.dapeng.service.CategoryService;
import com.dapeng.service.bo.BookmarkBO;
import com.dapeng.service.bo.CategoryBO;
import com.depeng.web.bo.CategoryMiniBO;

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
public class IndexController extends BaseController {

    @Autowired
    private BookmarkService bookmarkService;

    @Autowired
    private CategoryService categoryService;

    /**
     * 默认主页
     * 
     * @param @return
     * @return String
     */
    @RequestMapping(value = "index", method = { RequestMethod.GET, RequestMethod.POST })
    public String index() {
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
    public Map<String, Object> doSelectBookmarkList() {
        List<Bookmark> bookmarkList = bookmarkService.selectBookmarkList();
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
        List<Bookmark> bookmarkList = bookmarkService.selectBookmarkList();
        return ajaxSuccess(bookmarkList);
    }

    /**
     * 
     * 标记为热点书签
     * 
     */
    @RequestMapping(value = "doSethotbookmark", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doSethotbookmark(BookmarkBO bo) {
        int result = -1;
        result = bookmarkService.setHotbookmark(bo);
        return ajaxSuccess(result);
    }

    /**
     * 
     * 取消热点书签
     * 
     */
    @RequestMapping(value = "doCancelhotbookmark", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doCancelhotbookmark(BookmarkBO bo) {
        int result = -1;
        result = bookmarkService.cancelHotbookmark(bo);
        return ajaxSuccess(result);
    }

    /**
     * 查询热点书签
     */
    @RequestMapping(value = "doSelectHotBookmarkList", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doSelectHotBookmarkList() {
        List<Bookmark> bookmarkList = bookmarkService.selectHotBookmarkList();
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
    BookMarkForm form, BindingResult result) {
        if (result.hasErrors()) {
            return ajaxValidateError(result);
        }

        BookmarkBO bookmarkbo = new BookmarkBO();
        bookmarkbo.setBookmarkname(form.getBookmarkname());
        bookmarkbo.setUrl(form.getUrl());
        bookmarkbo.setCategoryid(Integer.valueOf(form.getCategoryid()));
        bookmarkbo.setDescription(form.getDescription());
        int rows = bookmarkService.insertBookmark(bookmarkbo);
        if (rows > 0) {
            return ajaxSuccess();
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
    public int doDeleteBookmark(String bookmarkid) {
        int result = -1;
        try {
            result = bookmarkService.deleteBookmarkById(Integer.parseInt(bookmarkid));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
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
    BookMarkForm form, BindingResult result) {
        if (result.hasErrors()) {
            return ajaxValidateError(result);
        }
        try {
            Bookmark bmdto = new Bookmark();
            bmdto.setBookmarkid(Integer.valueOf(form.getBookmarkid()));
            bmdto.setBookmarkname(form.getBookmarkname());
            bmdto.setUrl(form.getUrl());
            int rows = bookmarkService.updateBookmarkBySlected(bmdto);
            if (rows > 0) {
                return ajaxSuccess();
            } else {
                return ajaxFail();
            }
        } catch (Exception e) {
            return ajaxExecption(e);
        }
    }

    /**
     * 新增分类
     */
    @RequestMapping(value = "doAddCategory", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doAddCategory(CategoryForm form) {
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
        int newCategoryId = categoryService.addCategory(categoryBO);
        if(newCategoryId == 0){
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
    public Map<String, Object> doSelectCategoryList() {
        List<CategoryMiniBO> categoryList = categoryService.selectCategoryList();
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
    public int doChangeCategory(BookMarkForm bookMarkForm) {
        int result = -1;
        BookmarkBO bo = new BookmarkBO();
        // bo.setBookmarkname(bookMarkForm.getBookmarkname());
        // bo.setUrl(bookMarkForm.getUrl());
        bo.setBookmarkid(4);
        bo.setSort(5);
        bo.setCategoryid(2);
        result = categoryService.updateBookmarkCategory(bo);
        return result;
    }
}
