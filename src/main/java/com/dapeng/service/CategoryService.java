package com.dapeng.service;

import java.util.List;

import com.dapeng.domain.Category;
import com.dapeng.service.bo.BookmarkBO;
import com.dapeng.service.bo.CategoryBO;

/**
 * 分类操作Service
 * 
 * @Description
 * @author jiangdp
 * @date 2015年12月6日 下午5:56:11
 */
public interface CategoryService {
    
    // 查询所有类别
    List<Category> selectCategoryList();

    // 查询类别 根据id
    Category selectCategoryById(int categoryid);

    // 增加类别
    int addCategory(CategoryBO categoryBO);

    // 删除类别 根据id
    int deleteCategoryById(int categoryid);

    // 更新类别
    int updateCategoryBySlected(Category category);

    // 改变标签的分类
    int updateBookmarkCategory(BookmarkBO bo);
}
