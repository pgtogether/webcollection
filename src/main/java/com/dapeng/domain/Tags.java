package com.dapeng.domain;

public class Tags {
    private Integer tagid;

    private String tagname;

    private Integer tagnum;

    public Integer getTagid() {
        return tagid;
    }

    public void setTagid(Integer tagid) {
        this.tagid = tagid;
    }

    public String getTagname() {
        return tagname;
    }

    public void setTagname(String tagname) {
        this.tagname = tagname == null ? null : tagname.trim();
    }

    public Integer getTagnum() {
        return tagnum;
    }

    public void setTagnum(Integer tagnum) {
        this.tagnum = tagnum;
    }
}