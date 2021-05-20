package com.zyg.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Milk {

    private int id;
    private String imgUrl;
    private String name;
    private int price;
    private int number;

}
