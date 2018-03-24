package com.huyc.may.dao;

import com.huyc.may.entity.User;

public interface UserMapper {
    int deleteByPrimaryKey(String userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String userName, String password);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}