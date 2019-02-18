package com.zking.warehouse.service;

import com.zking.ssm.util.PageBean;
import com.zking.warehouse.model.Storedetail;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface IStoredetailService {
    int deleteByPrimaryKey(String uuid);

    int insert(Storedetail record);

    int insertSelective(Storedetail record);

    Storedetail selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(Storedetail record);

    int updateByPrimaryKey(Storedetail record);

    List<Storedetail> queryStoredetailPage(Storedetail storedetail, PageBean pageBean);

    int updateStoretai(Storedetail storedetail);

    Storedetail getone(Storedetail storedetail);

    int update(Storedetail record);
}