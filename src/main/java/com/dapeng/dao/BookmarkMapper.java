﻿package com.dapeng.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dapeng.domain.Bookmark;
import com.dapeng.service.bo.BookmarkBO;
import com.depeng.web.bo.BookmarkMiniBO;

@Repository
public interface BookmarkMapper {

    int deleteByPrimaryKey(Integer bookmarkid);

    int insert(Bookmark record);

    int insertSelective(Bookmark record);

    Bookmark selectByPrimaryKey(Integer bookmarkid);

    Bookmark selectByUniqueKey(Bookmark record);

    int updateByPrimaryKeySelective(Bookmark record);

    int updateByPrimaryKey(Bookmark record);

    /**
     * 查找所有标签
     */
    List<BookmarkBO> selectBookmarkBOList(BookmarkBO record);

    /**
     * 查找分类下的书签
     */
    List<BookmarkMiniBO> selectBookmarkListByCategoryNo(Bookmark record);

    /**
     * 回收站列表
     * 
     * @return
     */
    List<BookmarkMiniBO> selectrecycleList(String userid);

    /**
     * 根据书签编号查询书签
     */
    BookmarkBO selectTagsAndDescByBookmarkNo(Bookmark record);

    /**
     * 添加书签
     * 
     * @param bookmark
     * @return
     */
    int insertBookmark(Bookmark bookmark);

    /**
     * 逻辑删除书签
     */
    int deleteBookmarkByUnique(Bookmark bookmark);

    /**
     * 物理删除书签
     * 
     * @param id
     * @return
     */

    int deletePhysicsBookmarkById(Bookmark bookmark);

    // 从回收站恢复书签
    int doRecoverBookmark(Bookmark bookmark);

    int updateBookmarkById(int id);

    // 根据唯一索引更新记录
    int updateBookmarkByUnique(Bookmark bookmark);

    // 设置热门书签 / 废弃
    // int setHotbookmark(Bookmark bookmark);

    // 取消热门书签 / 废弃
    // int cancelHotbookmark(Bookmark bookmark);

    // 查询所有热门书签
    List<BookmarkMiniBO> selectHotBookmarkList(Bookmark bookmark);

    // 获取用户下最大的书签编号
    int selectMaxBookmarkNoByUserId(String userId);

    // 获取用户指定分类下的书签最大的排序编号
    int selectMaxSortByCategory(Bookmark bookmark);
    
    // 获取用户指定专题下的书签最大的排序编号
    int selectMaxSortBySubject(Bookmark bookmark);

    // 批量更新分类排序
    void batchUpdateBookmarkSort(List<Bookmark> list);

    List<BookmarkMiniBO> getBookmarkListByTag(Bookmark bookmark);

    // 获取书签数目
    int countBookmark(Bookmark bookmark);

    int countBookmarkByCategory(Bookmark bookmark);
}