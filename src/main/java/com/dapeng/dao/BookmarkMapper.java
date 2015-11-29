package com.dapeng.dao;

import java.util.List;

import org.apache.log4j.Category;
import org.springframework.stereotype.Repository;

import com.dapeng.domain.Bookmark;

@Repository
public interface BookmarkMapper {
	List<Bookmark> selectBookmarkList();
	
	List<Bookmark> selectrecycleList();
	
	Bookmark selectBookmarkListById(int bookmarkId);
	
	int insertBookmark(Bookmark bookmark);
	
	/**
	 * 逻辑删除书签
	 * @param id
	 * @return
	 */
	int deleteBookmarkById(int id);
	
	/**
	 * 物理删除书签
	 * @param id
	 * @return
	 */
	
	int deletePhysicsBookmarkById(int id);
	int updateBookmarkById(int id);
	
	int updateBookmarkBySlected(Bookmark bookmark);
	
	/**
	 * 类别检索
	 * @param categoryid
	 * @return
	 */
	List<Category> selectCategoryList();
	
	Category selectCategoryById(int categoryid);
	
	int addCategory(Category category);
	
	int deleteCategoryById(int categoryid);
	
	int updateCategoryBySlected(Category category);
}