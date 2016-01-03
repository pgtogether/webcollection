package com.dapeng.dao;

import com.dapeng.domain.Tags;
import com.dapeng.service.bo.TagsBO;

public interface TagsMapper {
    
    int deleteByPrimaryKey(Integer tagid);

    int insert(Tags record);

    int insertSelective(Tags record);

    Tags selectByPrimaryKey(Integer tagid);
    
    TagsBO selectTagsBOByTagName(TagsBO record);

    int updateByPrimaryKeySelective(Tags record);

    int updateByPrimaryKey(Tags record);
    
    int getLastInsertId();
}