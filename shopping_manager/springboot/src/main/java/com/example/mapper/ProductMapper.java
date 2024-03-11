package com.example.mapper;

import com.example.entity.Product;

import java.util.List;

/**
 * 操作category相关数据接口
*/
public interface ProductMapper {

    int insert(Product goods);

    /**
     * 删除
     */
    int deleteById(Integer id);

    /**
     * 修改
     */
    int updateById(Product goods);

    /**
     * 根据ID查询
     */
    Product selectById(Integer id);

    /**
     * 查询所有
     */
    List<Product> selectAll(Product goods);

}