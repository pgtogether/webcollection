package com.dapeng.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dapeng.dao.BookmarkMapper; 
import com.dapeng.domain.Bookmark;
import com.dapeng.domain.Category;
import com.dapeng.service.BookmarkService;

@Service
public  class BookmarkServiceImpl implements BookmarkService{
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
	public int deletePhysicsBookmarkById(int id) {
		return bookmarkDao.deletePhysicsBookmarkById(id);
	}
	
	@Override
	public int updateBookmarkById(int id) {
		return bookmarkDao.updateBookmarkById(id);
	}
	@Override
	public int updateBookmarkBySlected(Bookmark bookmark) {
		return bookmarkDao.updateBookmarkBySlected(bookmark);
	}
	@Override
	public int addCategory(Category category) {
		return bookmarkDao.addCategory(category);
	}


	@Override
	public int deleteCategoryById(int categoryid) {
		return bookmarkDao.deleteCategoryById(categoryid);
	}
	@Override
	public int updateCategoryBySlected(Category category) {
		return bookmarkDao.updateCategoryBySlected(category);
	}
	@Override
	public List<Category> selectCategoryList() {
		return bookmarkDao.selectCategoryList();
	}
	@Override
	public Category selectCategoryById(int categoryid) {
		return bookmarkDao.selectCategoryById(categoryid);
	}
	@Override
	public List<Bookmark> selectrecycleList() {
		return bookmarkDao.selectrecycleList();
	}
	
	//从回收站恢复书签
	@Override
	public int doRecoverBookmark(int id) {
		return bookmarkDao.doRecoverBookmark(id);
	}

	

}
