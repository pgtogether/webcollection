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
import com.dapeng.constants.CategoryTypeEnum;
import com.dapeng.dao.BookmarkMapper;
import com.dapeng.dao.UserTagsMapper;
import com.dapeng.dao.UserTagsTempMapper;
import com.dapeng.domain.Bookmark;
import com.dapeng.domain.UserTags;
import com.dapeng.service.BookmarkService;
import com.dapeng.service.bo.BookmarkBO;
import com.dapeng.util.DateUtils;
import com.dapeng.util.StringUtils;
import com.depeng.web.bo.BookmarkMiniBO;
import com.depeng.web.bo.CategoryWithBookmarkMiniBO;

@Service
public class BookmarkServiceImpl implements BookmarkService {

    @Autowired
    private BookmarkMapper bookmarkDao;

    @Autowired
    private UserTagsTempMapper userBindTagsDao;

    @Autowired
    private UserTagsMapper userTagsDao;

    @Override
    public int countBookmark(String userid) {
        Bookmark bookmark = new Bookmark();
        bookmark.setUserid(userid);
        bookmark.setDeleteflg(BookmarkDeleteEnum.NORMAL_SHOW.getId());
        return bookmarkDao.countBookmark(bookmark);
    }

    @Override
    public List<CategoryWithBookmarkMiniBO> selectBookmarkList(String userid) {
        List<CategoryWithBookmarkMiniBO> showList = null;
        BookmarkBO record = new BookmarkBO();
        record.setUserid(userid);
        record.setCategorytype(CategoryTypeEnum.DEFAULT_CATEGORY_TYPE.getId());
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
                    withBO.setPc(bo.getParentcategoryno());
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
    public BookmarkBO selectTagsAndDescByBookmarkNo(String userid, int bookmarkno) {
        Bookmark bookmark = new Bookmark();
        bookmark.setUserid(userid);
        bookmark.setBookmarkno(bookmarkno);
        return bookmarkDao.selectTagsAndDescByBookmarkNo(bookmark);
    }

    @Override
    public int insertBookmark(BookmarkBO bookmarkbo) {
        // 获取最大的书签编号
        int maxBookmarkNo = bookmarkDao.selectMaxBookmarkNoByUserId(bookmarkbo.getUserid()) + 1;

        // 获取最大排序号
        Bookmark record = new Bookmark();
        record.setUserid(bookmarkbo.getUserid());
        record.setCategoryno(bookmarkbo.getCategoryno());
        int maxSort = bookmarkDao.selectMaxSortByCategory(record) + 1;

        // 插入标签
        String tags = bookmarkbo.getTags();
        String insertTags = "";
        if (StringUtils.isNotEmpty(tags)) {
            StringBuffer newTags = new StringBuffer("");
            // 拆分标签
            String[] tagArray = tags.replaceAll("，", ",").split(",");
            for (String tagname : tagArray) {
                // 查询书签是否存在
                UserTags userTags = new UserTags();
                userTags.setUserid(bookmarkbo.getUserid());
                userTags.setTagname(tagname);
                UserTags checkTag = userTagsDao.selectUserTagsByTagName(userTags);
                if (checkTag != null) {
                    // 存在关联次数+1
                    UserTags updateTag = new UserTags();
                    updateTag.setUserid(bookmarkbo.getUserid());
                    updateTag.setTagno(checkTag.getTagno());
                    updateTag.setTagnum(checkTag.getTagnum() + 1);
                    userTagsDao.updateByUniqueKey(updateTag);
                    // 记录TagId
                    newTags.append(String.valueOf(checkTag.getTagno()));
                    newTags.append(",");
                } else {
                    // 不存在插入
                    UserTags addTag = new UserTags();
                    addTag.setUserid(bookmarkbo.getUserid());
                    int tagno = userTagsDao.selectMaxTagNo(bookmarkbo.getUserid()) + 1;
                    addTag.setTagno(tagno);
                    addTag.setTagname(tagname);
                    addTag.setTagnum(1);
                    addTag.setUsetimes(0);
                    userTagsDao.insert(addTag);
                    // 记录TagId
                    newTags.append(String.valueOf(tagno));
                    newTags.append(",");
                }
            }
            insertTags = newTags.toString().substring(0, newTags.length() - 1);
        }
        Bookmark bookmark = new Bookmark();
        bookmark.setUserid(bookmarkbo.getUserid());
        bookmark.setSort(maxSort);
        bookmark.setBookmarkno(maxBookmarkNo);
        bookmark.setBookmarkname(bookmarkbo.getBookmarkname());
        bookmark.setUrl(bookmarkbo.getUrl());
        bookmark.setPermission(BookmarkPermissionEnum.PRIVATEE.getId());
        bookmark.setCategoryno(bookmarkbo.getCategoryno());
        bookmark.setTags(insertTags);
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
    public int deletePhysicsBookmarkById(String userid, int bookmarkno) {
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
    public int updateBookmark(BookmarkBO bookmarkbo) {
        // 原有便签组
        Bookmark bookmark = new Bookmark();
        bookmark.setUserid(bookmarkbo.getUserid());
        bookmark.setBookmarkno(bookmarkbo.getBookmarkno());
        Bookmark oldTags = bookmarkDao.selectByUniqueKey(bookmark);
        List<String> oldTagList = new ArrayList<String>();
        if (oldTags != null) {
            if (StringUtils.isNotEmpty(oldTags.getTags())) {
                String[] tagArray = oldTags.getTags().split(",");
                for (String tag : tagArray) {
                    oldTagList.add(tag);
                }
            }
        }

        // 判断标签是否有变化
        // 如果有新增的插入，如果有删除的删除
        String tags = bookmarkbo.getTags();
        String insertTags = "";
        if (StringUtils.isNotEmpty(tags)) {
            StringBuffer newTags = new StringBuffer("");
            // 拆分标签
            String[] tagArray = tags.replaceAll("，", ",").split(",");
            for (String tagname : tagArray) {
                // 查询书签是否存在
                UserTags userTags = new UserTags();
                userTags.setUserid(bookmarkbo.getUserid());
                userTags.setTagname(tagname);
                UserTags checkTag = userTagsDao.selectUserTagsByTagName(userTags);
                if (checkTag != null) {
                    // 记录TagId
                    String tagnoStr = String.valueOf(checkTag.getTagno());
                    oldTagList.remove(tagnoStr);
                    newTags.append(tagnoStr);
                    newTags.append(",");
                } else {
                    // 不存在插入
                    UserTags addTag = new UserTags();
                    addTag.setUserid(bookmarkbo.getUserid());
                    int tagno = userTagsDao.selectMaxTagNo(bookmarkbo.getUserid()) + 1;
                    addTag.setTagno(tagno);
                    addTag.setTagname(tagname);
                    addTag.setTagnum(1);
                    addTag.setUsetimes(0);
                    userTagsDao.insert(addTag);
                    // 记录TagId
                    newTags.append(String.valueOf(tagno));
                    newTags.append(",");
                }
            }
            insertTags = newTags.toString().substring(0, newTags.length() - 1);
        }

        // 如果有标签在编辑时删除了
        if (oldTagList.size() > 0) {
            // 把本标签关联书签的次数-1
            for (String tagno : oldTagList) {
                UserTags updateTag = new UserTags();
                updateTag.setUserid(bookmarkbo.getUserid());
                updateTag.setTagno(Integer.valueOf(tagno));
                userTagsDao.minusTagNum(updateTag);
            }
        }
        // 如果书签关联书签的次数为0，删除该标签
        userTagsDao.deleteTagNumEqualsZero(bookmarkbo.getUserid());

        Bookmark updatebookmark = new Bookmark();
        updatebookmark.setUserid(bookmarkbo.getUserid());
        updatebookmark.setBookmarkno(bookmarkbo.getBookmarkno());
        updatebookmark.setBookmarkname(bookmarkbo.getBookmarkname());
        updatebookmark.setUrl(bookmarkbo.getUrl());
        updatebookmark.setUpdatetime(new Date());
        updatebookmark.setTags(insertTags.toString());
        updatebookmark.setDescription(bookmarkbo.getDescription());
        return bookmarkDao.updateBookmarkByUnique(updatebookmark);
    }

    // 回收站
    @Override
    public List<BookmarkMiniBO> selectrecycleList(String userid) {
        return bookmarkDao.selectrecycleList(userid);
    }

    // 从回收站恢复书签
    @Override
    public int doRecoverBookmark(String userid, int bookmarkno) {
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

    @Override
    public void updateBookmarkSort(BookmarkBO bo) {
        String sortlist = bo.getSortlist();
        int categoryno = bo.getCategoryno();
        String[] sortArray = sortlist.split(",");
        Date sysDate = DateUtils.getSysDate();
        List<Bookmark> list = new ArrayList<Bookmark>();
        int listLength = sortArray.length;
        for (int i = 0; i < listLength; i++) {
            String bookmarkno = sortArray[i].split("_")[1];
            Bookmark bookmark = new Bookmark();
            bookmark.setUserid(bo.getUserid());
            bookmark.setCategoryno(categoryno);
            bookmark.setSort(listLength - i);
            bookmark.setUpdatetime(sysDate);
            bookmark.setBookmarkno(Integer.valueOf(bookmarkno));
            list.add(bookmark);
        }
        bookmarkDao.batchUpdateBookmarkSort(list);
    }

    @Override
    public List<BookmarkMiniBO> getBookmarkListByTag(String userid, String tagno) {
        Bookmark bookmark = new Bookmark();
        bookmark.setUserid(userid);
        bookmark.setTags(tagno);
        bookmark.setDeleteflg(BookmarkDeleteEnum.NORMAL_SHOW.getId());
        return bookmarkDao.getBookmarkListByTag(bookmark);
    }

}
