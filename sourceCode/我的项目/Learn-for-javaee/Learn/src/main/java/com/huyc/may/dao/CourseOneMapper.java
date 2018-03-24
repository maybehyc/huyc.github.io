package com.huyc.may.dao;

import java.util.List;

import com.huyc.may.entity.CourseOne;

public interface CourseOneMapper {
    int deleteByPrimaryKey(String courseOneId);

    int insert(CourseOne record);

    int insertSelective(CourseOne record);

    CourseOne selectByPrimaryKey(String courseOneId);

    int updateByPrimaryKeySelective(CourseOne record);

    int updateByPrimaryKey(CourseOne record);
    
    List<CourseOne> selectList();
}