package com.huyc.may.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.huyc.may.dao.CourseTwoMapper;
import com.huyc.may.entity.CourseTwo;
import com.huyc.may.service.CourseTwoService;

@Service("courseTwo")
public class CourseTwoServiceImpl implements CourseTwoService {
	@Resource  
    private CourseTwoMapper courseMapper;
	
	public int insert(CourseTwo obj) {
		return this.courseMapper.insert(obj);
	}
	
	public List<CourseTwo> queryAll() {
		return this.courseMapper.selectList();
	}
}
