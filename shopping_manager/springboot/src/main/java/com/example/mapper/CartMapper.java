package com.example.mapper;

import com.example.entity.Cart;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 操作cart相关数据接口
 */
public interface CartMapper {

    int insert(Cart cart);

    int deleteById(Integer id);

    int updateById(Cart cart);

    Cart selectById(Integer id);

    List<Cart> selectAll(Cart cart);

    @Select("select * from cart where user_id = #{userId} and product_id = #{productId}")
    Cart selectByUserIdAndProductId(@Param("userId") Integer userId, @Param("productId") Integer productId);
}