package com.example.mapper;

import com.example.entity.Orders;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 操作orders相关数据接口
 */
public interface OrdersMapper {

    int insert(Orders orders);

    int deleteById(Integer id);

    int updateById(Orders orders);

    Orders selectById(Integer id);

    List<Orders> selectAll(Orders orders);

    @Select("select * from orders where status = 'Completed' or status = 'Commented'")
    List<Orders> selectAllOKOrders();

}