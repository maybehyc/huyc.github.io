package com.huyc.may.service;

import com.huyc.may.entity.User;  
  
public interface UserSercice {  
	public User getUserByNameAndPassword(String userName, String password);
}  
