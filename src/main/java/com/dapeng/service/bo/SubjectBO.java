/**
 * 
 */
package com.dapeng.service.bo;

import java.util.Date;

/**
 * 专题BO
 */
public class SubjectBO {
    private Integer subjectid;

    private String subjectname;

    private String userid;

    private Integer subjectno;

    private Date createtime;

    private Date updatetime;

    private String subjectdesc;

    private String extendcol1;

    private String extendcol2;

    private String extendcol3;

    public Integer getSubjectid() {
        return subjectid;
    }

    public void setSubjectid(Integer subjectid) {
        this.subjectid = subjectid;
    }

    public String getSubjectname() {
        return subjectname;
    }

    public void setSubjectname(String subjectname) {
        this.subjectname = subjectname;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public Integer getSubjectno() {
        return subjectno;
    }

    public void setSubjectno(Integer subjectno) {
        this.subjectno = subjectno;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public String getSubjectdesc() {
        return subjectdesc;
    }

    public void setSubjectdesc(String subjectdesc) {
        this.subjectdesc = subjectdesc;
    }

    public String getExtendcol1() {
        return extendcol1;
    }

    public void setExtendcol1(String extendcol1) {
        this.extendcol1 = extendcol1;
    }

    public String getExtendcol2() {
        return extendcol2;
    }

    public void setExtendcol2(String extendcol2) {
        this.extendcol2 = extendcol2;
    }

    public String getExtendcol3() {
        return extendcol3;
    }

    public void setExtendcol3(String extendcol3) {
        this.extendcol3 = extendcol3;
    }

}
