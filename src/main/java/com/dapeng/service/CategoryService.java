package com.dapeng.service;

import java.util.List;

import com.dapeng.domain.Category;
import com.dapeng.service.bo.BookmarkBO;
import com.dapeng.service.bo.CategoryBO;
import com.depeng.web.bo.CategoryMiniBO;

/**
 * 分类操作Service
 * 
 * @Description
 * @author jiangdp
 * @date 2015年12月6日 下午5:56:11
 */
public interface CategoryService {

    // 查询分类数目
    int countCategory(String userid);

    // 查询所有类别
    List<CategoryMiniBO> selectCategoryList(String userid);

    // 查询用户名下大分类
    List<CategoryBO> selectParentCategoryList(String userid);

    // 查询类别 根据id
    Category selectCategoryById(int categoryid);

    // 增加分类导航
    int addParentCategory(CategoryBO categoryBO);
    
    // 修改分类导航
    int updParentCategory(CategoryBO categoryBO);

    // 增加类别
    int addCategory(CategoryBO categoryBO);

    // 删除类别
    int deleteCategoryByUnique(String userid, int categoryno);

    // 更新类别
    int updateCategoryByUnique(CategoryBO bo);

    // 改变标签的分类
    int updateBookmarkCategory(BookmarkBO bo);

    // 更新分类的排序
    void updateCategorySort(CategoryBO bo);
}
