package com.dapeng.service.bo;

import java.util.List;

/**
 * 标签实体类
 */
public class UserBindTagsBO {

    private List<Integer> tagidlist;

    private String userid;

    public List<Integer> getTagidlist() {
        return tagidlist;
    }

    public void setTagidlist(List<Integer> tagidlist) {
        this.tagidlist = tagidlist;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

}
