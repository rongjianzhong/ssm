package com.zking.basicInfo.mapper;

import com.zking.basicInfo.model.Store;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StoreMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(Store record);

    int insertSelective(Store record);

    Store selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(Store record);

    int updateByPrimaryKey(Store record);

    List<Store> queryStorePage(Store store);

    List<Store> queryAllStore(Store store);

}