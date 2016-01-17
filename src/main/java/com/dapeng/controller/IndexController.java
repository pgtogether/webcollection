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

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.dapeng.service.BookmarkService;
import com.dapeng.service.CategoryService;
import com.dapeng.service.UserTagsService;
import com.dapeng.service.bo.BookmarkBO;
import com.dapeng.service.bo.CategoryBO;
import com.dapeng.util.StringUtils;
import com.depeng.web.bo.BookmarkMiniBO;
import com.depeng.web.bo.CategoryMiniBO;
import com.depeng.web.bo.CategoryWithBookmarkMiniBO;
import com.depeng.web.bo.TagsMiniBO;

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

    @Autowired
    private UserTagsService userTagsService;

    /**
     * 默认主页
     */
    @RequestMapping(value = "index", method = { RequestMethod.GET, RequestMethod.POST })
    public String index(Model model, HttpSession session) {
        String userid = getSessionUserId(session);
        // 获取热门书签
        List<BookmarkMiniBO> hotBookmarkList = bookmarkService.selectHotBookmarkList(userid);
        model.addAttribute("hotBookmarkList", hotBookmarkList);

        // 获取大分类
        List<String> parentCategoryList = categoryService.selectParentCategoryList(userid);
        model.addAttribute("parentCategoryList", parentCategoryList);
        
        // 获取书签，分类总数
        model.addAttribute("bookmarkCnt", bookmarkService.countBookmark(userid));
        model.addAttribute("categoryCnt", categoryService.countCategory(userid));
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

    @RequestMapping(value = "donate", method = { RequestMethod.GET, RequestMethod.POST })
    public String donate() {
        return "donate";
    }

    /**
     * 
     * 获取用户收藏的所有书签
     * 
     */
    @RequestMapping(value = "doSelectBookmarkList", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doSelectBookmarkList(HttpSession session, HttpServletRequest request) {
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
    public Map<String, Object> doSelectRecycleBookmarkList(HttpSession session) {
        List<BookmarkMiniBO> bookmarkList = bookmarkService.selectrecycleList(getSessionUserId(session));
        return ajaxSuccess(bookmarkList);
    }

    /**
     * 从回收站恢复
     * 
     * @param bookmarkid
     * @return
     */
    @RequestMapping(value = "doRecoverBookmark", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doRecoverBookmark(String bookmarkno, HttpSession session) {
        System.out.println("从回收站恢复----->  " + bookmarkno);
        String[] bookmarknoarr = bookmarkno.split(";");
        String userid = getSessionUserId(session);
        if (bookmarknoarr != null && bookmarknoarr.length == 0) {
            return ajaxFail("恢复异常");
        }
        int result = -1;
        try {
            for (int i = 0; i < bookmarknoarr.length; i++) {
                result = bookmarkService.doRecoverBookmark(userid, Integer.parseInt(bookmarknoarr[i]));
                if (result < 0) {
                    return ajaxFail("恢复异常");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ajaxSuccess(bookmarknoarr);
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
        // 如果分类ID为空并且名字不为空，那么需要创建一个新分类
        Integer categoryno = 0;
        Map<String, Integer> resultMap = null;
        if (StringUtils.isEmpty(form.getCategoryno()) && !StringUtils.isEmpty(form.getCategoryname())) {
            CategoryBO categoryBO = new CategoryBO();
            categoryBO.setCategoryname(form.getCategoryname());
            // 权限
            categoryBO.setCategorypermission(CategoryPermissionEnum.NORMAL.getId());
            // 密码：暂无
            categoryBO.setCategorypsw("***");
            // 默认二级分类
            categoryBO.setCategorytype(CategoryTypeEnum.DEFAULT_CATEGORY_TYPE.getId());
            // 默认父分类
            categoryBO.setParentcategoryno(0);
            // 默认测试
            categoryBO.setUserid(getSessionUserId(session));
            categoryno = categoryService.addCategory(categoryBO);
            if (categoryno == 0) {
                return ajaxFail("创建分类失败");
            }
            resultMap = new HashMap<String, Integer>();
            resultMap.put("categoryno", categoryno);
        } else {
            categoryno = Integer.valueOf(form.getCategoryno());
        }

        BookmarkBO bookmarkbo = new BookmarkBO();
        bookmarkbo.setUserid(getSessionUserId(session));
        bookmarkbo.setBookmarkname(StringUtils.trim(form.getBookmarkname()));
        bookmarkbo.setCategoryname(StringUtils.trim(form.getCategoryname()));
        bookmarkbo.setUrl(StringUtils.trim(form.getUrl()));
        bookmarkbo.setCategoryno(categoryno);
        bookmarkbo.setTags(StringUtils.trim(form.getTags()));
        bookmarkbo.setDescription(StringUtils.trim(form.getDesc()));
        Integer bookmarkno = bookmarkService.insertBookmark(bookmarkbo);
        if (bookmarkno > 0) {
            if (resultMap != null) {
                resultMap.put("bookmarkno", bookmarkno);
                return ajaxSuccess(resultMap);
            } else {
                return ajaxSuccess(bookmarkno);
            }
        } else {
            return ajaxFail("添加书签失败");
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
     * @param bookmarkno
     * @return
     */
    @RequestMapping(value = "doPhysicsDelBookmark", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doPhysicsDelBookmark(String bookmarkno, HttpSession session) {
        System.out.println("物理删除----->  " + bookmarkno);
        String[] bookmarknoarr = bookmarkno.split(";");
        if (bookmarknoarr.length == 0) {
            return ajaxFail("删除异常");
        }
        String userid = getSessionUserId(session);
        int result = -1;
        try {
            for (int i = 0; i < bookmarknoarr.length; i++) {
                result = bookmarkService.deletePhysicsBookmarkById(userid, Integer.parseInt(bookmarknoarr[i]));
                if (result < 0) {
                    return ajaxFail("删除异常");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ajaxSuccess(bookmarknoarr);
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
        bo.setUrl(StringUtils.trim(form.getUrl()));
        bo.setBookmarkno(Integer.valueOf(form.getBookmarkno()));
        bo.setBookmarkname(StringUtils.trim(form.getBookmarkname()));
        bo.setTags(StringUtils.trim(form.getTags()));
        bo.setDescription(StringUtils.trim(form.getDesc()));
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
        try {
            String parentCategoryNo = form.getParentcategoryno();
            if (StringUtils.isEmpty(parentCategoryNo)) {
                categoryBO.setParentcategoryno(0);
            } else {
                categoryBO.setParentcategoryno(Integer.valueOf(parentCategoryNo));
            }
            // 默认测试
            categoryBO.setUserid(getSessionUserId(session));
            int newCategoryId = categoryService.addCategory(categoryBO);
            if (newCategoryId == 0) {
                return ajaxFail();
            }
            return ajaxSuccess(newCategoryId);
        } catch (Exception e) {
            return ajaxFail();
        }
    }

    @RequestMapping(value = "doDeleteCategory", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doDeleteCategory(HttpServletRequest request, HttpSession session) {
        String categoryno = request.getParameter("categoryno");
        if (StringUtils.isEmpty(categoryno)) {
            return ajaxFail();
        }
        try {
            int result = categoryService.deleteCategoryByUnique(getSessionUserId(session), Integer.valueOf(categoryno));
            if (result == 0) {
                return ajaxFail();
            }
        } catch (Exception e) {
            return ajaxFail();
        }
        return ajaxSuccess();
    }

    @RequestMapping(value = "doUpdateCategoryName", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doUpdateCategoryName(HttpServletRequest request, HttpSession session) {
        String categoryno = request.getParameter("categoryno");
        String categoryname = request.getParameter("categoryname");
        if (StringUtils.isEmpty(categoryno) || StringUtils.isEmpty(categoryname)) {
            return ajaxFail("参数异常");
        }

        CategoryBO bo = new CategoryBO();
        bo.setUserid(getSessionUserId(session));
        bo.setCategoryno(Integer.valueOf(categoryno));
        bo.setCategoryname(categoryname);
        int result = categoryService.updateCategoryByUnique(bo);
        if (result == 0) {
            return ajaxFail("修改失败");
        }
        return ajaxSuccess();
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
     * 保存拖动后的书签排序以及所属分类
     */
    @RequestMapping(value = "doSaveBookmarkSort", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doSaveBookmarkSort(HttpServletRequest request, HttpSession session) {
        // 排序书签需要知道书签所属于的分类以及该分类下书签的排序
        String bookmarkSorts = request.getParameter("bookmarkSorts");
        String categoryno = request.getParameter("categoryno");
        if (StringUtils.isEmpty(bookmarkSorts) || StringUtils.isEmpty(categoryno)) {
            return ajaxFail("排序异常");
        }
        try {
            BookmarkBO bo = new BookmarkBO();
            bo.setSortlist(bookmarkSorts);
            bo.setCategoryno(Integer.valueOf(categoryno));
            bo.setUserid(getSessionUserId(session));
            bookmarkService.updateBookmarkSort(bo);
        } catch (Exception e) {
            return ajaxFail("排序异常");
        }
        return ajaxSuccess();
    }

    /**
     * 保存拖动后的分类排序
     */
    @RequestMapping(value = "doSaveCategorySort", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doSaveCategorySort(HttpServletRequest request, HttpSession session) {
        // 排序分类需要知道分类的栏位以及该栏位下分类的排序
        String categorySorts = request.getParameter("categorySorts");
        String columnValue = request.getParameter("columnValue");
        if (StringUtils.isEmpty(categorySorts) || StringUtils.isEmpty(columnValue)) {
            return ajaxFail("排序异常");
        }

        try {
            CategoryBO bo = new CategoryBO();
            bo.setSortlist(categorySorts);
            bo.setColno(columnValue);
            bo.setUserid(getSessionUserId(session));
            categoryService.updateCategorySort(bo);
        } catch (Exception e) {
            return ajaxFail("排序异常");
        }
        return ajaxSuccess();
    }

    /**
     * 加载用户的所有标签
     */
    @RequestMapping(value = "loadAllTags", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> loadAllTags(HttpServletRequest request, HttpSession session) {
        List<TagsMiniBO> list = userTagsService.getAllTagsByUserId(getSessionUserId(session));
        return ajaxSuccess(list);
    }

    /**
     * 根据标签过滤书签
     */
    @RequestMapping(value = "doFliterBookmarkByTags", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doFliterBookmarkByTags(HttpServletRequest request, HttpSession session) {
        String tagno = request.getParameter("tagno");
        if (StringUtils.isEmpty(tagno)) {
            return ajaxFail();
        }
        List<BookmarkMiniBO> list = bookmarkService.getBookmarkListByTag(getSessionUserId(session), tagno);
        return ajaxSuccess(list);
    }

    /**
     * 获取书签详情
     */
    @RequestMapping(value = "doGetTagsAndDescByBookmarkNo", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> doGetTagsAndDescByBookmarkNo(HttpServletRequest request, HttpSession session) {
        String bookmarkno = request.getParameter("bookmarkno");
        if (StringUtils.isEmpty(bookmarkno)) {
            return ajaxFail();
        }
        try {
            BookmarkBO bo = bookmarkService.selectTagsAndDescByBookmarkNo(getSessionUserId(session),
                    Integer.valueOf(bookmarkno));
            if (bo != null) {
                Map<String, Object> map = new HashMap<String, Object>();
                String tags = bo.getTags();
                if (!StringUtils.isEmpty(tags) && tags.substring(tags.length() - 1).equals(",")) {
                    map.put("tags", tags.substring(0, tags.length() - 1));
                } else {
                    map.put("tags", tags);
                }
                map.put("desc", bo.getDescription());
                return ajaxSuccess(map);
            }
            return ajaxFail();
        } catch (Exception e) {
            return ajaxFail();
        }
    }
}
