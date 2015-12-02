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

    @NotEmpty(message = "网址不能为空")
    @URL(message = "网址不合法")
    private String url;

    @NotEmpty(message = "名称不能为空")
    private String bookmarkname;

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

}
