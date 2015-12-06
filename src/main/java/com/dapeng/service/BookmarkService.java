package com.dapeng.service;

import java.util.List;

import com.dapeng.domain.Bookmark;
import com.dapeng.domain.Category;
import com.dapeng.service.bo.BookmarkBO;
import com.dapeng.service.bo.CategoryBO;

public interface BookmarkService {
	//查看书签列表
	List<Bookmark> selectBookmarkList(); 
	
	//查找同一类别的书签
	List<Bookmark> selectBookmarkListByCategoryid(int categoryid); 
	
	//查看回收站列表
	List<Bookmark> selectrecycleList();
	
	//根据id查找书签
	Bookmark selectBookmarkListById(int bookmarkId);
	
	//插入书签
	int insertBookmark(Bookmark bookmark);
	
	//逻辑删除  放入回收站
	int deleteBookmarkById(int id);
	
	//物理删除
	int deletePhysicsBookmarkById(int id);
	
	//更新书签  todo 未使用
	int updateBookmarkById(int id);
	
	//从回收站恢复书签
	int doRecoverBookmark(int id);
	
	//更新书签
	int updateBookmarkBySlected(Bookmark bookmark);
	//设置热门书签
	int setHotbookmark(BookmarkBO bo);
	//取消热门书签
	int cancelHotbookmark(BookmarkBO bo);
	
	List<Bookmark> selectHotBookmarkList();
}
