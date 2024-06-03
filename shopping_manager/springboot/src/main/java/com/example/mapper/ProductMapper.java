package com.example.mapper;

import com.example.entity.Product;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 操作category相关数据接口
*/
public interface ProductMapper {

    int insert(Product product);

    /**
     * 删除
     */
    int deleteById(Integer id);

    /**
     * 修改
     */
    int updateById(Product product);

    /**
     * 根据ID查询
     */
    Product selectById(Integer id);

    /**
     * 查询所有
     */
    List<Product> selectAll(Product product);

    @Select("select * from product where category_id = #{id}")
    List<Product> selectByCategoryId(Integer id);

    @Select("select * from product where seller_id = #{id}")
    List<Product> selectBySellerId(Integer id);

    @Select("select * from product where name like concat('%', #{name}, '%')")
    List<Product> selectByName(String name);

    @Select("select * from product order by count desc limit 12")
    List<Product> selectTop12();

    void increaseProductSales(@Param("productId") Integer productId);

}