package com.huyc.may.dao;

import java.util.List;

import com.huyc.may.entity.CourseTwo;

public interface CourseTwoMapper {
    int deleteByPrimaryKey(String courseTwoId);

    int insert(CourseTwo record);

    int insertSelective(CourseTwo record);

    CourseTwo selectByPrimaryKey(String courseTwoId);

    int updateByPrimaryKeySelective(CourseTwo record);

    int updateByPrimaryKey(CourseTwo record);
    
    List<CourseTwo> selectList();
}