package com.dapeng.service;

import java.util.List;

import com.dapeng.domain.Bookmark;
import com.dapeng.domain.Category;

public interface BookmarkService {
	
	List<Bookmark> selectBookmarkList();
	
	Bookmark selectBookmarkListById(int bookmarkId);
	
	int insertBookmark(Bookmark bookmark);
	
	int deleteBookmarkById(int id);
	
	int updateBookmarkById(int id);
	
	int updateBookmarkBySlected(Bookmark bookmark);
	
	int addCategory(Category category);

}
