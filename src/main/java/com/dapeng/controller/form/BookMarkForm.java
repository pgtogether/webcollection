/**
 * Project Name:webcollection
 * File Name:BookMarkForm.java
 * Package Name:com.dapeng.controller.form
 * Date:2015年12月1日上午12:31:07
 * Copyright (c) 2015, chenzhou1025@126.com All Rights Reserved.
 *
 */
/**
 * Project Name:webcollection
 * File Name:BookMarkForm.java
 * Package Name:com.dapeng.controller.form
 * Date:2015年12月1日上午12:31:07
 * Copyright (c) 2015, chenzhou1025@126.com All Rights Reserved.
 *
 */

package com.dapeng.controller.form;

import javax.validation.constraints.Digits;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.URL;

/**
 * ClassName:BookMarkForm <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON. <br/>
 * Date: 2015年12月1日 上午12:31:07 <br/>
 * 
 * @author jiangdp
 * @version
 * @since JDK 1.6
 * @see
 */
public class BookMarkForm {

    private String bookmarkno;

    @NotEmpty(message = "非法操作")
    @Digits(integer = 11, fraction = 0, message = "非法操作")
    private String categoryno;

    @NotEmpty(message = "请输入网址")
    @URL(message = "请输入合法的网址")
    private String url;

    @NotEmpty(message = "请输入名称")
    private String bookmarkname;

    private String tags;

    private String description;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getBookmarkname() {
        return bookmarkname;
    }

    public void setBookmarkname(String bookmarkname) {
        this.bookmarkname = bookmarkname;
    }

    public String getBookmarkno() {
        return bookmarkno;
    }

    public void setBookmarkno(String bookmarkno) {
        this.bookmarkno = bookmarkno;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategoryno() {
        return categoryno;
    }

    public void setCategoryno(String categoryno) {
        this.categoryno = categoryno;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

}
