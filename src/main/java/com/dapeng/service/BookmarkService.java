﻿package com.dapeng.service;

import java.util.List;

import com.dapeng.domain.Bookmark;
import com.dapeng.service.bo.BookmarkBO;
import com.depeng.web.bo.BookmarkMiniBO;
import com.depeng.web.bo.CategoryWithBookmarkMiniBO;

public interface BookmarkService {
    // 获取书签数目
    int countBookmark(String userid);
    
    // 查看书签列表
    List<CategoryWithBookmarkMiniBO> selectBookmarkList(String userid);

    // 查找同一类别的书签
    List<Bookmark> selectBookmarkListByCategoryid(int categoryid);

    // 查看回收站列表
    List<BookmarkMiniBO> selectrecycleList(String userid);

    // 根据id查找书签
    BookmarkBO selectTagsAndDescByBookmarkNo(String userid, int bookmarkno);

    // 插入书签
    int insertBookmark(BookmarkBO bookmarkbo);

    // 逻辑删除 放入回收站
    int deleteBookmarkByUnique(String userid, int bookmarkno);

    // 物理删除
    int deletePhysicsBookmarkById(String userid, int bookmarkno);

    // 更新书签 todo 未使用
    int updateBookmarkById(int id);

    // 从回收站恢复书签
    int doRecoverBookmark(String userid, int bookmarkno);

    // 更新书签
    int updateBookmark(BookmarkBO bo);

    // 设置热门书签
    int setHotbookmark(BookmarkBO bo);

    // 取消热门书签
    int cancelHotbookmark(BookmarkBO bo);

    List<BookmarkMiniBO> selectHotBookmarkList(String userid);

    // 更新书签的排序
    void updateBookmarkSort(BookmarkBO bo);

    List<BookmarkMiniBO> getBookmarkListByTag(String userid, String tag);
}
