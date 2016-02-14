/**   
 * @Title: SetCategoryPswForm.java 
 * @Package: com.dapeng.controller.form 
 * @Description: TODO
 * @author jiangdp  
 * @date 2016年1月28日 下午6:43:15 
 */

package com.dapeng.controller.form;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * @Description
 * @author jiangdp
 * @date 2016年1月28日 下午6:43:15
 */
public class SetCategoryPswForm {

    @NotEmpty(message = "请输入 分类密码")
    private String categorypsw;

    @NotEmpty(message = "请输入确认 密码")
    private String confirmcategorypsw;

    public String getCategorypsw() {
        return categorypsw;
    }

    public void setCategorypsw(String categorypsw) {
        this.categorypsw = categorypsw;
    }

    public String getConfirmcategorypsw() {
        return confirmcategorypsw;
    }

    public void setConfirmcategorypsw(String confirmcategorypsw) {
        this.confirmcategorypsw = confirmcategorypsw;
    }

}
