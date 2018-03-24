package com.huyc.may.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.huyc.may.dao.CourseOneMapper;
import com.huyc.may.entity.CourseOne;
import com.huyc.may.service.CourseOneService;

@Service("courseOne")
public class CourseOneServiceImpl implements CourseOneService {
	@Resource  
    private CourseOneMapper courseMapper;
	
	public int insert(CourseOne obj) {
		return this.courseMapper.insert(obj);
	}
	
	public List<CourseOne> queryAll() {
		return this.courseMapper.selectList();
	}
}
