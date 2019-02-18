package com.zking.basicInfo.mapper;

import com.zking.basicInfo.model.GoodStype;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodStypeMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(GoodStype record);

    GoodStype selectByPrimaryKey(String uuid);

    int updateByPrimaryKey(GoodStype record);

    List<GoodStype> queryGoodStypePage(GoodStype goodStype);
}