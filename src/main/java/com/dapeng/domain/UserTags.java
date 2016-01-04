package com.dapeng.domain;

public class UserTags {
    private Integer tagid;

    private Integer tagno;

    private String userid;

    private String tagname;

    private Integer usetimes;

    private Integer tagnum;

    public Integer getTagid() {
        return tagid;
    }

    public void setTagid(Integer tagid) {
        this.tagid = tagid;
    }

    public Integer getTagno() {
        return tagno;
    }

    public void setTagno(Integer tagno) {
        this.tagno = tagno;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public String getTagname() {
        return tagname;
    }

    public void setTagname(String tagname) {
        this.tagname = tagname == null ? null : tagname.trim();
    }

    public Integer getUsetimes() {
        return usetimes;
    }

    public void setUsetimes(Integer usetimes) {
        this.usetimes = usetimes;
    }

    public Integer getTagnum() {
        return tagnum;
    }

    public void setTagnum(Integer tagnum) {
        this.tagnum = tagnum;
    }
}