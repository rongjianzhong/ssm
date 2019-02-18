package com.zking.basicInfo.service.impl;

import com.zking.basicInfo.mapper.GoodsMapper;
import com.zking.basicInfo.model.Goods;
import com.zking.basicInfo.service.IGoodsService;
import com.zking.ssm.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Transactional
@Service
public class GoodsServiceImpl implements IGoodsService {

    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public int deleteByPrimaryKey(String uuid) {
        return goodsMapper.deleteByPrimaryKey(uuid);
    }

    @Override
    public int insert(Goods record) {
        return goodsMapper.insert(record);
    }

    @Override
    public int insertSelective(Goods record) {
        return 0;
    }

    @Override
    public Goods selectByPrimaryKey(String uuid) {
        return goodsMapper.selectByPrimaryKey(uuid);
    }

    @Override
    public int updateByPrimaryKeySelective(Goods record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Goods record) {
        return goodsMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Goods> querygoodsPage(Goods goods, PageBean pageBean) {
        return goodsMapper.querygoodsPage(goods);
    }

    @Override
    public List<Goods> querygall(Goods goods) {
        return goodsMapper.querygall(goods);
    }

    @Override
    public List<Map<String, Object>> quermap(PageBean pageBean) {
        return goodsMapper.quermap();
    }

    @Override
    public List<Goods> queryGoods(PageBean pageBean) {
        return goodsMapper.queryGoods();
    }
}
