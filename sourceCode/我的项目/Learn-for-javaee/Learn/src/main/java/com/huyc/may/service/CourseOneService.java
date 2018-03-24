package com.huyc.may.service;

import java.util.List;

import com.huyc.may.entity.CourseOne;

public interface CourseOneService {
	public int insert(CourseOne obj);
	public List<CourseOne> queryAll();
}
