package com.dapeng.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dapeng.constants.BookmarkDeleteEnum;
import com.dapeng.constants.BookmarkHotEnum;
import com.dapeng.constants.BookmarkPermissionEnum;
import com.dapeng.dao.BookmarkMapper;
import com.dapeng.domain.Bookmark;
import com.dapeng.service.BookmarkService;
import com.dapeng.service.bo.BookmarkBO;
import com.depeng.web.bo.BookmarkMiniBO;
import com.depeng.web.bo.CategoryWithBookmarkMiniBO;

@Service
public class BookmarkServiceImpl implements BookmarkService {

    @Autowired
    private BookmarkMapper bookmarkDao;

    @Override
    public List<CategoryWithBookmarkMiniBO> selectBookmarkList(String userid) {
        List<CategoryWithBookmarkMiniBO> showList = null;
        Bookmark record = new Bookmark();
        record.setUserid(userid);
        record.setDeleteflg(BookmarkDeleteEnum.NORMAL_SHOW.getId());
        List<BookmarkBO> list = bookmarkDao.selectBookmarkBOList(record);
        // 对数据结构进行转换，符合页面显示风格
        if (list != null && list.size() > 0) {
            // 页面显示用List
            showList = new ArrayList<CategoryWithBookmarkMiniBO>();
            // 按照categoryno分组
            Map<Integer, Integer> categoryMap = new HashMap<Integer, Integer>();
            for (BookmarkBO bo : list) {
                // 分类编号
                Integer categoryno = bo.getCategoryno();
                // 如果存在此分类编号，在此分类下追加书签
                if (categoryMap.containsKey(categoryno)) {
                    // 根据索引值获得相应的BO
                    CategoryWithBookmarkMiniBO withBO = showList.get(categoryMap.get(categoryno));
                    BookmarkMiniBO miniBO = new BookmarkMiniBO();
                    miniBO.setI(bo.getBookmarkno());
                    miniBO.setN(bo.getBookmarkname());
                    miniBO.setU(bo.getUrl());
                    miniBO.setH(bo.getHot());
                    withBO.getList().add(miniBO);
                } else {
                    // 新增分类以及书签
                    CategoryWithBookmarkMiniBO withBO = new CategoryWithBookmarkMiniBO();
                    withBO.setI(bo.getCategoryno());
                    withBO.setN(bo.getCategoryname());
                    withBO.setC(bo.getColno());
                    if (bo.getBookmarkno() != 0) {
                        List<BookmarkMiniBO> bookmarklist = new ArrayList<BookmarkMiniBO>();
                        BookmarkMiniBO miniBO = new BookmarkMiniBO();
                        miniBO.setI(bo.getBookmarkno());
                        miniBO.setN(bo.getBookmarkname());
                        miniBO.setU(bo.getUrl());
                        miniBO.setH(bo.getHot());
                        bookmarklist.add(miniBO);
                        withBO.setList(bookmarklist);
                    }
                    // 加入显示用List
                    showList.add(withBO);
                    // 记录新增分类索引
                    categoryMap.put(categoryno, showList.size() - 1);
                }
            }
        }
        return showList;
    }

    @Override
    public List<Bookmark> selectBookmarkListByCategoryid(int categoryid) {

        return bookmarkDao.selectBookmarkListByCategoryid(categoryid);
    }

    @Override
    public Bookmark selectBookmarkListById(int bookmarkId) {
        return bookmarkDao.selectBookmarkListById(bookmarkId);
    }

