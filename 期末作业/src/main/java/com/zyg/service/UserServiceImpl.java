package com.zyg.service;

import com.zyg.mapper.UserMapper;
import com.zyg.pojo.User;

public class UserServiceImpl implements UserService {

    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public User queryPwd(String username) {
        return userMapper.queryPwd(username);
    }
    public int addUser(User user){return userMapper.addUser(user);}
}
