package lc.dao;

import lc.domain.Category;

public interface CategoryMapper {
    int deleteByPrimaryKey(String categoryid);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(String categoryid);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);
}