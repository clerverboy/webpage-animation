package com.zyg.service;

import com.zyg.pojo.Milk;
import com.zyg.pojo.ShopCar;

import java.util.List;
import java.util.Map;

public interface ShopCarService {

    //添加一杯奶茶
    int addMilk(ShopCar shopCar);

    //修改奶茶的数量
    int updateNumber(Map map);

    //修改奶茶的总价格
//    int updateTotalPrice(Map map);

    //通过奶茶的名字删除一杯奶茶
    int deleteMilk(String name);

    //查询全部的奶茶
    List<Milk> listAllMilk(int uid);

    //通过名字查询一杯奶茶
    Milk queryMilkByName(String name);

    //通过id在购物车中查询一杯奶茶
    ShopCar queryMilkById(Map map);

    //清空用户的购物车
    int deleteShopCar(int uid);

}
