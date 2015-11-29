package com.dapeng.service;

import java.util.List;

import com.dapeng.domain.Bookmark;
import com.dapeng.domain.Category;

public interface BookmarkService {
	
	List<Bookmark> selectBookmarkList();
	List<Bookmark> selectrecycleList();
	
	Bookmark selectBookmarkListById(int bookmarkId);
	
	int insertBookmark(Bookmark bookmark);
	
	/**
	 * 逻辑删除
	 * @param id
	 * @return
	 */
	int deleteBookmarkById(int id);
	/**
	 * 物理删除
	 * @param id
	 * @return
	 */
	int deletePhysicsBookmarkById(int id);
	int updateBookmarkById(int id);
	
	int updateBookmarkBySlected(Bookmark bookmark);
	
	List<Category> selectCategoryList();
	
	Category selectCategoryById(int categoryid);
	
	int addCategory(Category category);
	
	int deleteCategoryById(int categoryid);
	
	int updateCategoryBySlected(Category category);

}
