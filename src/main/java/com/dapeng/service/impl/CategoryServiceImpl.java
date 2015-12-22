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
import com.dapeng.util.DateUtils;
import com.depeng.web.bo.CategoryMiniBO;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryDao;

    /**
     * 新增分类
     * 
     * @param categoryBO
     * @return 新增分类ID
     */
    @Override
    public int addCategory(CategoryBO categoryBO) {
        // 获取最大的分类编号
        int maxCategoryNo = categoryDao.selectMaxCategoryNoByUserId(categoryBO.getUserid()) + 1;
        Category category = new Category();
        category.setUserid(categoryBO.getUserid());
        category.setCategoryno(maxCategoryNo);
        category.setCategoryname(categoryBO.getCategoryname());
        category.setCategorypermission(categoryBO.getCategorypermission());
        category.setCategorytype(categoryBO.getCategorytype());
        category.setParentcategoryid(categoryBO.getParentcategoryid());
        category.setCategorypsw(categoryBO.getCategorypsw());
        Date systime = new Date();
        category.setCreatetime(systime);
        category.setUpdatetime(systime);
        int result = categoryDao.insert(category);
        if (result > 0) {
            return maxCategoryNo;
        } else {
            return 0;
        }
    }

    @Override
    public int deleteCategoryById(int categoryid) {
        return categoryDao.deleteByPrimaryKey(categoryid);
    }

    @Override
    public int updateCategoryByUnique(CategoryBO bo) {
        Category category = new Category();
        category.setUserid(bo.getUserid());
        category.setCategoryno(bo.getCategoryno());
        category.setCategoryname(bo.getCategoryname());
        category.setUpdatetime(new Date());
        return categoryDao.updateCategoryByUnique(category);
    }

    @Override
    public List<CategoryMiniBO> selectCategoryList(String userid) {
        return categoryDao.selectCategoryList(userid);
    }

    @Override
    public Category selectCategoryById(int categoryid) {
        return categoryDao.selectCategoryById(categoryid);
    }

    @Override
    public int updateBookmarkCategory(BookmarkBO bo) {
        Bookmark bm = new Bookmark();
        bm.setBookmarkid(bo.getBookmarkid());
        bm.setSort(bo.getSort());
        bm.setCategoryno(bo.getCategoryno());
        return categoryDao.updateBookmarkCategory(bm);
    }

    /**
     * 更新分类的排序
     */
    @Override
    public void updateCategorySort(CategoryBO bo) {
        String sortlist = bo.getSortlist();
        String column = bo.getColno();
        String[] sortArray = sortlist.split(",");
        Date sysDate = DateUtils.getSysDate();
        for (int i = 0; i < sortArray.length; i++) {
            String categoryno = sortArray[i].split("_")[1];
            Category category = new Category();
            category.setUserid(bo.getUserid());
            category.setCategoryno(Integer.valueOf(categoryno));
            category.setSort(i);
            category.setColno(column);
            category.setUpdatetime(sysDate);
            categoryDao.updateCategorySort(category);
        }
    }
}
