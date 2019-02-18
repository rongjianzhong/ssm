package com.zking.warehouse.mapper;

import com.zking.warehouse.model.Storedetail;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StoredetailMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(Storedetail record);

    int insertSelective(Storedetail record);

    Storedetail selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(Storedetail record);

    int updateByPrimaryKey(Storedetail record);

    List<Storedetail> queryStoredetailPage(Storedetail storedetail);

    int updateStoretai(Storedetail storedetail);

    Storedetail getone(Storedetail storedetail);

    int update(Storedetail record);

}