package com.dapeng.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dapeng.dao.BookmarkMapper;
import com.dapeng.domain.Bookmark;
import com.dapeng.service.BookmarkService;
import com.dapeng.service.bo.BookmarkBO;

@Service
public class BookmarkServiceImpl implements BookmarkService {
    @Autowired
    private BookmarkMapper bookmarkDao;

    @Override
    public List<Bookmark> selectBookmarkList() {
        return bookmarkDao.selectBookmarkList();
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.dapeng.service.BookmarkService#selectBookmarkListByCategoryid(int)
     */
    @Override
    public List<Bookmark> selectBookmarkListByCategoryid(int categoryid) {

        return bookmarkDao.selectBookmarkListByCategoryid(categoryid);
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
    public List<Bookmark> selectrecycleList() {
        return bookmarkDao.selectrecycleList();
    }

    // 从回收站恢复书签
    @Override
    public int doRecoverBookmark(int id) {
        return bookmarkDao.doRecoverBookmark(id);
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.dapeng.service.BookmarkService#setHotbookmark(com.dapeng.service.
     * bo.BookmarkBO)
     */
    @Override
    public int setHotbookmark(BookmarkBO bo) {
        Bookmark bm = new Bookmark();
        bm.setBookmarkid(bo.getBookmarkid());
        return bookmarkDao.setHotbookmark(bm);
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.dapeng.service.BookmarkService#cancelHotbookmark(com.dapeng.service
     * .bo.BookmarkBO)
     */
    @Override
    public int cancelHotbookmark(BookmarkBO bo) {
        Bookmark bm = new Bookmark();
        bm.setBookmarkid(bo.getBookmarkid());
        return bookmarkDao.cancelHotbookmark(bm);
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.dapeng.service.BookmarkService#selectHotBookmarkList(com.dapeng.service
     * .bo.BookmarkBO)
     */
    @Override
    public List<Bookmark> selectHotBookmarkList() {
        return bookmarkDao.selectHotBookmarkList();
    }

}
