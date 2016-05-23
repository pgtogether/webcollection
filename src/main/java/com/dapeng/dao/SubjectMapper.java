package com.dapeng.dao;

import com.dapeng.domain.Subject;

public interface SubjectMapper {
    int deleteByPrimaryKey(Integer subjectid);

    int insert(Subject record);

    int insertSelective(Subject record);

    Subject selectByPrimaryKey(Integer subjectid);

    int updateByPrimaryKeySelective(Subject record);

    int updateByPrimaryKey(Subject record);
    
    int updateSubjectByUnique(Subject record);
    
    int selectNextSubjectno(String userid);
    
}