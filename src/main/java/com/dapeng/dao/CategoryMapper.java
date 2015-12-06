package com.dapeng.dao;

import java.util.List;

import com.dapeng.domain.Bookmark;
import com.dapeng.domain.Category;

/**
 * 分类操作DAO
 * 
 * @Description
 * @author jiangdp
 * @date 2015年12月6日 下午5:55:11
 */
public interface CategoryMapper {

    int deleteByPrimaryKey(int categoryid);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(String categoryid);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);

    /**
     * 类别检索
     */
    List<Category> selectCategoryList();

    Category selectCategoryById(int categoryid);

    // // 新增分类
    // int addCategory(Category category);

    // int deleteCategoryById(int categoryid);
    int updateCategoryBySlected(Category category);

    // 改变标签的分类和排序
    int updateBookmarkCategory(Bookmark bookmark);
    
    // 获取刚插入的分类ID
    int selectLastCategoryId();
}