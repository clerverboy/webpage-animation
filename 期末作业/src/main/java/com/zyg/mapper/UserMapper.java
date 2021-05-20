package com.zyg.mapper;

import com.zyg.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    //查询用户的密码
    User queryPwd(@Param("username") String username);

    //添加一个用户名
    int addUser(User user);

}
