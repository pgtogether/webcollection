package com.dapeng.domain;

public class UserBindTags {
    private Integer tagno;

    private Integer tagid;

    private String userid;

    private Integer usetimes;

    public Integer getTagno() {
        return tagno;
    }

    public void setTagno(Integer tagno) {
        this.tagno = tagno;
    }

    public Integer getTagid() {
        return tagid;
    }

    public void setTagid(Integer tagid) {
        this.tagid = tagid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public Integer getUsetimes() {
        return usetimes;
    }

    public void setUsetimes(Integer usetimes) {
        this.usetimes = usetimes;
    }
}