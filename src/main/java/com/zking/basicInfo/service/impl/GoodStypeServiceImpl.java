package com.zking.basicInfo.service.impl;

import com.zking.basicInfo.mapper.GoodStypeMapper;
import com.zking.basicInfo.model.GoodStype;
import com.zking.basicInfo.service.IGoodStypeService;
import com.zking.ssm.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class GoodStypeServiceImpl implements IGoodStypeService {
    @Autowired
    private GoodStypeMapper goodStypeMapper;

    @Override
    public int deleteByPrimaryKey(String uuid) {
        return goodStypeMapper.deleteByPrimaryKey(uuid);
    }

    @Override
    public int insert(GoodStype record) {
        return goodStypeMapper.insert(record);
    }

    @Override
    public GoodStype selectByPrimaryKey(String uuid) {
        return goodStypeMapper.selectByPrimaryKey(uuid);
    }

    @Override
    public int updateByPrimaryKey(GoodStype record) {
        return goodStypeMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<GoodStype> queryGoodStypePage(GoodStype goodStype, PageBean pageBean) {
        return goodStypeMapper.queryGoodStypePage(goodStype);
    }
}
