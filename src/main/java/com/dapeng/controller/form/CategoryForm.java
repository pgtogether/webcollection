
/**   
 * @Title: CategoryForm.java 
 * @Package: com.dapeng.controller.form 
 * @Description: TODO
 * @author jiangdp  
 * @date 2015年12月6日 下午5:24:53 
 */


package com.dapeng.controller.form;

/** 
 * @Description 
 * @author jiangdp
 * @date 2015年12月6日 下午5:24:53 
 */

public class CategoryForm {

    private String categoryid;
   
    private String categoryname;

    private String categorypermission;
    
    private String categorypsw;
    
    private String categorypswagain;
    
    public String getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(String categoryid) {
        this.categoryid = categoryid;
    }

    public String getCategoryname() {
        return categoryname;
    }

    public void setCategoryname(String categoryname) {
        this.categoryname = categoryname;
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

    public String getCategorypswagain() {
        return categorypswagain;
    }

    public void setCategorypswagain(String categorypswagain) {
        this.categorypswagain = categorypswagain;
    }
    
    
}
