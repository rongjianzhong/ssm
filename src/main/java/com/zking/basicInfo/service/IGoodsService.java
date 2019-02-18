package com.zking.basicInfo.service;

import com.zking.basicInfo.model.Goods;
import com.zking.ssm.util.PageBean;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


public interface IGoodsService {
    int deleteByPrimaryKey(String uuid);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);

     //查询全部
    List<Goods> querygoodsPage(Goods goods, PageBean pageBean);

    List<Goods> querygall(Goods goods);
    List<Map<String,Object>> quermap(PageBean pageBean);

    List<Goods> queryGoods(PageBean pageBean);

}