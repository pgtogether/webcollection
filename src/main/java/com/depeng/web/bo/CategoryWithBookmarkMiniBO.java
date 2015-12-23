/**
 * Project Name:webcollection
 * File Name:BookmarkMiniBO.java
 * Package Name:com.depeng.web.bo
 * Date:2015年11月30日下午11:38:12
 * Copyright (c) 2015, chenzhou1025@126.com All Rights Reserved.
 *
 */
/**
 * Project Name:webcollection
 * File Name:BookmarkMiniBO.java
 * Package Name:com.depeng.web.bo
 * Date:2015年11月30日下午11:38:12
 * Copyright (c) 2015, chenzhou1025@126.com All Rights Reserved.
 *
 */

package com.depeng.web.bo;

import java.util.List;

/**
 * ClassName:BookmarkMiniBO <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON. <br/>
 * Date: 2015年11月30日 下午11:38:12 <br/>
 * 
 * @author jiangdp
 * @version
 * @since JDK 1.6
 * @see
 */
public class CategoryWithBookmarkMiniBO {
    // categoryno
    private int i;

    // categoryname
    private String n;

    // colno
    private String c;

    // bookmarklist
    private List<BookmarkMiniBO> list;

    public int getI() {
        return i;
    }

    public void setI(int i) {
        this.i = i;
    }

    public String getN() {
        return n;
    }

    public void setN(String n) {
        this.n = n;
    }

    public List<BookmarkMiniBO> getList() {
        return list;
    }

    public void setList(List<BookmarkMiniBO> list) {
        this.list = list;
    }

    public String getC() {
        return c;
    }

    public void setC(String c) {
        this.c = c;
    }

}
