package com.dapeng.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dapeng.dao.SubjectMapper;
import com.dapeng.domain.Subject;
import com.dapeng.service.SubjectService;
import com.dapeng.service.bo.SubjectBO;

@Service
public class SubjectServiceImpl implements SubjectService {

    @Autowired
    private SubjectMapper subjectDao;

    /**
     * 新增专题
     */
    @Override
    public int addSubject(SubjectBO bo) {
        // 获取下一个专题编号
        int nextSubjectNo = subjectDao.selectNextSubjectno(bo.getUserid());
        Subject subject = new Subject();
        subject.setUserid(bo.getUserid());
        subject.setSubjectname(bo.getSubjectname());
        subject.setSubjectno(nextSubjectNo);
        subject.setSubjectdesc(bo.getSubjectdesc());
        Date date = new Date();
        subject.setUpdatetime(date);
        subject.setCreatetime(date);
        int result = subjectDao.insert(subject);
        if (result > 0) {
            return nextSubjectNo;
        } else {
            return 0;
        }
    }

    /**
     * 更新专题
     */
    @Override
    public int updateSubjectByUnique(SubjectBO bo) {
        Subject subject = new Subject();
        subject.setUserid(bo.getUserid());
        subject.setSubjectno(bo.getSubjectno());
        subject.setSubjectname(bo.getSubjectname());
        subject.setUpdatetime(new Date());
        return subjectDao.updateSubjectByUnique(subject);
    }

}
