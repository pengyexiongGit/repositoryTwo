package com.jk.dao;

import com.jk.model.Tree;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ProductDao {

    @Select("select id,text,url,parentId from product_tree where parentId=#{id}")
    List<Tree> queryParentList(@Param("id") int i);
}
