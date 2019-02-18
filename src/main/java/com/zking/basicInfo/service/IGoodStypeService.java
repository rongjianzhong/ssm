package com.zking.basicInfo.service;

import com.zking.basicInfo.model.GoodStype;
import com.zking.ssm.util.PageBean;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface IGoodStypeService {
    int deleteByPrimaryKey(String uuid);

    int insert(GoodStype record);

    GoodStype selectByPrimaryKey(String uuid);

    int updateByPrimaryKey(GoodStype record);

    List<GoodStype> queryGoodStypePage(GoodStype goodStype, PageBean pageBean);
}