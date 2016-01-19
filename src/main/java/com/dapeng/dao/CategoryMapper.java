package com.dapeng.dao;

import java.util.List;

import com.dapeng.domain.Bookmark;
import com.dapeng.domain.Category;
import com.dapeng.service.bo.CategoryBO;
import com.depeng.web.bo.CategoryMiniBO;

/**
 * 分类操作DAO
 * 
 * @Description
 * @author jiangdp
 * @date 2015年12月6日 下午5:55:11
 */
public interface CategoryMapper {

    int deleteByPrimaryKey(int categoryid);

    int deleteByUnique(Category record);
    
    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(String categoryid);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);

    /**
     * 类别检索
     */
    List<CategoryMiniBO> selectCategoryList(String userid);
    
    List<CategoryBO> selectParentCategoryList(Category category);

    Category selectCategoryById(int categoryid);

    // // 新增分类
    // int addCategory(Category category);

    // int deleteCategoryById(int categoryid);
    int updateCategoryByUnique(Category category);

    // 改变标签的分类和排序
    int updateBookmarkCategory(Bookmark bookmark);

    // 获取刚插入的分类ID
    int selectLastCategoryId();

    // 获取用户下最大的分类编号
    int selectMaxCategoryNoByUserId(String userId);

    // 更新分类排序
    int updateCategorySort(Category category);

    // 批量更新分类排序
    void batchUpdateCategorySort(List<Category> list);

    // 获取默认栏位下最大排序号
    int selectMaxSortInDefaultColNo(Category category);
    
    int countCategory(String userid);
}