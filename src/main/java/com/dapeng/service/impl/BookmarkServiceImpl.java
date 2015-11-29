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
	
	/**
	 * 获取标签列表
	 */
	@Override
	public List<Bookmark> selectBookmarkList() {
		return bookmarkDao.selectBookmarkList();
	}
	/**
	 * 根据id获得书签
	 */
	@Override
	public Bookmark selectBookmarkListById(int bookmarkId) {
		return bookmarkDao.selectBookmarkListById(bookmarkId);
	}
	/**
	 * 添加书签
	 */
	@Override
	public int insertBookmark(Bookmark bookmark) {
		return bookmarkDao.insertBookmark(bookmark);
	}
	/**
	 * 逻辑删除书签
	 */
	@Override
	public int deleteBookmarkById(int id) {
		return bookmarkDao.deleteBookmarkById(id);
	}
	/**
	 * 物理删除书签
	 */
	@Override
	public int deletePhysicsBookmarkById(int id) {
		return bookmarkDao.deletePhysicsBookmarkById(id);
	}
	
	/**
	 * 编辑书签
	 */
	@Override
	public int updateBookmarkById(int id) {
		return bookmarkDao.updateBookmarkById(id);
	}
	/**
	 * 编辑书签
	 */
	@Override
	public int updateBookmarkBySlected(Bookmark bookmark) {
		return bookmarkDao.updateBookmarkBySlected(bookmark);
	}
	/**
	 * 增加类别
	 */
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

	

}
