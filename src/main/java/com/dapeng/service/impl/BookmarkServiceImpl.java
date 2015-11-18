package com.dapeng.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dapeng.dao.BookmarkMapper;
import com.dapeng.domain.Bookmark;
import com.dapeng.service.BookmarkService;

@Service
public class BookmarkServiceImpl implements BookmarkService{
	@Autowired
	private BookmarkMapper bookmarkDao;
	
	@Override
	public List<Bookmark> selectBookmarkList() {
		return bookmarkDao.selectBookmarkList();
	}

	@Override
	public Bookmark selectBookmarkListById(int bookmarkId) {
		return bookmarkDao.selectBookmarkListById(bookmarkId);
	}

	@Override
	public int insertBookmark(Bookmark bookmark) {
		return bookmarkDao.insertBookmark(bookmark);
	}

	@Override
	public int deleteBookmarkById(int id) {
		return bookmarkDao.deleteBookmarkById(id);
	}

	@Override
	public int updateBookmarkById(int id) {
		return bookmarkDao.updateBookmarkById(id);
	}

	@Override
	public int updateBookmarkBySlected(Bookmark bookmark) {
		return bookmarkDao.updateBookmarkBySlected(bookmark);
	}

}
