package com.dapeng.service;

import java.util.List;

import com.dapeng.domain.Bookmark;
import com.dapeng.domain.Category;

public interface BookmarkService {
	//查看书签列表
	List<Bookmark> selectBookmarkList();
	
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
	//查询所有类别
	List<Category> selectCategoryList();
	//查询类别 根据id
	Category selectCategoryById(int categoryid);
	//增加类别
	int addCategory(Category category);
	//删除类别 根据id
	int deleteCategoryById(int categoryid);
	//更新类别
	int updateCategoryBySlected(Category category);

}
