package com.zking.basicInfo.service;

import com.zking.basicInfo.model.Store;
import com.zking.ssm.util.PageBean;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface IStoreService {
    int deleteByPrimaryKey(String uuid);

    int insert(Store record);

    int insertSelective(Store record);

    Store selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(Store record);

    int updateByPrimaryKey(Store record);

    List<Store> queryStorePage(Store store, PageBean pageBean);
    List<Store> queryAllStore(Store store);
}