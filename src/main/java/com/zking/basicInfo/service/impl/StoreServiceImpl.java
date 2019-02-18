package com.zking.basicInfo.service.impl;

import com.zking.basicInfo.mapper.StoreMapper;
import com.zking.basicInfo.model.Store;
import com.zking.basicInfo.service.IStoreService;
import com.zking.ssm.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service

public class StoreServiceImpl implements IStoreService {

   @Autowired
   private StoreMapper storeMapper;

    @Override
    public int deleteByPrimaryKey(String uuid) {
        return storeMapper.deleteByPrimaryKey(uuid);
    }

    @Override
    public int insert(Store record) {
        return storeMapper.insert(record);
    }

    @Override
    public int insertSelective(Store record) {
        return storeMapper.insertSelective(record);
    }

    @Override
    public Store selectByPrimaryKey(String uuid) {
        return storeMapper.selectByPrimaryKey(uuid);
    }

    @Override
    public int updateByPrimaryKeySelective(Store record) {
        return storeMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Store record) {
        return storeMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Store> queryStorePage(Store store, PageBean pageBean) {
        return storeMapper.queryStorePage(store);
    }

    @Override
    public List<Store> queryAllStore(Store store) {
        return storeMapper.queryAllStore(store);
    }
}
