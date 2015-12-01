package com.dapeng.service.bo;

import java.util.Date;

/**
 * 书签实体类
 * 
 * @author Administrator
 * 
 */
public class BookmarkBO {

    private int bookmarkid;

    private String bookmarkname;

    private String url;

    private String permission;

    private int categoryid;

    /**
     * 访问次数
     */
    private int usetimes;

    private String fastletters;

    private String pinyinhead;

    private Date createtime;

    private Date lastusetime;

    private Date updatetime;

    private String description;

    private int sort;

    private String hot;

    private String deleteflg;

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

    public int getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}

    public int getUsetimes() {
        return usetimes;
    }

    public void setUsetimes(int usetimes) {
        this.usetimes = usetimes;
    }

    public String getFastletters() {
        return fastletters;
    }

    public void setFastletters(String fastletters) {
        this.fastletters = fastletters;
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

}
