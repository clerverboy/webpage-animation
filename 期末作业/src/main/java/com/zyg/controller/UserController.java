package com.zyg.controller;

import com.zyg.pojo.User;
import com.zyg.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    //检验用户名是否存在
    @RequestMapping("/checkUserName")
    @ResponseBody
    public String checkUserName(String username){
        User user = userService.queryPwd(username);
        String msg = "";
        if(user == null){
            msg = "用户名不存在";
        }else{
            msg = "用户名已存在";
        }
        return msg;
    }

    //登录验证
    @RequestMapping("/login")
    public String login(User user, Model model, HttpSession session){
        User user1 = userService.queryPwd(user.getUsername());
        if(user1 == null){
            model.addAttribute("msg","用户名不存在！");
        } else {
            if(user1.getPwd().equals(user.getPwd())){
                session.setAttribute("userNameInfo",user1.getName());
                session.setAttribute("userAddressInfo",user1.getAddress());
                session.setAttribute("userIdInfo",user1.getId());
                return "redirect:/";
            }else{
                model.addAttribute("msg","用户名或密码有误！");
            }
        }
        return "login";
    }

    //跳转到登录界面
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    //跳转到注册界面
    @RequestMapping("/toRegist")
    public String toRegist(){
        return "register";
    }

    //实现注册
    @RequestMapping("/regist")
    public String regist(User user){
        userService.addUser(user);
        return "redirect:/toLogin";
    }

    //退出登录
    @RequestMapping("/exit")
    public String exit(HttpSession session){
        session.removeAttribute("userNameInfo");
        session.removeAttribute("userIdInfo");
        session.removeAttribute("userAddressInfo");
        return "redirect:/";
    }

    //跳转到个人中心
    @RequestMapping("/toInfo")
    public String toInfo(){
        return "info";
    }

}
