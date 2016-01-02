package com.dapeng.service.bo;

/**
 * 标签实体类
 */
public class TagsBO {
    
    private Integer tagid;

    private String tagname;

    private Integer tagnum;
    
    private String userid;
    
    private Integer tagno;

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

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public Integer getTagno() {
        return tagno;
    }

    public void setTagno(Integer tagno) {
        this.tagno = tagno;
    }
    
    
}
