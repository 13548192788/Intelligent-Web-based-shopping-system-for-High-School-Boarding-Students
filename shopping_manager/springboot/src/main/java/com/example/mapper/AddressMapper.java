package com.example.mapper;

import com.example.entity.Address;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 操作address相关数据接口
 */
public interface AddressMapper {

    int insert(Address address);

    int deleteById(Integer id);

    int updateById(Address address);

    Address selectById(Integer id);

    List<Address> selectAll(Address address);

}