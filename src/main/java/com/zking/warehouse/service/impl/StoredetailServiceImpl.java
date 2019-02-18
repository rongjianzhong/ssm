package com.zking.warehouse.service.impl;

import com.zking.ssm.util.PageBean;
import com.zking.warehouse.mapper.StoredetailMapper;
import com.zking.warehouse.model.Storedetail;
import com.zking.warehouse.service.IStoredetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class StoredetailServiceImpl implements IStoredetailService {
    @Autowired
    private StoredetailMapper storedetailMapper;
    @Override
    public int deleteByPrimaryKey(String uuid) {
        return storedetailMapper.deleteByPrimaryKey(uuid);
    }
    @Override
    public int insert(Storedetail record) {
        return storedetailMapper.insert(record);
    }

    @Override
    public int insertSelective(Storedetail record) {
        return storedetailMapper.insertSelective(record);
    }

    @Override
    public Storedetail selectByPrimaryKey(String uuid) {
        return storedetailMapper.selectByPrimaryKey(uuid);
    }

    @Override
    public int updateByPrimaryKeySelective(Storedetail record) {
        return storedetailMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Storedetail record) {
        return storedetailMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Storedetail> queryStoredetailPage(Storedetail storedetail, PageBean pageBean) {
        return storedetailMapper.queryStoredetailPage(storedetail);
    }

    @Override
    public int updateStoretai(Storedetail storedetail) {
        return storedetailMapper.updateStoretai(storedetail);
    }

    @Override
    public Storedetail getone(Storedetail storedetail) {
        return storedetailMapper.getone(storedetail);
    }

    @Override
    public int update(Storedetail record) {
        return storedetailMapper.update(record);
    }


}
