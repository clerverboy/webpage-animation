package com.zyg.service;

import com.zyg.mapper.ShopCarMapper;
import com.zyg.pojo.Milk;
import com.zyg.pojo.ShopCar;

import java.util.List;
import java.util.Map;

public class ShopCarServiceImpl implements ShopCarService{

    private ShopCarMapper shopCarMapper;

    public void setShopCarMapper(ShopCarMapper shopCarMapper) {
        this.shopCarMapper = shopCarMapper;
    }

    public int addMilk(ShopCar shopCar) {
        return shopCarMapper.addMilk(shopCar);
    }

    public int updateNumber(Map map) {
        return shopCarMapper.updateNumber(map);
    }

//    public int updateTotalPrice(Map map) {
//        return shopCarMapper.updateTotalPrice(map);
//    }

    public int deleteMilk(String name) {
        return shopCarMapper.deleteMilk(name);
    }

    public List<Milk> listAllMilk(int uid) {
        return shopCarMapper.listAllMilk(uid);
    }

    public Milk queryMilkByName(String name) {
        return shopCarMapper.queryMilkByName(name);
    }

    public ShopCar queryMilkById(Map map){
        return shopCarMapper.queryMilkById(map);
    }

    public int deleteShopCar(int uid) {
        return shopCarMapper.deleteShopCar(uid);
    }

}
