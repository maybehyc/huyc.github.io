package com.huyc.may.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;  
  
import com.huyc.may.dao.UserMapper;  
import com.huyc.may.entity.User;  
import com.huyc.may.service.UserSercice;  
  
@Service("userService")  
public class UserServiceImpl implements UserSercice {  
    @Resource  
    private UserMapper userDao;  
    public User getUserByNameAndPassword(String userName, String password) {  
        // TODO Auto-generated method stub  
        return this.userDao.selectByPrimaryKey(userName, password);  
    } 
} 
