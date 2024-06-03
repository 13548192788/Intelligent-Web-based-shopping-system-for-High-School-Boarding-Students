package com.example.mapper;

import com.example.entity.Category;
import com.example.entity.Notice;

import java.util.List;

/**
 * 操作category相关数据接口
*/
public interface CategoryMapper {

    int insert(Category category);

    int deleteById(Integer id);

    int updateById(Category category);

    Category selectById(Integer id);

    List<Category> selectAll(Category category);

}
