/**
 * 
 */
package com.dapeng.service.bo;

/**
 * 业务用CategoryBO
 */
public class CategoryBO {
    private int categoryid;

    private String categoryname;

    private String categorytype;

    private int parentcategoryid;

    private String categorypermission;

    private String categorypsw;
    
    private String userid;
    
    private String categoryno;
    
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

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getCategoryno() {
        return categoryno;
    }

    public void setCategoryno(String categoryno) {
        this.categoryno = categoryno;
    }

}
