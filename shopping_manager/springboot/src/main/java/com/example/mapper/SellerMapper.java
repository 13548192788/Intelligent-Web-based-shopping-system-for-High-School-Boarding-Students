package com.example.mapper;

import com.example.entity.Seller;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 操作admin相关数据接口
 * simple operation for data
*/
public interface SellerMapper {


    /**
     * 新增
     */
    int insert(Seller seller);

    /**
     * 删除
     */
    int deleteById(Integer id);

    /**
     * 修改
     */
    int updateById(Seller seller);

    /**
     * 根据ID查询
     */
    Seller selectById(Integer id);

    /**
     * 查询所有
     */
    List<Seller> selectAll(Seller seller);

    @Select("select * from seller where username = #{username}")
    Seller selectByUsername(String username);
}