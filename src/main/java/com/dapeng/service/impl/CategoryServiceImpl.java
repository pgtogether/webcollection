package com.dapeng.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dapeng.dao.CategoryMapper;
import com.dapeng.domain.Bookmark;
import com.dapeng.domain.Category;
import com.dapeng.service.CategoryService;
import com.dapeng.service.bo.BookmarkBO;
import com.dapeng.service.bo.CategoryBO;
import com.depeng.web.bo.CategoryMiniBO;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryDao;

    /**
     * 新增分类
     * @param categoryBO
     * @return 新增分类ID
     */
    @Override
    public int addCategory(CategoryBO categoryBO) {
        Category category = new Category();
        category.setCategoryname(categoryBO.getCategoryname());
        category.setCategorypermission(categoryBO.getCategorypermission());
        category.setCategorytype(categoryBO.getCategorytype());
        category.setParentcategoryid(categoryBO.getParentcategoryid());
        category.setCategorypsw(categoryBO.getCategorypsw());
        category.setCreatetime(new Date());
        category.setUpdatetime(new Date());
        int result = categoryDao.insert(category);
        if (result > 0) {
            return categoryDao.selectLastCategoryId();
        } else {
            return 0;
        }
    }

    @Override
    public int deleteCategoryById(int categoryid) {
        return categoryDao.deleteByPrimaryKey(categoryid);
    }

    @Override
    public int updateCategoryBySlected(Category category) {
        return categoryDao.updateCategoryBySlected(category);
    }

    @Override
    public List<CategoryMiniBO> selectCategoryList() {
        return categoryDao.selectCategoryList();
    }

    @Override
    public Category selectCategoryById(int categoryid) {
        return categoryDao.selectCategoryById(categoryid);
    }

    /*
     * (non-Javadoc)
     * 
     * @see com.dapeng.service.BookmarkService#updateBookmarkCategory(int)
     */
    @Override
    public int updateBookmarkCategory(BookmarkBO bo) {
        Bookmark bm = new Bookmark();
        bm.setBookmarkid(bo.getBookmarkid());
        bm.setSort(bo.getSort());
        bm.setCategoryid(bo.getCategoryid());
        return categoryDao.updateBookmarkCategory(bm);
    }

}
