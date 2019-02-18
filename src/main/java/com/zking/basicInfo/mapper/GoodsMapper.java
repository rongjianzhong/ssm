package com.zking.basicInfo.mapper;

import com.zking.basicInfo.model.Goods;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface GoodsMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);

     //查询全部
    List<Goods> querygoodsPage(Goods goods);

    //查询供应商
    List<Goods> querygall(Goods goods);

    //查询要增加的商品
    List<Map<String,Object>> quermap();


    List<Goods> queryGoods();
}