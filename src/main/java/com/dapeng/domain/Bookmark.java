package com.dapeng.domain;

import java.util.Date;

/**
 * 书签实体类
 * 
 * @author Administrator
 * 
 */
public class Bookmark {

    private int bookmarkid;

    private String bookmarkname;

    private String url;

    private String permission;

    private int categoryno;
    
    private int subjectno;
    
    private int usetimes;

    private String pinyin;

    private String pinyinhead;

    private Date createtime;

    private Date lastusetime;

    private Date updatetime;

    private String description;

    private int sort;

    private String hot;

    private String deleteflg;

    private String userid;

    private int bookmarkno;

    private String tags;

    public int getBookmarkid() {
        return bookmarkid;
    }

    public void setBookmarkid(int bookmarkid) {
        this.bookmarkid = bookmarkid;
    }

    public String getBookmarkname() {
        return bookmarkname;
    }

    public void setBookmarkname(String bookmarkname) {
        this.bookmarkname = bookmarkname;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public int getCategoryno() {
        return categoryno;
    }

    public void setCategoryno(int categoryno) {
        this.categoryno = categoryno;
    }

    public void setBookmarkno(int bookmarkno) {
        this.bookmarkno = bookmarkno;
    }

    public int getUsetimes() {
        return usetimes;
    }

    public void setUsetimes(int usetimes) {
        this.usetimes = usetimes;
    }

    public String getPinyin() {
        return pinyin;
    }

    public void setPinyin(String pinyin) {
        this.pinyin = pinyin;
    }

    public String getPinyinhead() {
        return pinyinhead;
    }

    public void setPinyinhead(String pinyinhead) {
        this.pinyinhead = pinyinhead;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getLastusetime() {
        return lastusetime;
    }

    public void setLastusetime(Date lastusetime) {
        this.lastusetime = lastusetime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public String getHot() {
        return hot;
    }

    public void setHot(String hot) {
        this.hot = hot;
    }

    public String getDeleteflg() {
        return deleteflg;
    }

    public void setDeleteflg(String deleteflg) {
        this.deleteflg = deleteflg;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public int getBookmarkno() {
        return bookmarkno;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public int getSubjectno() {
        return subjectno;
    }

    public void setSubjectno(int subjectno) {
        this.subjectno = subjectno;
    }

}
