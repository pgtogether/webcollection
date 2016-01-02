package com.dapeng.dao;

import com.dapeng.domain.Tags;

public interface TagsMapper {
    
    int deleteByPrimaryKey(Integer tagid);

    int insert(Tags record);

    int insertSelective(Tags record);

    Tags selectByPrimaryKey(Integer tagid);
    
    Tags selectByTagName(String tagname);

    int updateByPrimaryKeySelective(Tags record);

    int updateByPrimaryKey(Tags record);
    
    int getLastInsertId();
}