    @Override
    public int insertBookmark(BookmarkBO bookmarkbo) {
        // 获取最大的书签编号
        int maxBookmarkNo = bookmarkDao.selectMaxBookmarkNoByUserId(bookmarkbo.getUserid()) + 1;
        Bookmark bookmark = new Bookmark();
        bookmark.setUserid(bookmarkbo.getUserid());
        bookmark.setBookmarkno(maxBookmarkNo);
        bookmark.setBookmarkname(bookmarkbo.getBookmarkname());
        bookmark.setUrl(bookmarkbo.getUrl());
        bookmark.setPermission(BookmarkPermissionEnum.PRIVATEE.getId());
        bookmark.setCategoryno(bookmarkbo.getCategoryno());
        bookmark.setDescription(bookmarkbo.getDescription());
        bookmark.setHot(BookmarkHotEnum.NORMAL.getId());
        bookmark.setDeleteflg(BookmarkDeleteEnum.NORMAL_SHOW.getId());
        Date sys = new Date();
        bookmark.setCreatetime(sys);
        bookmark.setUpdatetime(sys);
        int row = bookmarkDao.insert(bookmark);
        if (row > 0) {
            return maxBookmarkNo;
        }
        return 0;
    }

    @Override
    public int deleteBookmarkByUnique(String userid, int bookmarkno) {
        Bookmark bookmark = new Bookmark();
        bookmark.setUserid(userid);
        bookmark.setBookmarkno(bookmarkno);
        bookmark.setDeleteflg(BookmarkDeleteEnum.LOGIC_DELETE.getId());
        return bookmarkDao.deleteBookmarkByUnique(bookmark);
    }

    @Override
    public int deletePhysicsBookmarkById(String userid,int bookmarkno) {
    	 Bookmark bookmark = new Bookmark();
         bookmark.setUserid(userid);
         bookmark.setBookmarkno(bookmarkno);
        return bookmarkDao.deletePhysicsBookmarkById(bookmark);
    }

    @Override
    public int updateBookmarkById(int id) {
        return bookmarkDao.updateBookmarkById(id);
    }

    @Override
    public int updateBookmark(BookmarkBO bo) {
        Bookmark bookmark = new Bookmark();
        bookmark.setUserid(bo.getUserid());
        bookmark.setBookmarkno(bo.getBookmarkno());
        bookmark.setBookmarkname(bo.getBookmarkname());
        bookmark.setUrl(bo.getUrl());
        bookmark.setUpdatetime(new Date());
        // bookmark.setTags(bo.getTags());
        bookmark.setDescription(bo.getDescription());
        return bookmarkDao.updateBookmarkByUnique(bookmark);
    }

    //回收站
    @Override
    public List<BookmarkMiniBO> selectrecycleList(String userid) {
        return bookmarkDao.selectrecycleList(userid);
    }

    // 从回收站恢复书签
    @Override
    public int doRecoverBookmark(String userid,int bookmarkno) {
    	Bookmark bookmark = new Bookmark();
    	bookmark.setBookmarkno(bookmarkno);
    	bookmark.setUserid(userid);
    	bookmark.setDeleteflg(BookmarkDeleteEnum.NORMAL_SHOW.getId());
        return bookmarkDao.doRecoverBookmark(bookmark);
    }

    // 标记为常用书签
    @Override
    public int setHotbookmark(BookmarkBO bo) {
        Bookmark bm = new Bookmark();
        bm.setUserid(bo.getUserid());
        bm.setBookmarkno(bo.getBookmarkno());
        bm.setHot(BookmarkHotEnum.HOT.getId());
        bm.setUpdatetime(new Date());
        return bookmarkDao.updateBookmarkByUnique(bm);
    }

    // 取消为常用书签
    @Override
    public int cancelHotbookmark(BookmarkBO bo) {
        Bookmark bm = new Bookmark();
        bm.setUserid(bo.getUserid());
        bm.setBookmarkno(bo.getBookmarkno());
        bm.setHot(BookmarkHotEnum.NORMAL.getId());
        bm.setUpdatetime(new Date());
        return bookmarkDao.updateBookmarkByUnique(bm);
    }

    @Override
    public List<BookmarkMiniBO> selectHotBookmarkList(String userid) {
        Bookmark bookmark = new Bookmark();
        bookmark.setUserid(userid);
        bookmark.setDeleteflg(BookmarkDeleteEnum.NORMAL_SHOW.getId());
        bookmark.setHot(BookmarkHotEnum.HOT.getId());
        return bookmarkDao.selectHotBookmarkList(bookmark);
    }

}
