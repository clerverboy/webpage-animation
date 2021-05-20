package com.zyg.controller;

import com.zyg.pojo.Milk;
import com.zyg.pojo.ShopCar;
import com.zyg.service.ShopCarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ShopCarController {

    @Autowired
    @Qualifier("ShopCarServiceImpl")
    private ShopCarService shopCarService;

    //将商品添加到购物车
    @RequestMapping("/addMilk")
    @ResponseBody
    public String addMilk(String name,int uid){
        Milk milkTemp = shopCarService.queryMilkByName(name);
        Map map = new HashMap();
        map.put("mid",milkTemp.getId());
        map.put("uid",uid);
        ShopCar shopCar = shopCarService.queryMilkById(map);

        int flag = 0;
        String msg = "";

        Map map1 = new HashMap();

        if(shopCar == null){
            flag = shopCarService.addMilk(new ShopCar(milkTemp.getId(),1,uid));
            if(flag > 0){
                msg = "添加成功";
            }else{
                msg = "添加失败";
            }
        }else{
            int number = shopCar.getNumber();
            number += 1;
            System.out.println(shopCar.getNumber());
            map1.put("number",number);
            map1.put("name",name);
            map1.put("uid",uid);

            flag = shopCarService.updateNumber(map1);
            if(flag > 0){
                msg = "添加成功";
            }else{
                msg = "添加失败";
            }
        }


        return msg;
    }

    //跳转到购物车界面
    @RequestMapping("/toShopCar")
    public String toShopCar(Model model, HttpSession session){
        List<Milk> milks = shopCarService.listAllMilk(Integer.parseInt(session.getAttribute("userIdInfo").toString()));
        int totalMoney = 0;
        for (Milk milk : milks) {
            totalMoney += milk.getPrice()*milk.getNumber();
        }
        model.addAttribute("totalMoney",totalMoney);
        model.addAttribute("milks",milks);
        return "shop-car";
    }

    //删除购物车的某商品
    @RequestMapping("/deleteMilk")
    public String deleteMilk(String name,Model model,HttpSession session) throws UnsupportedEncodingException {
        name = new String(name.getBytes("ISO-8859-1"),"UTF8");
        name = java.net.URLDecoder.decode(name,"UTF-8");
        shopCarService.deleteMilk(name);
        List<Milk> milks = shopCarService.listAllMilk(Integer.parseInt(session.getAttribute("userIdInfo").toString()));
        int totalMoney = 0;
        for (Milk milk : milks) {
            totalMoney += milk.getPrice()*milk.getNumber();
        }
        model.addAttribute("totalMoney",totalMoney);
        model.addAttribute("milks",milks);
        return "shop-car";
    }

    //减商品的数量
    @RequestMapping("/subNumber")
    public String subNumber(String name,Model model,HttpSession session) throws UnsupportedEncodingException {
        name = new String(name.getBytes("ISO-8859-1"),"UTF8");
        name = java.net.URLDecoder.decode(name,"UTF-8");
        Milk milk = shopCarService.queryMilkByName(name);
        Map map = new HashMap();
        map.put("mid",milk.getId());
        map.put("uid",Integer.parseInt(session.getAttribute("userIdInfo").toString()));
        ShopCar shopCar = shopCarService.queryMilkById(map);
        int number = shopCar.getNumber();
        Map map1 = new HashMap();
        if(number > 1){
            number -= 1;
            map1.put("number",number);
            map1.put("name",name);
            map1.put("uid",Integer.parseInt(session.getAttribute("userIdInfo").toString()));
            shopCarService.updateNumber(map1);
        }
        List<Milk> milks = shopCarService.listAllMilk(Integer.parseInt(session.getAttribute("userIdInfo").toString()));

        int totalMoney = 0;
        for (Milk milkList : milks) {
            totalMoney += milkList.getPrice()*milkList.getNumber();
        }
        model.addAttribute("totalMoney",totalMoney);
        model.addAttribute("milks",milks);
        return "shop-car";
    }

    //加购物车中商品的数量
    @RequestMapping("/addNumber")
    public String addNumber(String name,Model model,HttpSession session) throws UnsupportedEncodingException {
        name = new String(name.getBytes("ISO-8859-1"),"UTF8");
        name = java.net.URLDecoder.decode(name,"UTF-8");
        Milk milk = shopCarService.queryMilkByName(name);
        Map m = new HashMap();
        m.put("mid",milk.getId());
        m.put("uid",Integer.parseInt(session.getAttribute("userIdInfo").toString()));
        ShopCar shopCar = shopCarService.queryMilkById(m);
        int number = shopCar.getNumber();
        Map map = new HashMap();
        number += 1;
        map.put("number",number);
        map.put("name",name);
        map.put("uid",Integer.parseInt(session.getAttribute("userIdInfo").toString()));
        shopCarService.updateNumber(map);
        List<Milk> milks = shopCarService.listAllMilk(Integer.parseInt(session.getAttribute("userIdInfo").toString()));

        int totalMoney = 0;
        for (Milk milkList : milks) {
            totalMoney += milkList.getPrice()*milkList.getNumber();
        }
        model.addAttribute("totalMoney",totalMoney);
        model.addAttribute("milks",milks);
        return "shop-car";
    }

    //返回首页
    @RequestMapping("/toIndex")
    public String toIndex(){
        return "redirect:/index.jsp";
    }

    //清空购物车
    @RequestMapping("/toPay")
    public String toPay(HttpSession session){
        shopCarService.deleteShopCar(Integer.parseInt(session.getAttribute("userIdInfo").toString()));
        return "pay";
    }
}
