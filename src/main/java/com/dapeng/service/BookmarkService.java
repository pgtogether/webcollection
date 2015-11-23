package com.dapeng.service;

import java.util.List;

import org.apache.log4j.Category;

import com.dapeng.domain.Bookmark;

public interface BookmarkService {

	List<Bookmark> selectBookmarkList();

	Bookmark selectBookmarkListById(int bookmarkId);

	int insertBookmark(Bookmark bookmark);

	int deleteBookmarkById(int id);

	int updateBookmarkById(int id);

	int updateBookmarkBySlected(Bookmark bookmark);

	int addCategory(Category category);

}
