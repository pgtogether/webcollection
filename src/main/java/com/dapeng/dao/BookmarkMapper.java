package com.dapeng.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dapeng.domain.Bookmark;
import com.dapeng.domain.Category;

@Repository
public interface BookmarkMapper {
	List<Bookmark> selectBookmarkList();
	
	Bookmark selectBookmarkListById(int bookmarkId);
	
	int insertBookmark(Bookmark bookmark);
	
	int deleteBookmarkById(int id);
	
	int updateBookmarkById(int id);
	
	int updateBookmarkBySlected(Bookmark bookmark);
	
	int addCategory(Category category);
}