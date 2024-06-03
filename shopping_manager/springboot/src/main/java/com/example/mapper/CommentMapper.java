package com.example.mapper;

import com.example.entity.Comment;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 操作comment相关数据接口
 */
public interface CommentMapper {
    int insert(Comment comment);

    int deleteById(Integer id);

    int updateById(Comment comment);

    Comment selectById(Integer id);

    List<Comment> selectAll(Comment comment);

    @Select("select comment.*, user.avatar as userAvatar, user.name as userName from comment left join user on comment.user_id = user.id where comment.product_id = #{id}")
    List<Comment> selectByProductId(Integer id);
}