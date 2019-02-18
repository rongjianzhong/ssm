package com.zking.warehouse.service;

import com.zking.ssm.util.PageBean;
import com.zking.ssm.vo.StoreperVo;
import com.zking.warehouse.model.Storeoper;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface IStoreoperService {
    int deleteByPrimaryKey(String uuid);

    int insert(Storeoper record);

    Storeoper selectByPrimaryKey(String uuid);

    int updateByPrimaryKey(Storeoper record);

    List<StoreperVo> queryStoreoperPage(StoreperVo storeoper, PageBean pageBean);
}