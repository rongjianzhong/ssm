package com.zking.warehouse.service.impl;

import com.zking.ssm.util.PageBean;
import com.zking.ssm.vo.StoreperVo;
import com.zking.warehouse.mapper.StoreoperMapper;
import com.zking.warehouse.model.Storeoper;
import com.zking.warehouse.service.IStoreoperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
@Service
public class StoreoperServiceImpl implements IStoreoperService {
    @Autowired
    private StoreoperMapper storeoperMapper;
    @Override
    public int deleteByPrimaryKey(String uuid) {
        return storeoperMapper.deleteByPrimaryKey(uuid);
    }

    @Override
    public int insert(Storeoper record) {
        return storeoperMapper.insert(record);
    }

    @Override
    public Storeoper selectByPrimaryKey(String uuid) {
        return storeoperMapper.selectByPrimaryKey(uuid);
    }

    @Override
    public int updateByPrimaryKey(Storeoper record) {
        return storeoperMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<StoreperVo> queryStoreoperPage(StoreperVo storeoper, PageBean pageBean) {
        return storeoperMapper.queryStoreoperPage(storeoper);
    }
}
