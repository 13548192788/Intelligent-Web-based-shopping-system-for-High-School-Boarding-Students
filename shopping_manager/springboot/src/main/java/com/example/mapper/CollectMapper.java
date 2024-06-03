package com.example.mapper;

import com.example.entity.Collect;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 操作collect相关数据接口
 */
public interface CollectMapper {

    int insert(Collect collect);

    int deleteById(Integer id);

    int updateById(Collect collect);

    Collect selectById(Integer id);

    List<Collect> selectAll(Collect collect);

    @Select("select * from collect where user_id = #{userId} and product_id = #{productId}")
    Collect selectByUserIdAndProductId(@Param("userId") Integer userId, @Param("productId") Integer productId);
}