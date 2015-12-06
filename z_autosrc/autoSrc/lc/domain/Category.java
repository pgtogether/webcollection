package lc.domain;

import java.util.Date;

public class Category {
    private String categoryid;

    private String categoryname;

    private String categorytype;

    private String parentcategoryid;

    private String categorypermission;

    private String categorypsw;

    private Date createtime;

    private Date updatetime;

    public String getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(String categoryid) {
        this.categoryid = categoryid == null ? null : categoryid.trim();
    }

    public String getCategoryname() {
        return categoryname;
    }

    public void setCategoryname(String categoryname) {
        this.categoryname = categoryname == null ? null : categoryname.trim();
    }

    public String getCategorytype() {
        return categorytype;
    }

    public void setCategorytype(String categorytype) {
        this.categorytype = categorytype == null ? null : categorytype.trim();
    }

    public String getParentcategoryid() {
        return parentcategoryid;
    }

    public void setParentcategoryid(String parentcategoryid) {
        this.parentcategoryid = parentcategoryid == null ? null : parentcategoryid.trim();
    }

    public String getCategorypermission() {
        return categorypermission;
    }

    public void setCategorypermission(String categorypermission) {
        this.categorypermission = categorypermission == null ? null : categorypermission.trim();
    }

    public String getCategorypsw() {
        return categorypsw;
    }

    public void setCategorypsw(String categorypsw) {
        this.categorypsw = categorypsw == null ? null : categorypsw.trim();
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
}