package com.zking.warehouse.mapper;

import com.zking.ssm.vo.StoreperVo;
import com.zking.warehouse.model.Storeoper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface StoreoperMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(Storeoper record);

    int insertSelective(Storeoper record);

    Storeoper selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(Storeoper record);

    int updateByPrimaryKey(Storeoper record);

    List<StoreperVo> queryStoreoperPage(StoreperVo storeoper);
}