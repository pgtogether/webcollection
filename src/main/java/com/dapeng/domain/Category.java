package com.dapeng.domain;

import java.util.Date;

/**
 * 标签类别类
 * 
 * @author Administrator
 * 
 */
public class Category {

    private int categoryid;

    private String categoryname;

    private String categorytype;

    private int parentcategoryid;

    private String categorypermission;

    private String categorypsw;

    private Date createtime;

    private Date updatetime;
    
    private String userid;
    
    private int categoryno;
    
    private int sort;
    
    private String colno;

    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    public String getCategoryname() {
        return categoryname;
    }

    public void setCategoryname(String categoryname) {
        this.categoryname = categoryname;
    }

    public String getCategorytype() {
        return categorytype;
    }

    public void setCategorytype(String categorytype) {
        this.categorytype = categorytype;
    }

    public int getParentcategoryid() {
        return parentcategoryid;
    }

    public void setParentcategoryid(int parentcategoryid) {
        this.parentcategoryid = parentcategoryid;
    }

    public String getCategorypermission() {
        return categorypermission;
    }

    public void setCategorypermission(String categorypermission) {
        this.categorypermission = categorypermission;
    }

    public String getCategorypsw() {
        return categorypsw;
    }

    public void setCategorypsw(String categorypsw) {
        this.categorypsw = categorypsw;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public int getCategoryno() {
        return categoryno;
    }

    public void setCategoryno(int categoryno) {
        this.categoryno = categoryno;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public String getColno() {
        return colno;
    }

    public void setColno(String colno) {
        this.colno = colno;
    }
    
}
