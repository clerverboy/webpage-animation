package com.zyg.service;

import com.zyg.pojo.User;

public interface UserService {

    User queryPwd(String username);
    int addUser(User user);

}
